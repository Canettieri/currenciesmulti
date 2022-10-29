--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Tricky Treat.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_TKYTM"
local ITEM_ID = 33226

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["HallowEnd"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC"
})