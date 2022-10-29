--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Renown level.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_RENWNM"
local CURRENCY_ID = 1822

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["SLOnly"],
	expName = L["mShadowlands"],
	category = "CATEGORY_SHADOWLANDS"
})