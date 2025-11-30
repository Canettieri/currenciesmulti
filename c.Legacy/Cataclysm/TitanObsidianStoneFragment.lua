--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Obsidian Stone Fragments.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_OSFRGM"
local CURRENCY_ID = 3281

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoCataCurrency07"],
	expName = L["mCata"],
	category = "CATEGORY_LEGACY",
	forceMax = true,
})
