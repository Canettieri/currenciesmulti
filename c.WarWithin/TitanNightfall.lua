--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the currencies from The War Within patch 11.1.5 'Nightfall'.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks Protuhj.
--]]

local _, L = ...;

-- Radiant Emblem of Service
L:CreateSimpleItemPlugin({
	itemId = 238920,
	titanId = "TITAN_TWWNFRADEMOFSER",
	noCurrencyText = L["TWWNFEvents"],
	expName = L["mNightfall"],
	category = "CATEGORY_TWW"
})

-- Displaced Corrupted Mementos
L:CreateSimpleCurrencyPlugin({
	currencyId = 3149,
	titanId = "TITAN_TWWNFDISCORMEM",
	noCurrencyText = L["TWWNFVisions"],
	expName = L["mHorrificVisions"],
	category = "CATEGORY_TWW"
})

-- Black Blood Residue
L:CreateSimpleItemPlugin({
	itemId = 238407,
	titanId = "TITAN_BBRESIDUE",
	noCurrencyText = L["TWWNFVisions"],
	expName = L["mHorrificVisions"],
	category = "CATEGORY_TWW",
	allowAccountTotal = true
})

-- Black Blood Coagulate
L:CreateSimpleItemPlugin({
	itemId = 242648,
	titanId = "TITAN_BBCOAGULATE",
	noCurrencyText = L["TWWNFVisions"],
	expName = L["mHorrificVisions"],
	category = "CATEGORY_TWW",
	allowAccountTotal = true
})
