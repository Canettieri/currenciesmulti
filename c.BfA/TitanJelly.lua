--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Jelly.
Site: http://www.curse.com/addons/wow/titan-panel-currencies-multi
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

	local thinBag = L["thinJ"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(168822)).."\r"
	local thinBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(168822, true) - GetItemCount(168822))

	local richBag = L["richJ"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(168825)).."\r"
	local richBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(168825, true) - GetItemCount(168825))

	local royalBag = L["royalJ"].."\r"..L["totalbag"]..TitanUtils_GetHighlightText(GetItemCount(168828)).."\r"
	local royalBank = L["totalbank"]..TitanUtils_GetHighlightText(GetItemCount(168828, true) - GetItemCount(168828))

	local valueText = "" -- Difere com e sem geleia
	if thinJelly == 0 and richJelly == 0 and royalJelly == 0 then
		valueText = "\r"..L["info"].."\r|cFFFF2e2e"..L["nojelly"]
	else
		valueText = "\r"..L["info"]..thinBag..thinBank.."\r\r"..richBag..richBank.."\r\r"..royalBag..royalBank
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
local function PrepareMenu(self, id)
	TitanPanelRightClickMenu_AddTitle(TitanPlugins[id].menuText)
	TitanPanelRightClickMenu_AddToggleIcon(id)
	TitanPanelRightClickMenu_AddToggleLabelText(id)

	local info = UIDropDownMenu_CreateInfo();
	info.text = L["showbb"];
	info.func = function() TitanToggleVar(id, "ShowBarBalance"); TitanPanelButton_UpdateButton(id); end
	info.checked = TitanGetVar(id, "ShowBarBalance");
	L_UIDropDownMenu_AddButton(info);

	local info = UIDropDownMenu_CreateInfo();
	info.text = ACE["TITAN_CLOCK_MENU_DISPLAY_ON_RIGHT_SIDE"];
	info.func = function() TitanToggleVar(id, "DisplayOnRightSide"); TitanPanel_InitPanelButtons(id); end
	info.checked = TitanGetVar(id, "DisplayOnRightSide");
	L_UIDropDownMenu_AddButton(info);

	TitanPanelRightClickMenu_AddSpacer()
	TitanPanelRightClickMenu_AddCommand(ACE["TITAN_PANEL_MENU_HIDE"], id, TITAN_PANEL_MENU_FUNC_HIDE);
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
		HideMax = false,
		ShowBarBalance = false,
		ShowLabelText = false,
	},
	eventsTable = eventsTable
})
