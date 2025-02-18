--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Sizzling Cinderpollen item.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Sizzling Cinderpollen
L:CreateSimpleItemPlugin({
	itemId = 225557,
	titanId = "TITAN_SIZZLINGCPOLLEN",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW",
	allowAccountTotal = true
})