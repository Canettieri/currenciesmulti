--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Shiny Pet Charm.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_PTCMM"
local ITEM_ID = 116415

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["NoMaxPet"],
	expName = L["mOther"],
	category = "CATEGORY_MISC"
})