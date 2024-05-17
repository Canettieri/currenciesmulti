--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows currency(ies?) from Dragonflight Season 4's Mists of Pandaria remix event.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Bronze
L:CreateSimpleCurrencyPlugin({
	currencyId = 2778,
	titanId = "TITAN_DFMOPBRONZE",
	noCurrencyText = L["DFMOPRemix"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true,
})

