--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows currencies/items from The War Within prepatch event.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Residual Memories
L:CreateSimpleCurrencyPlugin({
	currencyId = 3089,
	titanId = "TITAN_RESIDMEMORIES",
	noCurrencyText = L["TWWEventOnly"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
})

-- Memory of Kalimdor
L:CreateSimpleItemPlugin({
	itemId = 223644,
	titanId = "TITAN_MEMKALIMDOR",
	noCurrencyText = L["TWWEventOnly"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW"
})
