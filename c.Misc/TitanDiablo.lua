--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows currencies/items from Diablo events.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Protuhj
--]]

local _, L = ...;

L:CreateSimpleCurrencyPlugin({
	currencyId = 3309,
	titanId = "DIABLO_HELLSHARD",
	noCurrencyText = L["GreedyEmissary"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC"
})
