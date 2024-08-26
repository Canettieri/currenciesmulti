--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Resonance Crystal currency.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Resonance Crystal
L:CreateSimpleCurrencyPlugin({
	currencyId = 2815,
	titanId = "TITAN_RESOCRYSTAL",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
})