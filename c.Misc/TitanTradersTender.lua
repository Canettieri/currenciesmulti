--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Trader's Tender.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_TDRTRM"
local CURRENCY_ID = 2032

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["TradersTender"],
	expName = L["mOther"],
	category = "CATEGORY_MISC"
})