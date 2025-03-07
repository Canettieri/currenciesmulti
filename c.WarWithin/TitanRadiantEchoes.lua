--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Radiant Echo item.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Radiant Echo
L:CreateSimpleItemPlugin({
	itemId = 235897,
	titanId = "TITAN_RADECHO",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW"
})