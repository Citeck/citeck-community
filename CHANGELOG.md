<!-- Keep a Changelog guide -> https://keepachangelog.com -->

# Citeck Changelog

## [2025.1.3] - 2025-05-26

### Added

- Workspaces for user collaboration on a specific set of functional capabilities, documents, files, processes
- Corporate portal with new widgets "Wiki", "News", "Welcome" that keeps together various tools, information and services in one place
- New journal design
- Functional modules (Service desk, Contracts and etc) are allocated over workspaces
- Workspace support for left menu
- Updated module Assignments for work with workspaces
- Anonymous [Umami usage analytics](https://umami.is/docs). Umami does not collect or store personal data, avoiding the need for cookies, and is GDPR and PECR compliant. 
- Data types. UNIQUE setting to text attribute
- BPMN. Calendar notifications option
- BPMN. User task. Set task due date with working-calendar option
- Ability to apply theme from Themes journal
- User profile. Separated user rights to edit profile attributes
- Notification Service. Test message setting
- Global search for types in ecos-model:  by documents (types can be customized), people (users), workspaces.
- Ability to setup list view data display mode
- Ability to create empty document (document, spreadsheet, presentation) in workspace doclib
- Colored Formatter. New functions
- Orgstructure component. Ability to set dynamically the root group (via scripts depending on the conditions on the form)
- React JS updated to version 18.3

#### Fixed

- Template generation functionality problem after upgrading transformation microservice version
- Service desk. Mis-calculatings in SLA, resolution field, incorrect due date calculation
- Service desk. SLA is calculated incorrectly
- Journal "Menu". Error loading actions.
- Contracts. Error in process of supplementary agreements
- Contracts. Permissions Denied error
- Notification templates. Column filtering does not work
- Doclib. Link to download the document leads to the card itself
- Document Widget. Error when uploading multiple files
- Document Widget. Document preview does not work for txt, html, xml, json, yaml file types
- System artifacts can't be added to ecos-app
- BPMN. Error on handling catch event transaction
- Profile. Mandatory fields
- Orgstructure. Deleting a parent group

## [2024.10] - 2025-01-27

### Added

- BPMN. Added new BPMN event - User Action
- BPMN. Event type Signal.Added select status from component
- Kanban board. Added setting "Card fields label layout" 
- Service Desk. New widget "Remaining time" displays remaining SLA time for each technical support line
- Service Desk. Added SLA2 to journal
- Module "Contracts". Updated with DMN approval process 
- Optimized attributes calculation for email multi-templates
- Journals. Optimized data loading and data display
- Doclib. Uploading multiple files, folder with subfolders and files, deleting and moving files and folders, validation of identical files

#### Fixed

- Data type is ignored when uploading to excel
- SLA doesn't change when the priority is changed
- Module "ORD". Business process doesn't start
- Service Desk. Can't change status of ticket
- Name can't be changed for old journal settings
- KeyManagementException: problem accessing trust store
- Module "Order pass". Notification error

## [2024.8.3] - 2024-10-21

### Fixed

- Journal settings. Empty filter list
- Journal settings. Error when opening grouped data
- Journal settings. Drop-down list does not open in the journal's columns setup
- Journal template. Changed column order is not saved in the template
- Journal template. Journal templates are without scrolling
- Journal. Export from journal dosn't work with time-interval filter
- Active tasks. Incorrect pagination
- Orstructure. Double scrolls

## [2024.8] - 2024-09-29

### Added

- Updated microservices and libraries: java 21, java spring boot 3.3.2, spring 6.1.11, kotlin 2.0.0, camunda 7.21.0, all other dependencies up to the latest stable versions
- Script engine changed to GraalVM JS
- Module "Vacations"
- Kanban board. New column setting "Hide items older than"
- System attribute _statusModified, that stores status' last change date
- Updated document library UI: folder tree view by default, file dashboard, actions
- Filter on document attributes for BPMN tasks
- Orgstructure. Search by additional field.

### Fixed

- BPMN. Error send task when saving to draft model 
- Search by expressions in journal
- Redundant fields in form builder
- Displayed incorrectly total sum in columns
- Incorrectly calculated SLA2 if SLA2 expired
- Service Desk. Incorrect error message
- Orgstructure. Incorrect search


## [2024.7] - 2024-07-08

### Added

- History-config aspect to enable configuration to write properties to history (widget and journal).
- Updated currency data list.
- Multiple select from orgstructura for journal templates.
- BPMN process setting "Auto delete process". When deleting an object of the specified type, the process will be deleted automatically.

### Fixed

- Empty orgstructure component when selecting users.
- No user name in the Comment widget.
- Filtering project users when mentioning in comments
- Duplicateted content in the database.
- Duplicated 'group-action-change-owner' configuration within group actions.
- Error while process start: Process definition with id not found.
- User form editing if a date of birth field is filled.
- Contracts module. When document is generated from template business process stays in draft status
- Document types' names are not displayed in the Documents tab of the dashboard
- Error 'Source is not found with id 'type' and type 'ru.citeck.ecos.records2.source.dao.MutableRecordsDao' when saving a data type.

## [2024.4] - 2024-04-19

### Added

- Journal multiple agregation by filter: the ability to add several columns with specified names with different filter settings.
- "History Configuration" aspect to configurate attributes which changes won't be recorded to history journal and widget history.
- Improved Orgstructure: ability to add existing groups or users to a group.
- Improved transaction system.

### Fixed

- Missed business rule task on BPMN elements.
- "Read timed out" error during camunda process.
- filter with predicate "Not equal".
- Uploading 2 or more documents to the card in the Module "Contracts".
- Synchronization with document widget in the Module "Contracts".

## [4.9.0] - 2024-02-15

### Added

- Ability to change and save column width in a table view.
- Ability to load source associations for records from other database.
- Developed external attributes mixins.
- Defined formats for the Print action.
- Entities are copied with child associations.
- Ability to enter a condition for the "Color" formatter.
- Added a new "Duration" formatter. When formatter is enabled, the duration will be transformed into hours, like 2d 3h 30m = 51h 30m
- Added Work schedule and production calendar, which is a functionality for accounting for non-working days and holidays.
- Ability to get in the action a link to download a file (using config: implSourceId) is added to the card object.

### Fixed

- Attribute with storage type "None" is not computed.
- Journal grouping now work for groupable assoc attribute.


## [4.8.0] - 2023-12-07

### Added

- Added journal "Tasks of subordinates" where manager can see subordinates' tasks
- Realized BPMN workflow for nested data type
- Added linters for BPMN diagrams than check BPMN diagrams for common BPMN and special ECOS issues.
- Updated default curreny data list
- Added permissions for BPMN and data types
- Added OpenOffice component to preview documents
- Added agregation count column at journal settings

### Fixed

- User synchronization error
- Group action "Download as Zip"
- Lag when loading BPMN editor
- Error on action to send to introduction at module "ORD"
- Multiple choice ecos-select values are stored
- Permission matrix for module "Offers"
- Missing actions in journals at modules "Correspondence. Income documents", "Contracts", "ORD"
- OpenOffice component to preview documents

## [4.7.0] - 2023-09-26

### Added
- Created new readable process model for module "Offers" 
- Renamed tasks buttons in module "Offers" 
- Added option "Save as draft" in BPMN editor
- Module "ORD" added
- Attributes "Registration number" and "Date received", "Initiator" are added in module "Correspondence. Income documents"
- Card content is closed for editing in module "Correspondence. Income documents"

### Fixed
- Error "Records can't be mutated until schema version will be fully migrated. Current schema version: 4 Expected schema version: 5"
- No history entry in Events history after creating an assignments with this document
- Bugs in module "Correspondence. Income documents"

## [4.6.0] - 2023-08-25

### Added
- Expand the capabilities of search queries by implementing table joining support
- Ecos BPMN component - Errors Events
- Ecos BPMN component - Terminate Event
- Ecos BPMN component - Conditional Event
- Ecos BPMN component - Service Task
- Add functions support for ecos-data queries
- Change modifier, creator and type columns type to ASSOC
- Develop doclib backend in ecos-model
- Matrix Permission - support custom permissions
- Dynamic roles based on DMN
- Add notification template locale selection based on user and system properties
- Add ability to group and sort by fields from joined tables in ecos-data
- Type localization in the legal-entity-type
- Offers: add the ability to reject and close an request
- Add dashboard for license
- Module "Correspondence. Income documents" added

### Fixed
- Action "Print" change url for version without alfresco
- Active tasks journal. The link does not open the counterparty card
- Active tasks/Completed tasks journal. The content preview does not work
- The “Upload to XML” action does not work
- Association search does not work in the main log search
- Offers: kanban board should display only candidates on the request
- The grouping in the journal does not work
- orgstructure: alfresco user base does not open
- Tasks statistics: no data are displayed in the widget
- DMN/BPMN: no localization when uploading the model
- Error while loading document
- No localization of Save/Submit buttons
- Missing BP names
- Data types without a name
- Unable to delete versioned file from Documents widget
- The task is not assigned to an performer
- Txn changed records doesn't rolled back after error
- Finance: error in the execution of the bp
- Finance: Error when starting the process in a Sales Request
- Transformation. Unexpected response code while generating document from template
- Missing history for tasks without form
- The patches are applied too slowly when deploying the system from scratch
- Group action download as Zip does not work
- Fields are not protected
- BPMN: incorrect pattern in a data model
- “Error: App unavailable: alfresco” while saving nested docs
- Issue with displaying properties of data types
