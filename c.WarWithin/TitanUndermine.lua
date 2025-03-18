--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows currencies associated with the Undermine patch and zone.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Empty Kaja'Cola Can
L:CreateSimpleCurrencyPlugin({
	currencyId = 3218,
	titanId = "TITAN_KJCOLACAN",
	noCurrencyText = L["TWWUndermine"],
	expName = L["mUndermine"],
	category = "CATEGORY_TWW"
})

-- Vintage Kaja'Cola Can
L:CreateSimpleCurrencyPlugin({
	currencyId = 3220,
	titanId = "TITAN_VINTCOLACAN",
	noCurrencyText = L["TWWUndermine"],
	expName = L["mUndermine"],
	category = "CATEGORY_TWW"
})

-- Gunk-Covered Thingy
L:CreateSimpleItemPlugin({
	itemId = 233246,
	titanId = "TITAN_GCTHINGY",
	noCurrencyText = L["TWWUndermine"],
	expName = L["mUndermine"],
	category = "CATEGORY_TWW"
})

-- Miscellaneous Mechanica
L:CreateSimpleItemPlugin({
	itemId = 234741,
	titanId = "TITAN_MISCMECH",
	noCurrencyText = L["TWWUndermine"],
	expName = L["mUndermine"],
	category = "CATEGORY_TWW",
	allowAccountTotal = true
})

-- "Gold" Fish
L:CreateSimpleItemPlugin({
	itemId = 227673,
	titanId = "TITAN_UMGOLDFISH",
	noCurrencyText = L["TWWUndermine"],
	expName = L["mUndermine"],
	category = "CATEGORY_TWW",
	allowAccountTotal = true
})

-- Market Research
L:CreateSimpleCurrencyPlugin({
	currencyId = 3226,
	titanId = "TITAN_UMMARKETRESEARCH",
	noCurrencyText = L["TWWUndermine"],
	expName = L["mUndermine"],
	category = "CATEGORY_TWW"
})
