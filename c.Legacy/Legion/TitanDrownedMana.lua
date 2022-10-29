--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Drowned Mana.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_DRWDMM"
local ITEM_ID = 138777

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["NoDrowned"],
	expName = L["mLegion"],
	category = "CATEGORY_LEGACY"
})