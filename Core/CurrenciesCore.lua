--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local _, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)
L.Elib = LibStub("Elib-4.0").Register

local function ToggleRightSideDisplay(self, id)
	-- Right side display
	TitanToggleVar(id, "DisplayOnRightSide");
	TitanPanel_InitPanelButtons();
end

local function ToggleVar(self, id, var)
	TitanToggleVar(id, var);
	TitanPanelButton_UpdateButton(id)
end

local function CreateToggle(id, text, var)
	local info = {};
	info.text = text;
	info.func = ToggleVar;
	info.arg1 = id
	info.arg2 = var
	info.checked = TitanGetVar(id, var);
	info.keepShownOnClick = true
	return info
end

local function CreateTitle(id, text)
	local info = {};
	info.text = text;
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	info.isUninteractable = true
	info.hasArrow = false
	return info
end

function L.PrepareCurrenciesMenuBase(eddm, self, id, hasMax, isWarband)
	eddm.UIDropDownMenu_AddButton(CreateTitle(id, TitanPlugins[id].menuText));
	eddm.UIDropDownMenu_AddButton(CreateTitle(id, L["buttonText"]));

	eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["showbb"], "ShowBarBalance"));

	if (hasMax) then
		eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["maxBar"], "MaxBar"));
	end

	if (isWarband) then
		eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["showWarbandTotal"], "TotalBalanceBar"));
	end

	eddm.UIDropDownMenu_AddButton({
		text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"],
		func = ToggleRightSideDisplay,
		arg1 = id,
		checked = TitanGetVar(id, "DisplayOnRightSide"),
		keepShownOnClick = true
	});

	eddm.UIDropDownMenu_AddButton(CreateTitle(id, L["tooltip"]));
	eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["showAltText"], "ShowAltText"));
	eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["sortByAmount"], "AltTextSortByAmount"));
	eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["addDigitSeparator"], "AddSeparator"));
	eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["showAllFactions"], "ShowAllFactions"));
	eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["useHyperlink"], "UseHyperlink"));
	eddm.UIDropDownMenu_AddButton(CreateToggle(id, L["hideInfoWhenHyperlink"], "HideInfoWhenHyperlink"));

	eddm.UIDropDownMenu_AddSpace();

	eddm.UIDropDownMenu_AddButton({
		notCheckable = true,
		text = ACE["TITAN_PANEL_MENU_HIDE"],
		func = function()
			TitanPanelRightClickMenu_Hide(id)
		end
	})

	eddm.UIDropDownMenu_AddSeparator();

	eddm.UIDropDownMenu_AddButton({
		text = CLOSE,
		notCheckable = true,
		keepShownOnClick = false,
	});
end

function L.PrepareCurrenciesMenu(eddm, self, id)
	return L.PrepareCurrenciesMenuBase(eddm, self, id, false, false)
end

-- I'm not sure if there are Warband currencies that have max
-- If Blizzard adds some in the future, we'll need to split this into multiple versions
function L.PrepareCurrenciesMenuWarband(eddm, self, id)
	return L.PrepareCurrenciesMenuBase(eddm, self, id, false, true)
end

function L.DefaultCurrencyClickHandler(self, button)
	if (button == "LeftButton") then
		ToggleCharacter("TokenFrame");
	end
end
