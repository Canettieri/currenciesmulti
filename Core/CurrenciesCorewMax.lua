--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local _, L = ...;
L.Elib = LibStub("Elib-4.0").Register

function L.PrepareCurrenciesMaxMenu(eddm, self, id)
	L.PrepareCurrenciesMenuBase(eddm, self, id, true, false)
end