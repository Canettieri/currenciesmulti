--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the seasonal currencies from The War Within.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Odysseas68 and Protuhj.
--]]

local _, L = ...;

-- Ethereal Voidsplinter (TWW S3 Catalyst charges, max 8)
-- Haven't been made irrelevant yet.
L:CreateSimpleCurrencyPlugin({
	currencyId = 3269,
	titanId = "TITAN_TWWS3CATALYST",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW",
	forceMax = true
})

-- Radiant Echo (TWW S3 version)
-- These haven't been removed yet. Still relevant?
L:CreateSimpleItemPlugin({
	itemId = 246771,
	titanId = "TITAN_RADECHO",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW"
})

-- Algari Token of Merit (TWW S3 version)
-- Remove in a month or so, so people can realize they might have some and sell them for 500g
L:CreateSimpleItemPlugin({
	itemId = 248242,
	titanId = "TITAN_ALGTOKENOFMERIT",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW"
})

-- Puzzling Cartel Chip (TWW S3 version)
-- Haven't been removed from what I can tell.
L:CreateSimpleItemPlugin({
	itemId = 250741,
	titanId = "TITAN_PUZZCARTCHIP",
	noCurrencyText = L["TWWSeason3"],
	expName = L["mWarWithinS3"],
	category = "CATEGORY_TWW"
})
