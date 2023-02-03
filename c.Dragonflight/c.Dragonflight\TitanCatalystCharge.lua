--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Catalyst Charges.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Centias
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_DICCCM"
local CURRENCY_ID = 2167

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})
