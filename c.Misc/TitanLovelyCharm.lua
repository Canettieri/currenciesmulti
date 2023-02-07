--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Lovely Charm.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_LLYCHM"
local ITEM_ID = 49655

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["NoLove"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC"
})