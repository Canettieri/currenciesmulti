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
	category = "CATEGORY_MIDNIGHT",
	forceMax = true
})

-- Veteran Dawncrests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3341,
	titanId = "TITAN_MIDNTVETERANCREST",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT",
	forceMax = true
})

-- Champion Dawncrests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3343,
	titanId = "TITAN_MIDNTCHAMPIONCREST",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT",
	forceMax = true
})

-- Hero Dawncrests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3345,
	titanId = "TITAN_MIDNTHEROCREST",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT",
	forceMax = true
})

-- Myth Dawncrests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3347,
	titanId = "TITAN_MIDNTMYTHCREST",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT",
	forceMax = true
})

-- Dawnlight Manaflux (Midnight S1 Catalyst charges, max 8)
L:CreateSimpleCurrencyPlugin({
	currencyId = 3378,
	titanId = "TITAN_MIDNTS1CATALYST",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT",
	forceMax = true
})

-- Coffer Key Shard (Midnight S1 version)
L:CreateSimpleCurrencyPlugin({
	currencyId = 3310,
	titanId = "TITAN_CFFRKYM",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT"
})

-- Radiant Echo (Midnight S1 version)
L:CreateSimpleItemPlugin({
	itemId = 254275,
	titanId = "TITAN_MIDNTRADECHO",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT"
})

-- Spark of Radiance (Midnight S1 crafting spark)
L:CreateSimpleItemPlugin({
	itemId = 232875,
	titanId = "TITAN_MIDNTS1SPARK",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT"
})

-- Thalassian Token of Merit
L:CreateSimpleItemPlugin({
	itemId = 258556,
	titanId = "TITAN_MIDNTS1TTOM",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT"
})

-- Untainted Mana-Crystals (Midnight S1 Delves)
-- Reused ID from TWW S3
L:CreateSimpleCurrencyPlugin({
	currencyId = 3356,
	titanId = "TITAN_TWWS3UNTMANACRYS",
	noCurrencyText = L["NoMidnightSeason1"],
	expName = L["mMidnightS1"],
	category = "CATEGORY_MIDNIGHT",
	forceMax = true
})
