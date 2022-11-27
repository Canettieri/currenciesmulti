--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Wintergrasp Mark of Honor.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_WGRPKM"
local ITEM_ID = 43589

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["WotLKOnly"],
	expName = L["mWotLK"],
	category = "CATEGORY_LEGACY"
})