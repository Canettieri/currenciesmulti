--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Champion's Seal.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_CPSLM"
local CURRENCY_ID = 241

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoChampions"],
	expName = L["mWotLK"],
	category = "CATEGORY_LEGACY"
})