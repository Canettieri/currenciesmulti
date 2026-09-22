# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Changed

- Added visual spacing after the **Bar Text** and **Tooltip** options in currency plugin menus, including the Artifact Power and Jelly menus; the separator remains after **Bar Position**.
- Updated the release workflow to publish notes for the tagged version only.
- Adopted the Keep a Changelog structure and configured packaged releases to use `CHANGELOG.md`.

## [11.12.0] - 2026-09-21

### Added

- Added localized **Bar Position**, **Move Right**, and **Move Left** menu labels for every supported language.
- Added missing localization entries for Midnight, Midnight professions, Housing, Delves, The War Within, character-data management, and other active plugins.
- Added missing explanatory text for currencies and resources whose tooltips previously fell back to `nil` or untranslated values.
- Added removed-plugin IDs to the saved-data cleanup list so obsolete character data is deleted automatically.

### Changed

- Standardized currency plugin menus with a dedicated **Bar Position** section, followed by **Move Right** and **Move Left**.
- Grouped the separator, **Hide**, and **Close** commands at the bottom of plugin menus.
- Completed and synchronized the German, Spanish, French, Korean, Brazilian Portuguese, and Russian localization catalogs with the English source.
- Reordered the Brazilian Portuguese localization file to follow the English catalog while preserving its translations.
- Corrected the Brazilian Portuguese menu labels to **Mover à Direita** and **Mover à Esquerda**, including capitalization and the required grave accent.
- Documented all 172 Retail trackers and all 28 Mists of Pandaria Classic trackers, organized by expansion and activity.
- Updated the README's feature, usage, language, support, missing-currency, and donation sections.

### Fixed

- Fixed the common plugin menu error caused by attempting to read an undefined localization table.
- Fixed missing localization values that could produce incomplete or `nil` menu and tooltip information.
- Added the missing localized Azerite Power label used by the Battle for Azeroth Artifact Power plugin.
- Standardized localization key order and removed duplicate or obsolete entries across supported languages.

### Removed

- Removed the following obsolete Retail trackers:
  - Bronze Celebration Token
  - Residual Memories
  - Titan Residuum
  - Lovely Charm
  - Twilight's Blade Insignia
  - Hellstone Shard
- Removed the corresponding obsolete localization entries and `.toc` references.
- Removed obsolete currencies from the README.

[unreleased]: https://github.com/Canettieri/currenciesmulti/compare/v11.12.0...HEAD
[11.12.0]: https://github.com/Canettieri/currenciesmulti/releases/tag/v11.12.0
