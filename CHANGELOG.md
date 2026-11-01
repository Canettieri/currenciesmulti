# Changelog

All notable changes to this project will be documented in this file.

## [12.0.0] - 2026-11-01

### Added

- Added a dedicated Forever (Camelot, interface 16001) manifest with five player-facing currencies, Gold, and character-data management.
- Added Forever trackers for Merchant's Favor, Tarnished Undermine Real, Darkmoon Prize Ticket, Honor Points, and Rank Points.
- Added a separate Forever currency tracker that tolerates missing or delayed data, refreshes localized names and icons, reads caps from the client, and preserves session baselines across temporary data loss.
- Added a Forever menu category, translations, compatibility notes, and mocked tests.

### Fixed

- Guard Gold's optional account-bank lookup when bank APIs or enum values are unavailable.

## [11.13.1] - 2026-10-13

### Fixed

- Updating interface version for 12.1.5

## [11.13.0] - 2026-10-05

### Changed

- Added visual spacing after the **Bar Text** and **Tooltip** options in currency plugin menus, including the Artifact Power and Jelly menus; the separator remains after **Bar Position**.
- Updated the release workflow to publish notes for the tagged version only.
- Adopted the Keep a Changelog structure and configured packaged releases to use `CHANGELOG.md`.

### Fixed

- Updating for Titan Panel v9.9.3 which changed Titan_Global to Titan_G, which broke some button text rendering.

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

[12.0.0]: https://github.com/Canettieri/currenciesmulti/releases/tag/v12.0.0
[11.13.1]: https://github.com/Canettieri/currenciesmulti/releases/tag/v11.13.1
[11.13.0]: https://github.com/Canettieri/currenciesmulti/releases/tag/v11.13.0
[11.12.0]: https://github.com/Canettieri/currenciesmulti/releases/tag/v11.12.0
