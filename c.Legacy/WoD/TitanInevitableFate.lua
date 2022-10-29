--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Seal of Inevitable Fate.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_SOIFTM"
local CURRENCY_ID = 1129

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["DraenorOnly"],
	expName = L["mWoD"],
	category = "CATEGORY_LEGACY"
})