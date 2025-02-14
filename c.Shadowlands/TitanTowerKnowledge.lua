--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Tower Knowledge.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;

L:CreateSimpleCurrencyPlugin({
	currencyId = 1904,
	titanId = "TITAN_TWRKWM",
	noCurrencyText = L["SLShared02"],
	expName = L["mShadowlands"],
	category = "CATEGORY_SHADOWLANDS"
})
