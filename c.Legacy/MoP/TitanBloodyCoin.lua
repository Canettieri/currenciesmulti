--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Bloody Coin.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_BLDCNM"
local CURRENCY_ID = 789

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoBloody"],
	expName = L["mMoP"],
	category = "CATEGORY_LEGACY"
})