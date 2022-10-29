--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Stygia.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_STYGIM"
local CURRENCY_ID = 1767

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["SLOnly"],
	expName = L["mShadowlands"],
	category = "CATEGORY_SHADOWLANDS"
})