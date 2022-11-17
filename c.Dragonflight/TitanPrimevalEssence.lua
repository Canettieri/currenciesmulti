--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Primeval Essence.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_PRESSM"
local ITEM_ID = 199211

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["DragonEventOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})