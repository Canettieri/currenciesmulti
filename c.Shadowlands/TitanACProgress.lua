--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Adventure Campaign Progress.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_ADCGPM"
local CURRENCY_ID = 1889

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoSLCurrency13"],
	expName = L["mShadowlands"],
	category = "CATEGORY_SHADOWLANDS"
})
