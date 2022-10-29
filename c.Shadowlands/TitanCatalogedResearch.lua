--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Cataloged Research.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_CTLRHM"
local CURRENCY_ID = 1931

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoSLCurrency15"],
	expName = L["mShadowlands"],
	category = "CATEGORY_SHADOWLANDS"
})