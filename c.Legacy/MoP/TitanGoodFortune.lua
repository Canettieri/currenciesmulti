--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Elder Charm of Good Fortune.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_ELCGTM"
local CURRENCY_ID = 697

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["PandariaOnly"],
	expName = L["mMoP"],
	category = "CATEGORY_LEGACY"
})