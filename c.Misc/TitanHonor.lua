--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Honor.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_PVHNRM"
local CURRENCY_ID = 1792

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoMark"],
	expName = L["mPvP"],
	category = "CATEGORY_MISC"
})