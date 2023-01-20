--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Magmotes.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_MAGMTE"
local ITEM_ID = 202173

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})