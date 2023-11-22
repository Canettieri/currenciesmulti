--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Paracausal Flakes.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;
local ID = "TITAN_SEEDBLOOM"
local ITEM_ID = 211376
-- Currency seems unused?
--local CURRENCY_ID = 2651

--L:CreateSimpleCurrencyPlugin({
--	currencyId = CURRENCY_ID,
--	titanId = ID,
--	noCurrencyText = L["DragonFOnly"],
--	expName = L["mDragonflight"],
--	category = "CATEGORY_DRAGON"
--})
L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})
