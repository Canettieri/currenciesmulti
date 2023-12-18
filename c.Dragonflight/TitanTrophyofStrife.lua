--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Trophy of Strife.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
--]]

local _, L = ...;
local ID = "TITAN_TRPYFM"
local CURRENCY_ID = 2797

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})
