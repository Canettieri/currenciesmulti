--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the Ethereal Strands currency.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Reselsnark on Github and Protuhj.
--]]

local _, L = ...;

-- Ethereal Strands (K'aresh Cloak upgrade currency)
-- This is a "Warband Currency"
L:CreateNoAltCurrencyPlugin({
	currencyId = 3278,
	titanId = "TITAN_TWWS3ETHEREALSTRAND",
	noCurrencyText = L["TWWKaresh"],
	expName = L["mKaresh"],
	category = "CATEGORY_TWW",
	forceMax = true,
})
