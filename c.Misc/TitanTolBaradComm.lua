--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Tol Barad Commendation.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_TLBDCM"
local CURRENCY_ID = 391

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoTB"],
	expName = L["mPvP"],
	category = "CATEGORY_MISC"
})