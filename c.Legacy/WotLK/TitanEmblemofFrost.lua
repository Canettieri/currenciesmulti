--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Emblem of Frost.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to zbmott.
--]]

local _, L = ...;
local ID = "TITAN_EMFRM"
local CURRENCY_ID = 341

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["WotLKOnly"],
	expName = L["mWotLK"],
	category = "CATEGORY_LEGACY"
})