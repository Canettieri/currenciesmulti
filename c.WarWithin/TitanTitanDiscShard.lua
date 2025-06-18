--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Titan Disc Shard item.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Titan Disc Shard
L:CreateSimpleItemPlugin({
	itemId = 244465,
	titanId = "TITAN_TITANDISCSHARD",
	noCurrencyText = L["OverchargedDelves"],
	expName = L["mDelves"],
	category = "CATEGORY_TWW",
	allowAccountTotal = true
})
