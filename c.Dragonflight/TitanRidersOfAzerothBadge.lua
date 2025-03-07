--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Riders of Azeroth Badges.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Protuhj.
--]]

local _, L = ...;

L:CreateSimpleCurrencyPlugin({
	currencyId = 2588,
	titanId = "TITAN_DFROAZB",
	noCurrencyText = L["DragonFOnly"],
	expName = L["mDragonflight"],
	category = "CATEGORY_DRAGON"
})
