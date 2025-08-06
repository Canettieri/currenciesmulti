--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Untethered Coin currency.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Protuhj
--]]

local _, L = ...;

L:CreateSimpleCurrencyPlugin({
	currencyId = 3303,
	titanId = "TITAN_UNTCOIN",
	noCurrencyText = L["TWWKaresh"],
	expName = L["mKaresh"],
	category = "CATEGORY_TWW",
})
