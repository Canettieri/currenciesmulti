local ADDON_NAME, L = ...;
local categories = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)["TITAN_PANEL_MENU_CATEGORIES"]

table.insert(categories, L["shadowl"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_SHADOWLANDS")

table.insert(categories, L["bfa"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_BFA")

table.insert(categories, L["legacy"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_LEGACY")

table.insert(categories, L["misc"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_MISC")
