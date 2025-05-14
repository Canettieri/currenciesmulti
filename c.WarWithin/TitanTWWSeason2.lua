--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the seasonal currencies from The War Within Season 2.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Odysseas68 and Protuhj.
--]]

local _, L = ...;

-- Weathered Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3107,
	titanId = "TITAN_TWWS2R1CREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})

-- Carved Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3108,
	titanId = "TITAN_TWWS2R2CREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})

-- Runed Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3109,
	titanId = "TITAN_TWWS2R3CREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})

-- Gilded Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3110,
	titanId = "TITAN_TWWS2R4CREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})

-- Essence of Kaja'mite (Catalyst charges, max 8)
L:CreateSimpleCurrencyPlugin({
	currencyId = 3116,
	titanId = "TITAN_TWWS2CATALYST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Coffer Key Shard (TWW S2 version)
L:CreateSimpleItemPlugin({
	itemId = 236096,
	titanId = "TITAN_CFFRKYM",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})

-- Radiant Echo (TWW S2 version)
L:CreateSimpleItemPlugin({
	itemId = 235897,
	titanId = "TITAN_RADECHO",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})

-- Algari Token of Merit (TWW S2 version)
L:CreateSimpleItemPlugin({
	itemId = 230793,
	titanId = "TITAN_ALGTOKENOFMERIT",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})

-- Puzzling Cartel Chip
L:CreateSimpleItemPlugin({
	itemId = 237502,
	titanId = "TITAN_PUZZCARTCHIP",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})
