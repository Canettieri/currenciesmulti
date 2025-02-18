--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows currencies/items from The War Within prepatch event.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Residual Memories
-- Really unused, but still shows in the currency tab
L:CreateSimpleCurrencyPlugin({
	currencyId = 3089,
	titanId = "TITAN_RESIDMEMORIES",
	noCurrencyText = L["NoTWWCurrency01"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
})
