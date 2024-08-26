--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Mereldar Derby Mark currency.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Mereldar Derby Mark
L:CreateSimpleCurrencyPlugin({
	currencyId = 3055,
	titanId = "TITAN_MERELDARDM",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
})