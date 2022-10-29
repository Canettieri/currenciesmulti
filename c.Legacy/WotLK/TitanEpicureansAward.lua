--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Epicurean's Award.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_EPICAWM"
local CURRENCY_ID = 81

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoEpicurean"],
	expName = L["mWotLK"],
	category = "CATEGORY_LEGACY"
})
