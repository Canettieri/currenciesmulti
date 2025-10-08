--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows any Legion Remix specific items and currencies.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Protuhj
--]]

local _, L = ...;

-- Bronze
L:CreateSimpleCurrencyPlugin({
	currencyId = 3252,
	titanId = "TITAN_LEMIXBRONZE",
	noCurrencyText = L["NoLemixCurrency"],
	expName = L["mLegionRemix"],
	category = "CATEGORY_REMIX",
})

-- Infinite Power
L:CreateSimpleCurrencyPlugin({
	currencyId = 3268,
	titanId = "TITAN_LEMIXINFPOWER",
	noCurrencyText = L["NoLemixCurrency"],
	expName = L["mLegionRemix"],
	category = "CATEGORY_REMIX",
})
