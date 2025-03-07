--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the seasonal currencies from The War Within Season 2.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Odysseas68.
--]]

local _, L = ...;

-- Weathered Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3107,
	titanId = "TITAN_WEATHUNDECREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Carved Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3108,
	titanId = "TITAN_CARVEDUNDECREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Runed Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3109,
	titanId = "TITAN_RUNEDUNDECREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Gilded Undermine Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 3110,
	titanId = "TITAN_GILDUNDECREST",
	noCurrencyText = L["TWWSeason2"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Coffer Key Shard
L:CreateSimpleItemPlugin({
	itemId = 236096,
	titanId = "TITAN_CFFRKYM",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithinS2"],
	category = "CATEGORY_TWW"
})