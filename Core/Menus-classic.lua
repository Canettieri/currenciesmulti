local ADDON_NAME, L = ...;
local categories = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)["TITAN_PANEL_MENU_CATEGORIES"]

table.insert(categories, L["wotlk"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_LEGACY")

table.insert(categories, L["cata"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_CATA")

table.insert(categories, L["misc"])
table.insert(TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY, "CATEGORY_MISC")