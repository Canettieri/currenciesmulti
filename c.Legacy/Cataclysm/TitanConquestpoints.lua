--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Conquest Points.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_CQTPTM"
local CURRENCY_ID = 390

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoCataCurrency06"],
	expName = L["mPvP"],
	category = "CATEGORY_MISC",
	forceMax = true
})