--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Sandworn Relic.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_SWRLM"
local ITEM_ID = 190189

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["SLShared01"],
	expName = L["mShadowlands"],
	category = "CATEGORY_SHADOWLANDS",
	allowAccountTotal = true
})