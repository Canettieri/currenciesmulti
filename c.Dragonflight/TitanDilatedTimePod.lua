--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Dilated Time Pod.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
--]]

local _, L = ...;
local ID = "TITAN_DLTPOD"
local ITEM_ID = 209856

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})