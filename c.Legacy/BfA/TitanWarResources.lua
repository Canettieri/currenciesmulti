--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of War Resources.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_WRRSCM"
local CURRENCY_ID = 1560

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["BfAOnly"],
	expName = L["mBfA"],
	category = "CATEGORY_BFA"
})