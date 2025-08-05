--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Timeless Coin.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_TIMLSM"
local CURRENCY_ID = 777

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoTimeless"],
	expName = L["mMoP"],
	category = (LE_EXPANSION_LEVEL_CURRENT <= LE_EXPANSION_MISTS_OF_PANDARIA) and "CATEGORY_CURRENT" or "CATEGORY_LEGACY"
})