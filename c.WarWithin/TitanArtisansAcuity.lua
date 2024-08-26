--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows the Artisan's Acuity item.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

-- Artisan's Acuity
L:CreateSimpleItemPlugin({
	itemId = 210814,
	titanId = "TITAN_ARTISANACUITY",
	noCurrencyText = L["NoTWWCurrency"],
	expName = L["mWarWithin"],
	category = "CATEGORY_TWW"
})