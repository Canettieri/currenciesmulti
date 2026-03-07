--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows Midnight Professions currencies.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Protuhj
Special Thanks to Canettieri and Eliote.
--]]

local _, L = ...;

-- Putting these into their own category because otherwise adding 11 elements
-- to the Midnight category would clutter it.
-- I also didn't filter out professions the current character doesn't have in case
-- people want to be able to quickly see alts' moxie amounts by mousing over the other
-- professions' moxies
-- Also, getting the profession info isn't reliable until that info has been pulled and cached
--  there's probably a relatively easy way to wait for this info to be populated, but I
--  think it's overkill for this (for now anyway)

-- Artisan Alchemist's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3256,
    titanId = "TITAN_MIDNTMOXIEALCH",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Alchemy"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Blacksmith's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3257,
    titanId = "TITAN_MIDNTMOXIEBS",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Blacksmithing"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Enchanter's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3258,
    titanId = "TITAN_MIDNTMOXIEENCH",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Enchanting"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Engineer's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3259,
    titanId = "TITAN_MIDNTMOXIEENG",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Engineering"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Herbalist's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3260,
    titanId = "TITAN_MIDNTMOXIEHERB",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Herbalism"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Jewelcrafter's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3262,
    titanId = "TITAN_MIDNTMOXIEJC",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Jewelcrafting"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Leatherworker's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3263,
    titanId = "TITAN_MIDNTMOXIELW",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Leatherworking"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Miner's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3264,
    titanId = "TITAN_MIDNTMOXIEMINING",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Mining"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Scribe's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3261,
    titanId = "TITAN_MIDNTMOXIEINSC",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Inscription"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Skinner's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3265,
    titanId = "TITAN_MIDNTMOXIESKIN",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Skinning"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})

-- Artisan Tailor's Moxie
L:CreateSimpleCurrencyPlugin({
    currencyId = 3266,
    titanId = "TITAN_MIDNTMOXIETAIL",
    noCurrencyText = L["NoMidnightProfCurrency"],
    expName = L.Utils.MakeMenuText(L["Tailoring"]),
    category = "CATEGORY_MIDNIGHTPROFS"
})
