--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Corrupted Memento.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_CORMMM"
local CURRENCY_ID = 1719

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["VisionsOnly"],
	expName = L["mBfA"],
	category = "CATEGORY_BFA"
})