--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the crests currencies from Dragonflight Season 4.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Whelpling's Awakened Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2806,
	titanId = "TITAN_WHELPAWAKECREST",
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})

-- Drake's Awakened Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2807,
	titanId = "TITAN_DRAKEAWAKECREST",
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})

-- Wyrm's Awakened Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2809,
	titanId = "TITAN_WYRMAWAKECREST",
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})

-- Aspect's Awakeend Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2812,
	titanId = "TITAN_ASPECTAWAKECREST",
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})