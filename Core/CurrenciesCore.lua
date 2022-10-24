--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)
L.Elib = LibStub("Elib-4.0").Register

local function ToggleRightSideDisplay(self, id) -- Right side display
	TitanToggleVar(id, "DisplayOnRightSide");
	TitanPanel_InitPanelButtons();
end

local function ToggleVar(self, id, var)
	TitanToggleVar(id, var);
	TitanPanelButton_UpdateButton(id)
end

function L.PrepareCurrenciesMenu(eddm, self, id)
	eddm.UIDropDownMenu_AddButton({
		text = TitanPlugins[id].menuText,
		hasArrow = false,
		isTitle = true,
		isUninteractable = true,
		notCheckable = true
	})

	local info = {};
	info.text = L["buttonText"];
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["showbb"];
	info.func = ToggleVar;
	info.arg1 = id
	info.arg2 = "ShowBarBalance"
	info.checked = TitanGetVar(id, "ShowBarBalance");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"];
	info.func = ToggleRightSideDisplay;
	info.arg1 = id
	info.checked = TitanGetVar(id, "DisplayOnRightSide");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["tooltip"];
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["showAltText"];
	info.func = ToggleVar;
	info.arg1 = id
	info.arg2 = "ShowAltText"
	info.checked = TitanGetVar(id, "ShowAltText");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["showAllFactions"];
	info.func = ToggleVar;
	info.arg1 = id
	info.arg2 = "ShowAllFactions"
	info.checked = TitanGetVar(id, "ShowAllFactions");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["useHyperlink"];
	info.func = ToggleVar;
	info.arg1 = id
	info.arg2 = "UseHyperlink"
	info.checked = TitanGetVar(id, "UseHyperlink");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	info = {};
	info.text = L["hideInfoWhenHyperlink"];
	info.func = ToggleVar;
	info.arg1 = id
	info.arg2 = "HideInfoWhenHyperlink"
	info.checked = TitanGetVar(id, "HideInfoWhenHyperlink");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	eddm.UIDropDownMenu_AddSpace();

	eddm.UIDropDownMenu_AddButton({
		notCheckable = true,
		text = ACE["TITAN_PANEL_MENU_HIDE"],
		func = function() TitanPanelRightClickMenu_Hide(id) end
	})

	eddm.UIDropDownMenu_AddSeparator();

	info = {};
	info.text = CLOSE;
	info.notCheckable = true
	info.keepShownOnClick = false
	eddm.UIDropDownMenu_AddButton(info);
end
