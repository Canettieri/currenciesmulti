--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the seasonal currencies from Dragonflight Season 4.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Whelpling's Awakened Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2806,
	titanId = "TITAN_WHELPAWAKECREST",
	noCurrencyText = L["DFSeason4"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})

-- Drake's Awakened Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2807,
	titanId = "TITAN_DRAKEAWAKECREST",
	noCurrencyText = L["DFSeason4"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})

-- Wyrm's Awakened Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2809,
	titanId = "TITAN_WYRMAWAKECREST",
	noCurrencyText = L["DFSeason4"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})

-- Aspect's Awakened Crests
L:CreateSimpleCurrencyPlugin({
	currencyId = 2812,
	titanId = "TITAN_ASPECTAWAKECREST",
	noCurrencyText = L["DFSeason4"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})

-- Renascent Awakening (Catalyst charges)
L:CreateSimpleCurrencyPlugin({
	currencyId = 2912,
	titanId = "TITAN_RENASCENTAWAKE",
	noCurrencyText = L["DFSeason4"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON",
	forceMax = true
})

-- Dreamsurge Cradle
L:CreateSimpleItemPlugin({
	itemId = 224297,
	titanId = "TITAN_DRSGCRADLE",
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})

-- Antique Bronze Bullion
L:CreateSimpleItemPlugin({
	itemId = 213089,
	titanId = "TITAN_ANTBRONZBULL",
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})