--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Restored Coffer Key currency.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Restored Coffer Keys
L:CreateSimpleCurrencyPlugin({
	currencyId = 3028,
	titanId = "TITAN_RESTCOFFKEY",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
})