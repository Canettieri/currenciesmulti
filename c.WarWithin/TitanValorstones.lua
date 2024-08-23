--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Valorstones currency.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Valorstones
L:CreateSimpleCurrencyPlugin({
	currencyId = 3008,
	titanId = "TITAN_VALORSTONES",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
})