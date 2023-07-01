--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Sidereal Essence.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_SDRLM"
local CURRENCY_ID = 2589

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoLKCurrency05"],
	expName = L["mWotLK"],
	category = "CATEGORY_LEGACY"
})