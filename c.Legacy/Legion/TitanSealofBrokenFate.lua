--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Seal of Broken Fate.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_SBKFTM"
local CURRENCY_ID = 1273

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoBrokenFate"],
	expName = L["mLegion"],
	category = "CATEGORY_LEGACY"
})