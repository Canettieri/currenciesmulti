--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Timeworn Artifact.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_TMWNAM"
local CURRENCY_ID = 1268

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoTimeworn"],
	expName = L["mLegion"],
	category = "CATEGORY_LEGACY"
})