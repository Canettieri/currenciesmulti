--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Service Medal.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_HBSRMM"
local CURRENCY_ID
if UnitFactionGroup("Player") == "Alliance" then
	CURRENCY_ID = 1717
else
	CURRENCY_ID = 1716
end

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["BfAOnly"],
	expName = L["mBfA"],
	category = "CATEGORY_BFA"
})