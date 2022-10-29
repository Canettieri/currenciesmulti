--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Darkmoon Faire Prize Ticket for Classic.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_DMFCM"
local ITEM_ID = 19182

L:CreateSimpleItemPlugin({
	itemId = ITEM_ID,
	titanId = ID,
	noCurrencyText = L["NoTickets"],
	expName = L["mEvent"],
	category = "CATEGORY_MISC"
})