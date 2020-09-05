--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: http://www.curse.com/addons/wow/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)

function formatNumber(amount, sep)
	local formatted = amount
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1' .. sep .. '%2')
		if (k==0) then
			break
		end
	end
	return formatted
end

local function ToggleRightSideDisplay(self, id) -- Right side display
	TitanToggleVar(id, "DisplayOnRightSide");
	TitanPanel_InitPanelButtons();
end

local function ToggleShowBarBalance(self, id) -- Show Balance in Titan Bar
	TitanToggleVar(id, "ShowBarBalance");
	TitanPanelButton_UpdateButton(id)
end

local function ToggleMaxBar(self, id) -- Mostrar o máximo na barra
	TitanToggleVar(id, "MaxBar");
	TitanPanelButton_UpdateButton(id)
end

local function ToggleShowAltText(self, id) -- Show Alt Text
	TitanToggleVar(id, "ShowAltText");
	TitanPanelButton_UpdateButton(id)
end

function L.PrepareCurrenciesMaxMenu(self, id)
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[id].menuText)
	TitanPanelRightClickMenu_AddToggleIcon(id)
	TitanPanelRightClickMenu_AddToggleLabelText(id)

	info = {};
	info.text = L["showbb"];
	info.func = ToggleShowBarBalance;
	info.arg1 = id
	info.checked = TitanGetVar(id, "ShowBarBalance");
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["maxBar"];
	info.func = ToggleMaxBar;
	info.arg1 = id
	info.checked = TitanGetVar(id, "MaxBar");
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["showAltText"];
	info.func = ToggleShowAltText;
	info.arg1 = id
	info.checked = TitanGetVar(id, "ShowAltText");
	L_UIDropDownMenu_AddButton(info);

	info = {};
	info.text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"];
	info.func = ToggleRightSideDisplay;
	info.arg1 = id
	info.checked = TitanGetVar(id, "DisplayOnRightSide");
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer();
	TitanPanelRightClickMenu_AddCommand(ACE["TITAN_PANEL_MENU_HIDE"], id, TITAN_PANEL_MENU_FUNC_HIDE);
end
