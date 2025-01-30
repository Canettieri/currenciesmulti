--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Radiant Remnant item.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Radiant Remnant
L:CreateSimpleItemPlugin({
	itemId = 206350,
	titanId = "TITAN_RADIANTREMNANT",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW"
})
