--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the seasonal currencies from The War Within Season 1.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Harmonized Silk (Catalyst charges, max 8 currently)
-- Will probably become OBE once S2 starts
L:CreateSimpleCurrencyPlugin({
	currencyId = 2813,
	titanId = "TITAN_HARMONSILK",
	noCurrencyText = L["TWWSeason1"],
	expName = L["mWarWithinS1"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Coffer Key Shard
-- Will probably become OBE once S2 starts
L:CreateSimpleItemPlugin({
	itemId = 229899,
	titanId = "TITAN_CFFRKYM",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithinS1"],
	category = "CATEGORY_TWW"
})