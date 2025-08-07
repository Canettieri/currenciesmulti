--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Illustrious Jewelcrafter's Token.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_ILJCTKM"
local CURRENCY_ID = 361

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoCataCurrency04"],
	expName = L["mCata"],
	category = "CATEGORY_LEGACY"
})
