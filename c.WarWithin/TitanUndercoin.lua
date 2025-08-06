--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Undercoin currency.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;

L:CreateSimpleCurrencyPlugin({
	currencyId = 2803,
	titanId = "TITAN_UNDRCNM",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mDelves"],
	category = "CATEGORY_TWW",
})