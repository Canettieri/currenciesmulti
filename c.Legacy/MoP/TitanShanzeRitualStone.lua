--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Shan'ze Ritual Stones.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;
local ID = "TITAN_SHANZERS"
local ITEM_ID = 94221

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["PandariaOnly"],
	expName = L["mMoP"],
	category = "CATEGORY_LEGACY"
})