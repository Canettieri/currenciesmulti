--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Mark of the World Tree.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_MKWTRM"
local CURRENCY_ID = 416

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoWorldTree"],
	expName = L["mCata"],
	category = "CATEGORY_LEGACY"
})