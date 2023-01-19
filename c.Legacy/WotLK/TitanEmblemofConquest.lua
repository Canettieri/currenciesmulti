--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Emblem of Conquest.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Aendieh
--]]

local _, L = ...;
local ID = "TITAN_EMCTM"
local CURRENCY_ID = 221

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["WotLKOnly"],
	expName = L["mWotLK"],
	category = "CATEGORY_LEGACY"
})
