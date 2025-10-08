local ADDON_NAME, L = ...;
local categories = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)["TITAN_PANEL_MENU_CATEGORIES"]

table.insert(categories, L["warwithin"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_TWW")

table.insert(categories, L["dragonf"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_DRAGON")

table.insert(categories, L["shadowl"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_SHADOWLANDS")

table.insert(categories, L["bfa"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_BFA")

table.insert(categories, L["legacy"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_LEGACY")

table.insert(categories, L["misc"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_MISC")

table.insert(categories, L["remix"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_REMIX")
