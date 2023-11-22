--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Whelpling's Dreaming Crests.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;
local ID = "TITAN_WHELPDREAMINGCREST"
local CURRENCY_ID = 2706

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})
