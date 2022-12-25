--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Bloody Tokens.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_DFBLYM"
local CURRENCY_ID = 2123

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["DragonFPvP"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})
