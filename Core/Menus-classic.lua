local ADDON_NAME, L = ...;
local categories = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)["TITAN_PANEL_MENU_CATEGORIES"]

table.insert(categories, L["legacy"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_LEGACY")

table.insert(categories, L["mop"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_CURRENT") -- Expansão atual do Clássico

table.insert(categories, L["misc"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_MISC")