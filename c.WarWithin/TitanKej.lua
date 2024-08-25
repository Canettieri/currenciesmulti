--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Kej currency.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Kej
L:CreateSimpleCurrencyPlugin({
	currencyId = 3056,
	titanId = "TITAN_KEJ",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
})