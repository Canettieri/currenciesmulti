--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Sightless Eye.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_SGTEYM"
local CURRENCY_ID = 1149

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoSightless"],
	expName = L["mLegion"],
	category = "CATEGORY_LEGACY"
})