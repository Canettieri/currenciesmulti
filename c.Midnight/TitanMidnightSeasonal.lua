--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the seasonal currencies from Midnight.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: edurne85
Data based on information available on Wowhead and in-game.
--]]

local _, L = ...;

-- Adventurer Dawncrests
L:CreateSimpleCurrencyPlugin({
    currencyId = 3383,
    titanId = "TITAN_MIDNTADVENTURERCREST",
    noCurrencyText = L["NoMidnightSeason1"],
    expName = L["mMidnightS1"],
    category = "CATEGORY_MIDNIGHT"
})

-- Veteran Dawncrests
L:CreateSimpleCurrencyPlugin({
    currencyId = 3341,
    titanId = "TITAN_MIDNTVETERANCREST",
    noCurrencyText = L["NoMidnightSeason1"],
    expName = L["mMidnightS1"],
    category = "CATEGORY_MIDNIGHT"
})

-- Champion Dawncrests
L:CreateSimpleCurrencyPlugin({
    currencyId = 3343,
    titanId = "TITAN_MIDNTCHAMPIONCREST",
    noCurrencyText = L["NoMidnightSeason1"],
    expName = L["mMidnightS1"],
    category = "CATEGORY_MIDNIGHT"
})

-- Hero Dawncrests
L:CreateSimpleCurrencyPlugin({
    currencyId = 3345,
    titanId = "TITAN_MIDNTHEROICCREST",
    noCurrencyText = L["NoMidnightSeason1"],
    expName = L["mMidnightS1"],
    category = "CATEGORY_MIDNIGHT"
})

-- Myth Dawncrests
L:CreateSimpleCurrencyPlugin({
    currencyId = 3347,
    titanId = "TITAN_MIDNTMYTHICCREST",
    noCurrencyText = L["NoMidnightSeason1"],
    expName = L["mMidnightS1"],
    category = "CATEGORY_MIDNIGHT"
})
