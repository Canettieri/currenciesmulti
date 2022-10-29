--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Darkmoon Ticket Prize.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_DRKTKM"
local CURRENCY_ID = 515

L:CreateSimpleCurrencyPlugin({
	currencyId = CURRENCY_ID,
	titanId = ID,
	noCurrencyText = L["NoTickets"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC"
})