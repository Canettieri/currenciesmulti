--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Platinum Coins.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Protuhj
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_MOPPLATCOIN"
local CURRENCY_ID = 3407

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoMoPCurrency02"],
	expName = L["mMoP"],
	category = "CATEGORY_CURRENT", -- This is a Classic only currency.
	forceMax = true
})
