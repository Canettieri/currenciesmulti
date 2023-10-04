--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Dreamsurge Coalescence.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj for this addition.
--]]

local _, L = ...;
local ID = "TITAN_DFDREAMCOAL"
local ITEM_ID = 207026

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})