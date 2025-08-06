--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the Flame-Blessed Iron currency added in patch 11.0.7.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Flame-Blessed Iron
L:CreateSimpleCurrencyPlugin({
	currencyId = 3090,
	titanId = "TITAN_FLMBLSIRON",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mSirenIsle"],
	category = "CATEGORY_TWW"
})

