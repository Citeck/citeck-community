![Citeck ECOS Logo](https://raw.githubusercontent.com/Citeck/ecos-ui/master/public/img/logo/ecos-logo.svg)

# Citeck Community

**Read this in other languages: [Русский](README.RU.MD)**

This repository provides a Docker Compose setup for running the `Citeck Community`. The Citeck is an
enterprise content management system that allows managing business processes, documents, and tasks.

## Prerequisites

Make sure you have the following prerequisites installed on your system:

- Docker: [Install Docker](https://docs.docker.com/engine/install/)
- Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)
- 16 gb RAM for docker engine

## Installation

#### 1. Clone this repository:

```bash
git clone https://github.com/citeck/citeck-community.git
```

**Note**: citeck-community comes with pre-filled demo data. To disable this setting before deploying the stand go to
the `\services\environments folder` and in file `demo_data.env` change setting `WITH_DEMO_DATA` from **true** to **false**.

#### 2. Navigate to the cloned repository:

```bash
cd citeck-community
```

#### 3. Start the Docker Compose setup:

```bash
docker-compose up -d
```

This command will build and start the necessary Docker containers. It may take a few minutes to download the required
images and set up the environment.

#### 4. Access the Citeck Community:

Once the Docker containers are up and running, you can access the
Citeck Community by opening your web browser and visiting `http://localhost/`. The demo should be
available at this URL.

## Usage

The Citeck Community provides a pre-configured environment for testing and exploring the capabilities of the
Citeck system. You can log in using the following credentials:

- Username: `admin`
- Password: `admin`

Please note that this is a demo setup, and it is not recommended for production use. If you want to use Citeck in a
production environment, please refer to the official documentation for deployment instructions.

## Stop and Cleanup

To stop and remove the Docker containers, you can use the following command:

```bash
docker-compose down
```

This will stop and remove the containers, but it will keep the downloaded images on your system. If you want to remove
the images as well, you can use the `--volumes` flag:

```bash
docker-compose down --volumes
```

## Additional Resources

For more information about Citeck and its features, please refer to the official
documentation: [Citeck Documentation](https://citeck-ecos.readthedocs.io/ru/latest/index.html)

## License

This Docker Compose setup is licensed under the [LGPL License](LICENSE). Please note that Citeck has its own
licensing terms and conditions, which you should review separately.

## Warning

Please do not try to download the repository as an archive, download the repository using git clone
