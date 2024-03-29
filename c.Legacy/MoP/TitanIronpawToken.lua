--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Ironpaw Token.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_IRNPWM"
local CURRENCY_ID = 402

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoIronpaw"],
	expName = L["mMoP"],
	category = "CATEGORY_LEGACY"
})