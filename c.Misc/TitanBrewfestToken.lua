--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Brewfest Prize Token.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_BWFTM"
local ITEM_ID = 37829

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["NoToken"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC",
	allowAccountTotal = true
})
