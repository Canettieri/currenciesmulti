--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Prismatic Manapearl.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_PRMNPM"
local CURRENCY_ID = 1721

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoPpearl"],
	expName = L["mBfA"],
	category = "CATEGORY_BFA"
})