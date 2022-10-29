--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Oil.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_OILTTM"
local CURRENCY_ID = 1101

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoMaxOil"],
	expName = L["mWoD"],
	category = "CATEGORY_LEGACY"
})