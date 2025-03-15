--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Wakening Essence.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;
local ID = "TITAN_LEGWAKESS"
local CURRENCY_ID = 1533

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["LegionOnly"],
	expName = L["mLegion"],
	category = "CATEGORY_LEGACY"
})
