--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Brawler's Gold.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_BRWLGM"
local CURRENCY_ID = 1299

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoBrawler"],
	expName = L["mOther"],
	category = "CATEGORY_MISC"
})