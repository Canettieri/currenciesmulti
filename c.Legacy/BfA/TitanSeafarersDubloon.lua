--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Seafarer's Dubloon.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_SFDOOM"
local CURRENCY_ID = 1710

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["BfAOnly"],
	expName = L["mBfA"],
	category = "CATEGORY_BFA"
})