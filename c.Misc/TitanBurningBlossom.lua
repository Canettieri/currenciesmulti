--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Burning Blossom.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_BRGBLM"
local ITEM_ID = 23247

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["NoEventCurrency01"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC"
})