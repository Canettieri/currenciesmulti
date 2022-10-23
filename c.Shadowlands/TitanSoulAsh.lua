--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Soul Ash.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local _, L = ...;
local ID = "TITAN_SOLAHM"
local CURRENCY_ID = 1828

L:CreateSimpleCurrencyPlugin(CURRENCY_ID, ID, L["SLShared02"])