--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Odd Glob of Wax item.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Odd Glob of Wax
L:CreateSimpleItemPlugin({
	itemId = 212493,
	titanId = "TITAN_ODDGLOBOFWAX",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW"
})
