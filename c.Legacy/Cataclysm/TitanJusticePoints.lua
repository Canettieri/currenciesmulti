--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Justice Points.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_JUSTPM"
local CURRENCY_ID = 395

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoCataCurrency02"],
	expName = L["mPvE"], -- Essa moeda foi continuada em Pandaria.
	category = "CATEGORY_MISC", -- Mudei para a categoria misc.
	forceMax = true
})