--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Honor Points.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_HRPSM"
local CURRENCY_ID = 1901

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoMark"],
	expName = L["mPvP"],
	category = "CATEGORY_MISC",
	forceMax = true,
})