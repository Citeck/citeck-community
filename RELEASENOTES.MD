2026.1

# Added

- The developer console for administrators. Allows executing JavaScript code directly in the browser with results displayed
- Journals. Exporting data to HTML, Excel, or CSV files
- Journals. Importing files (Excel) into the system using a template, importing users and groups
- Assignment form. Description field editor replaced from CKEditor to Lexical
- Сonfigurable status change capability to DocStatus widget
- WYSIWYG editor. Automatic Markdown format detection
- Kanban board. Card grouping by record attributes
- Server-side localization support
- Data type. The ability to set rules for generating the local part of the identifier
- Extend validation pattern for data model values in BPMN forms
- Added hoursPerDay (person-days) mode to DurationFormatter

# Fixed

- Deleted entries in local Forms and Journals are counted in the counters
- Options attribute is constantly updated with any changes in document
- Search doesn't work for computed associations
- Bpmn scheme does't move
- Unexpected navigation to the default workspace
- Script task. Incorrect throw error
- The template of the print form breaks for an unreadable symbol
- Error when adding a video to an attachment
- The Select Orgstruct component is not displayed on the form in inline editing mode.