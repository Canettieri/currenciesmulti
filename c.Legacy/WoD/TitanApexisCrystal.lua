--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Apexis Crystal.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_APXCYM"
local CURRENCY_ID = 823

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["DraenorOnly"],
	expName = L["mWoD"],
	category = "CATEGORY_LEGACY"
})
