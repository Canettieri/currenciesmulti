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
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 90
})

-- Carved Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3108,
	titanId = "TITAN_TWWS2R2CREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 90
})

-- Runed Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3109,
	titanId = "TITAN_TWWS2R3CREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 90
})

-- Gilded Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3110,
	titanId = "TITAN_TWWS2R4CREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW",
	forceMax = true,
	weeklyIncrease = 90
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
	titanId = "TITAN_TWWS2CKS",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})
