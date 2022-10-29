--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Cyphers of the First Ones.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote and GroovyAyu.
--]]

local _, L = ...;
local ID = "TITAN_CYPHFO"
local CURRENCY_ID = 1979

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["SLShared01"],
	expName = L["mShadowlands"],
	category = "CATEGORY_SHADOWLANDS"
})