--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Coins of Air.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_COFARM"
local CURRENCY_ID = 1416

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoCAir"],
	expName = L["mLegion"],
	category = "CATEGORY_LEGACY"
})