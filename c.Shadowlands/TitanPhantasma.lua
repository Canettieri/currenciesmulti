--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Phantasma.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_PHTSMM"
local CURRENCY_ID = 1728

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["SLShared02"],
	expName = L["mShadowlands"],
	category = "CATEGORY_SHADOWLANDS"
})