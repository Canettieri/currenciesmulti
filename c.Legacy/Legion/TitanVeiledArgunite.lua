--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Veiled Argunite.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_VLDATM"
local CURRENCY_ID = 1508

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoArgunite"],
	expName = L["mLegion"],
	category = "CATEGORY_LEGACY"
})
