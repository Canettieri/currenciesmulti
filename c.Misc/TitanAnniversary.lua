--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows currencies/items related to Anniversary events.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Bronze Celebration Tokens
L:CreateSimpleCurrencyPlugin({
	currencyId = 3100,
	titanId = "TITAN_BRONZECELTOKEN",
	noCurrencyText = L["No20thCurrency"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC"
})
