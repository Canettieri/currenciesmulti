--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Jelly.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_JELLYM"
local thinJelly = 0
local richJelly = 0
local royalJelly = 0
local startThin = 0
local startRich = 0
local startRoyal = 0
-----------------------------------------------
local function getThin()
	return GetItemCount(168822, true) or 0
end
-----------------------------------------------
local function getRich()
	return GetItemCount(168825, true) or 0
end
-----------------------------------------------
local function getRoyal()
	return GetItemCount(168828, true) or 0
end
-----------------------------------------------
local function GetButtonText(self, id)
	-- Geleia Rala
	local thinCountText
	if not thinJelly then
		thinCountText = "  |TInterface\\Icons\\inv_cooking_80_choralhoney1:0|t "..TitanUtils_GetHighlightText("0")
	else
		thinCountText = "  |TInterface\\Icons\\inv_cooking_80_choralhoney1:0|t "..TitanUtils_GetHighlightText(thinJelly)
	end

	local thinBalanceText = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (thinJelly - startThin) > 0 then
			thinBalanceText = " |cFF69FF69["..(thinJelly - startThin).."]"
		elseif (thinJelly - startThin) < 0 then
			thinBalanceText = " |cFFFF2e2e["..(thinJelly - startThin).."]"
		end
	end
	-- Geleia Rica
	local richCountText
	if not richJelly then
		richCountText = "  |TInterface\\Icons\\inv_cooking_80_choralhoney:0|t "..TitanUtils_GetHighlightText("0")
	else
		richCountText = "  |TInterface\\Icons\\inv_cooking_80_choralhoney:0|t "..TitanUtils_GetHighlightText(richJelly)
	end

	local richBalanceText = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (richJelly - startRich) > 0 then
			richBalanceText = " |cFF69FF69["..(richJelly - startRich).."]"
		elseif (richJelly - startRich) < 0 then
			richBalanceText = " |cFFFF2e2e["..(richJelly - startRich).."]"
		end
	end
	-- Geleia Real
	local royalCountText
	if not royalJelly then
		royalCountText = "  |TInterface\\Icons\\inv_cooking_80_choralhoney3:0|t "..TitanUtils_GetHighlightText("0")
	else
		royalCountText = "  |TInterface\\Icons\\inv_cooking_80_choralhoney3:0|t "..TitanUtils_GetHighlightText(royalJelly)
	end

	local royalBalanceText = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (royalJelly - startRoyal) > 0 then
			royalBalanceText = " |cFF69FF69["..(royalJelly - startRoyal).."]"
		elseif (royalJelly - startRoyal) < 0 then
			royalBalanceText = " |cFFFF2e2e["..(royalJelly - startRoyal).."]"
		end
	end

	return L["JellyLabel"], thinCountText..thinBalanceText.." "..richCountText..richBalanceText.." "..royalCountText..royalBalanceText
end
-----------------------------------------------
local function GetTooltipText(self, id)

	local thinBag = " \n|TInterface\\Icons\\inv_cooking_80_choralhoney1:0|t "..L["thinJ"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168822))
	local thinBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168822, true) - GetItemCount(168822))

	local richBag = "\n \n|TInterface\\Icons\\inv_cooking_80_choralhoney:0|t "..L["richJ"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168825))
	local richBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168825, true) - GetItemCount(168825))

	local royalBag = "\n \n|TInterface\\Icons\\inv_cooking_80_choralhoney3:0|t "..L["royalJ"].."\n"..L["totalbag"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168828))
	local royalBank = "\n"..L["totalbank"].."\t"..TitanUtils_GetHighlightText(GetItemCount(168828, true) - GetItemCount(168828))

	local valueText = "" -- Difere com e sem geleia
	if thinJelly == 0 and richJelly == 0 and royalJelly == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["NoJelly"]
	else
		valueText = thinBag..thinBank..richBag..richBank..royalBag..royalBank
	end

	return valueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		startThin = getThin()
		thinJelly = startThin

		startRich = getRich()
		richJelly = startRich

		startRoyal = getRoyal()
		royalJelly = startRoyal

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local thinJ = getThin()
			local richJ = getRich()
			local royalJ = getRoyal()
			if thinJelly == thinJ and richJelly == richJ and royalJelly == royalJ then return end

			thinJelly = thinJ
			richJelly = richJ
			royalJelly = royalJ
			TitanPanelButton_UpdateButton(self.registry.id)
		end
		self:RegisterEvent("BAG_UPDATE")
	end
}
-----------------------------------------------
function PrepareMenu(eddm, self, id)
	eddm.UIDropDownMenu_AddButton({
		text = TitanPlugins[id].menuText,
		hasArrow = false,
		isTitle = true,
		isUninteractable = true,
		notCheckable = true
	})

	local info = {};
	info.text = L["showbb"];
	info.func = ToggleShowBarBalance;
	info.arg1 = id
	info.checked = TitanGetVar(id, "ShowBarBalance");
	info.keepShownOnClick = true
	eddm.UIDropDownMenu_AddButton(info);

	local info = {};
	info.text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"];
	info.func = ToggleRightSideDisplay;
	info.arg1 = id
	info.checked = TitanGetVar(id, "DisplayOnRightSide");
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
-----------------------------------------------
L.Elib({
	id = ID,
	name = L["mBfA"].." Titan|cFF66b1ea "..L["JellyTitle"].."|r",
	tooltip = L["JellyTitle"],
	icon = "Interface\\Icons\\inv_cooking_80_choralhoney",
	category = "CATEGORY_BFA",
	version = version,
	getButtonText = GetButtonText,
	getTooltipText = GetTooltipText,
	prepareMenu = PrepareMenu,
	savedVariables = {
		ShowIcon = 1,
		DisplayOnRightSide = false,
		ShowBarBalance = false,
	},
	eventsTable = eventsTable
})
