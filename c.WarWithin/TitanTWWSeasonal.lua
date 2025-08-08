--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the seasonal currencies from The War Within.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Odysseas68 and Protuhj.
--]]

local _, L = ...;

-- After TWW, we can convert the IDs to generic seasonal IDs

-- Weathered Ethereal Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3284,
	titanId = "TITAN_TWWS2R1CREST",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 90,
})

-- Carved Ethereal Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3286,
	titanId = "TITAN_TWWS2R2CREST",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 90,
})

-- Runed and Gilded are not earnable until the season actually starts

-- Runed Ethereal Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3288,
	titanId = "TITAN_TWWS2R3CREST",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 90,
})

-- Gilded Ethereal Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3290,
	titanId = "TITAN_TWWS2R4CREST",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 90,
})

-- Ethereal Voidsplinter (TWW S3 Catalyst charges, max 8)
L:CreateSimpleCurrencyPlugin({
	currencyId = 3269,
	titanId = "TITAN_TWWS3CATALYST",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Coffer Key Shard (TWW S3 version)
L:CreateSimpleItemPlugin({
	itemId = 245653,
	titanId = "TITAN_CFFRKYM",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW"
})

-- Radiant Echo (TWW S3 version)
L:CreateSimpleItemPlugin({
	itemId = 246771,
	titanId = "TITAN_RADECHO",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW"
})

-- Algari Token of Merit (TWW S3 version)
L:CreateSimpleItemPlugin({
	itemId = 248242,
	titanId = "TITAN_ALGTOKENOFMERIT",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW"
})

-- Untainted Mana Crystals (S3 Delves)
L:CreateSimpleCurrencyPlugin({
	currencyId = 3356,
	titanId = "TITAN_TWWS3UNTMANACRYS",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 125,
})

-- Ethereal Strands (S3 Cloak upgrade currency)
-- This is a "Warband Currency"
-- Thanks to Reselsnark on Github
L:CreateNoAltCurrencyPlugin({
	currencyId = 3278,
	titanId = "TITAN_TWWS3ETHEREALSTRAND",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW",
	forceMax = true,
})
