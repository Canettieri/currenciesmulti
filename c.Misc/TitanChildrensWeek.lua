--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows currencies/items related to the Children's Week event.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Well-loved Figurine
L:CreateSimpleItemPlugin({
	itemId = 241215,
	titanId = "TITAN_WELLLOVEDFIG",
	noCurrencyText = L["NoChildrensWeek"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC",
	allowAccountTotal = true
})
