--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Coin of Ancestry.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_COAYM"
local ITEM_ID = 21100

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["NoAncestry"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC"
})