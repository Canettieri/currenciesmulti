# Forever currencies

Reviewed 2026-11-01. The Forever client exposes `C_CurrencyInfo`, and public beta
data includes five player-facing currencies. The addon loads these through its
Camelot manifest, alongside the existing Gold and character-management plugins.

| Currency | ID | Source |
| --- | ---: | --- |
| Merchant's Favor | 3402 | [Client currency record](https://thewowdb.com/wow-forever/currency/merchant-s-favor-3402/) |
| Tarnished Undermine Real | 3469 | [Client currency record](https://thewowdb.com/wow-forever/currency/tarnished-undermine-real-3469/) |
| Darkmoon Prize Ticket | 515 | [Client currency record](https://thewowdb.com/wow-forever/currency/darkmoon-prize-ticket-515/) |
| Honor Points | 1792 | [Client currency record](https://thewowdb.com/wow-forever/currency/honor-points-1792/) |
| Rank Points | 3468 | [Client currency record](https://thewowdb.com/wow-forever/currency/rank-points-3468/) |

## API and scope

- [Forever currency API](https://github.com/Gethe/wow-ui-source/blob/forever/Interface/AddOns/Blizzard_APIDocumentationGenerated/CurrencyInfoDocumentation.lua): `GetCurrencyInfo` can return nothing; the tracker must handle this at startup and later.
- [Camelot character frame](https://github.com/Gethe/wow-ui-source/blob/forever/Interface/AddOns/Blizzard_UIPanels_Game/Camelot/CharacterFrame.lua): `TokenFrame` remains the currency tab, used by left-click shortcuts.
- [Blizzard's PvP explanation](https://www.wowhead.com/forever/blue-tracker/news/us/how-pvp-progression-in-world-of-warcraft-forever-works-world-of-warcraft-24303316): Honor is spent on gear; Rank Points drive rank progression.
- [Legacy constants](https://github.com/Gethe/wow-ui-source/blob/forever/Interface/AddOns/Blizzard_APIDocumentationGenerated/LegacyConstantsDocumentation.lua): Legacy points use a trait-currency ID, so they are not added as an ordinary `C_CurrencyInfo` currency.

All caps come from the running client. No beta cap, weekly increment, or PvP
rank curve is hardcoded. Rank Points (3468) are distinct from the internal
renown rank counter (3473); the latter is not treated as a spendable currency.
Other hidden counters and Classic item-based event tokens are not included
without confirmation that they are used by Forever. A beta database record
does not guarantee current server availability.

## Implementation

`c.Forever/TitanForever.lua` declares the currency plugins, following the same
`c.<expansion>/Titan*.lua` layout as the other expansions. The supporting menu
and tracking code stays in `Core/Forever/`.

`Core/Forever/CurrencyPlugin.lua` is independent of Retail/Mists currency engines.
It registers stable plugin entries before currency data arrives, then retries
on world entry, currency events (including an unspecified currency ID), and
polling. Unavailable or secret quantities display `--` without overwriting
saved balances or resetting the first-readable session baseline. A readable
zero is recorded normally. Names and icons refresh when data becomes available.

Alt totals are cached observations stored through the existing character-table
format. They do not require Warband currency APIs and are not live account
totals. The existing character-management plugin can remove these observations.
Retail and Mists manifests load no Forever files. The shared Gold change only
guards optional account-bank APIs and handles missing values safely.

## Validation

Run `lua tests/forever.lua` from the addon root with Lua 5.1. Tests cover delayed
data, zero and missing quantities, recovery, localized metadata, dynamic caps,
season/weekly fields, saved alt totals, filters, menus, and Gold with absent
bank APIs. The tests are excluded from release packages.

In-game validation is still required for actual currency availability, native
secret values, currency-window access, Titan layout, and server-specific caps.
