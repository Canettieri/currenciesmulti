--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Fissure Stone Fragments.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_FSFRGM"
local CURRENCY_ID = 3148

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoCataCurrency05"],
	expName = L["mCata"],
	category = "CATEGORY_LEGACY",
	forceMax = true,
})
