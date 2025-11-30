--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Mogu Rune of Fate.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_MGROFM"
local CURRENCY_ID = 752

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["PandariaOnly"],
	expName = L["mMoP"],
	category = (LE_EXPANSION_LEVEL_CURRENT <= LE_EXPANSION_MISTS_OF_PANDARIA) and "CATEGORY_CURRENT" or "CATEGORY_LEGACY",
	forceMax = true,
})
