--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Infused Ruby.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_INFRYM"
local CURRENCY_ID = 1820

L:CreateSimpleCurrencyPlugin(CURRENCY_ID, ID, L["SLOnly"])