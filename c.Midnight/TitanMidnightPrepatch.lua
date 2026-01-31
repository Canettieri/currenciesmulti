--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows Midnight prepatch items
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Protuhj
Special Thanks to Canettieri and Eliote.
--]]

local _, L = ...;

-- Twilight's Blade Insignia
L:CreateSimpleCurrencyPlugin({
	currencyId = 3319,
	titanId = "TITAN_MIDNTWIBLIN",
	noCurrencyText = L["NoTwilightBladeInsignia"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT"
})
