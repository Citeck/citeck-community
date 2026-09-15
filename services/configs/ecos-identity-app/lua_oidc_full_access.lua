local opts = {
    redirect_uri = "/v2",
    accept_none_alg = true,
    discovery = "http://ecos-identity-app:8080/auth/realms/ecos-app/.well-known/openid-configuration",
    introspection_endpoint_auth_method = "client_secret_basic",
    client_id = "ecos-proxy-app",
    client_secret = "2996117d-9a33-4e06-b48a-867ce6a235db",
    redirect_uri_scheme = "http",
    logout_path = "/logout",
    redirect_after_logout_uri = "http://localhost/ecos-idp/auth/realms/ecos-app/protocol/openid-connect/logout?redirect_uri=http://localhost",
    -- session_contents = {id_token=true},
    redirect_after_logout_with_id_token_hint = false,
    ssl_verify = "no",
    scope = "openid profile",
    auth_accept_token_as = "cookie:PA"
  }
  
  local tokenAuthTime;
  local tokenIss;
  local tokenFromSession = true;
  
  local function introspect(options)
  
    local res, err = require("resty.openidc").introspect(options)
    if (err) then
      -- Bearer token is not valid
      ngx.log(ngx.ERR, err)
    else
      if res then
        tokenAuthTime = res.auth_time;
        tokenIss = res.iss;
        tokenFromSession = false;
        return res.username
      end
    end
    return nil
  end
  
  -- Is this open page request or not
  -- This checking required because redirect
  -- status for other types of requests wont
  -- lead to URL change in browser
  local function isNavigateRequest()
  
    if ngx.var.request_method ~= 'GET' then
      return false;
    end
  
    local fetchMode = ngx.req.get_headers()["Sec-Fetch-Mode"]
    if fetchMode ~= nil then
      return fetchMode == "navigate";
    else
      local acceptHeader = ngx.req.get_headers()["Accept"]
      if acceptHeader ~= nil then
          -- starts with text/html
          return acceptHeader:find("text/html", 1, true) == 1;
      else
          return false;
      end
    end
  end
  
  local function is_gateway_public_uri(uri)
      if not string.find(uri, "/pub/") then
          return false
      end
      local publicUri = {
          "^/gateway/pub/.+",
          "^/gateway/[^/]+/pub/.+"
      }
      for _, pattern in ipairs(publicUri) do
          if string.match(uri, pattern) then
              return true
          end
      end
      return false
  end
  
  local function authenticate(options)
  
    -- We should not send redirect status when navigate == false because custom fetch requests
    -- in this situation doesn't open new location in browser and just tries to send new request as other fetch
    -- and we got cors error. When we send 401 status to client it can reload page and handle redirect
    -- when navigate == true.
    local unauthAction = 'deny'
    if isNavigateRequest() then
      unauthAction = nil
    end
  
    local res, err = require("resty.openidc").authenticate(options, nil, unauthAction)
  
    if err then
      if unauthAction == nil and (
          string.find(err, "unhandled request to the redirect_uri")
          or string.find(err, "does not match state restored from session")
          or string.find(err, "Session not active")
      ) then
        ngx.redirect("/");
      else
        ngx.status = 401
        ngx.say(err)
        ngx.exit(ngx.HTTP_UNAUTHORIZED)
      end
    end
  
    if res then
      tokenIss = res.id_token.iss;
      tokenAuthTime = res.id_token.auth_time;
      return res.id_token.preferred_username
    else
      return nil
    end
  end
  
  local userName;

  -- Match only the request PATH for the shortcuts below. request_uri also holds
  -- the query string, so matching against it lets an unauthenticated client
  -- smuggle a marker via a query parameter (e.g. ?probe=/healthcheck/), bypassing
  -- OIDC. Cut at the first query delimiter, treating an encoded "?" (%3f) as one
  -- too since nginx leaves request_uri undecoded.
  local reqPath = ngx.var.request_uri
  local queryStart = reqPath:find("?", 1, true)
  local encQuery = reqPath:find("%%3[fF]")
  if encQuery and (not queryStart or encQuery < queryStart) then queryStart = encQuery end
  if queryStart then
    reqPath = reqPath:sub(1, queryStart - 1)
  end
  
  
  
  
  
  
  if string.find(reqPath, "/alfresco/monitoring") then
    userName = "guest";
  end
  
  if string.find(reqPath, "/logout") then
    ngx.header["Set-Cookie"] = "JSESSIONID=; Path=/share/; HttpOnly";
  end
  
  -- Check the access token from the cookie PA
  if userName == nil and ngx.var.cookie_PA ~= nil and ngx.var.cookie_PA ~= "" then
    userName = introspect(opts)
  end
  
  if userName == nil then
    -- Check the access token from the Authorization header
    local header = ngx.req.get_headers()["Authorization"]
  
    if header ~= nil then
      opts['auth_accept_token_as'] = nil;
      userName = introspect(opts);
    end
  end
  
  -- If we are not authenticated by cookie check session and if session doesn't has valid
  -- authorization information redirect to authentication server (keycloak).
  -- If session already has valid credentials request will be passed to a target location
  if userName == nil then
    userName = authenticate(opts)
  end
  
  
  if userName == nil then
  
    ngx.status = 403
    ngx.say(err)
    ngx.exit(ngx.HTTP_FORBIDDEN)
  
  else
  
    ngx.req.set_header("X-Alfresco-Remote-User", userName);
    ngx.req.set_header("X-ECOS-User", userName);
    ngx.var.oidc_user = userName;
  
  end