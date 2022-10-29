--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Dingy Iron Coins.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_DICCTM"
local CURRENCY_ID = 980

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoMaxCoin"],
	expName = L["mWoD"],
	category = "CATEGORY_LEGACY"
})