--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of August Stone Fragments.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_AGTSTM"
local CURRENCY_ID = 3350

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoMoPCurrency01"],
	expName = L["mMoP"],
	category = "CATEGORY_CURRENT", -- This is a Classic only currency.
	forceMax = true
})