--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local _, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)
L.Elib = LibStub("Elib-4.0").Register

function L.PrepareNoAltCurrenciesMenuBase(eddm, self, id, hasMax)
	eddm.UIDropDownMenu_AddButton(L.Utils.CreateTitle(id, TitanPlugins[id].menuText));
	eddm.UIDropDownMenu_AddButton(L.Utils.CreateTitle(id, L["buttonText"]));

	eddm.UIDropDownMenu_AddButton(L.Utils.CreateToggle(id, L["showbb"], "ShowBarBalance"));

	if (hasMax) then
		eddm.UIDropDownMenu_AddButton(L.Utils.CreateToggle(id, L["maxBar"], "MaxBar"));
	end

	eddm.UIDropDownMenu_AddButton({
		text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"],
		func = L.Utils.ToggleRightSideDisplay,
		arg1 = id,
		checked = TitanGetVar(id, "DisplayOnRightSide"),
		keepShownOnClick = true
	});

	eddm.UIDropDownMenu_AddButton(L.Utils.CreateTitle(id, L["tooltip"]));
	eddm.UIDropDownMenu_AddButton(L.Utils.CreateToggle(id, L["addDigitSeparator"], "AddSeparator"));
	eddm.UIDropDownMenu_AddButton(L.Utils.CreateToggle(id, L["useHyperlink"], "UseHyperlink"));
	eddm.UIDropDownMenu_AddButton(L.Utils.CreateToggle(id, L["hideInfoWhenHyperlink"], "HideInfoWhenHyperlink"));

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
