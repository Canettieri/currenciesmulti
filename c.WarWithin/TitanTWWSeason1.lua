--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the seasonal currencies from The War Within Season 1.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Weathered Harbinger Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2918,
	titanId = "TITAN_WEATHHARBCREST",
	noCurrencyText = L["TWWSeason1"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Carved Harbinger Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2919,
	titanId = "TITAN_CARVEDHARBCREST",
	noCurrencyText = L["TWWSeason1"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Runed Harbinger Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2920,
	titanId = "TITAN_RUNEDHARBCREST",
	noCurrencyText = L["TWWSeason1"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Gilded Harbinger Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2921,
	titanId = "TITAN_GILDHARBCREST",
	noCurrencyText = L["TWWSeason1"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
	forceMax = true
})
