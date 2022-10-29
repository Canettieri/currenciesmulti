--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Titan Residuum.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_TTRUUM"
local CURRENCY_ID = 1718

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["BfAOnly"],
	expName = L["mBfA"],
	category = "CATEGORY_BFA"
})