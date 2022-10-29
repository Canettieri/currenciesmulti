--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Primal Spirit.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_PRPTM"
local ITEM_ID = 120945

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["DraenorOnly"],
	expName = L["mWoD"],
	category = "CATEGORY_LEGACY"
})