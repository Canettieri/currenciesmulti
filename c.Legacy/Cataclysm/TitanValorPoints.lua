--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Justice Points.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_VALPTM"
local CURRENCY_ID = 396

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoCataCurrency03"],
	expName = L["mCata"],
	category = "CATEGORY_CATA",
	forceMax = true
})