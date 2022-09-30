--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your Artifact Power.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri and GrimNotepad [he helped me a lot! :)]
Special Thanks to Eliote and .
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_AZTPWM"
local ICON = "Interface\\Icons\\inv_glowingazeritecrystal"
local azeriteLevel
local azeritePct
local azeriteRemaining
local azeriteCount
local azeriteMaximum
local CHARCOLOR = "|c" .. RAID_CLASS_COLORS[select(2, UnitClass("player"))].colorStr .. "|r"
-----------------------------------------------
local function Util_StringComDefault(v,d)
    if not v then
        return d
    end

    return v
end
-----------------------------------------------
local function UpdateAll(self)
    local activeAzeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
    if activeAzeriteItemLocation and activeAzeriteItemLocation:IsValid() then
        azeriteLevel = C_AzeriteItem.GetPowerLevel(activeAzeriteItemLocation)
        local xp, totalLevelXP = C_AzeriteItem.GetAzeriteItemXPInfo(activeAzeriteItemLocation)
        azeriteCount = xp
        azeriteMaximum = totalLevelXP
        azeriteRemaining = totalLevelXP - xp
        azeritePct = 100 * (xp / totalLevelXP)

        TitanPanelButton_UpdateButton(self.registry.id)
    end
end
-----------------------------------------------
local eventsTable = {
    CVAR_UPDATE = UpdateAll,
    PLAYER_ENTERING_WORLD = UpdateAll,
    PLAYER_EQUIPMENT_CHANGED = UpdateAll,
    AZERITE_ITEM_EXPERIENCE_CHANGED = UpdateAll,
    AZERITE_ITEM_POWER_LEVEL_CHANGED = UpdateAll,
}
-----------------------------------------------
local function GetButtonText(self, id)
    if azeriteMaximum then
        local lvl = "|cFFFFFFFF[|r" .. CHARCOLOR .. azeriteLevel .. "|cFFFFFFFF]|r "
        local dif = "|cFFFF2e2e(" .. azeriteRemaining .. ")|r "
        local account = "|cFF69FF69" .. azeriteCount .. "|r|||cFFFFFFFF" .. azeriteMaximum .. "|r "
        local percentage = "|cFFFFFFFF[|r|cFF69FF69" .. string.format("%0.1f%%", azeritePct) .. "|r|cFFFFFFFF]|r"

        return L["AzeriteLabel"], lvl .. account .. dif .. percentage
    else
        return L["noheart"]
    end
end
-----------------------------------------------
local function GetTooltipText(self, id)
    if azeriteMaximum then
        local azeritetooltipText = L["AzeriteDescription"] .. "\n \n" .. L["info"] .. "\n" .. L["AzeriteLevel"] .. "\t|cFFFFFFFF" .. azeriteLevel .. "|r\n" .. L["AzeriteXP"] .. "\t|cFFFFFFFF" .. azeriteCount .. "|r\n" .. L["AzeritetoLvL"] .. "\t|cFFFFFFFF" .. azeriteRemaining .. "|r\n" .. L["AzeritetoMaximum"] .. "\t|cFFFFFFFF" .. azeriteMaximum

        return azeritetooltipText
    else
        return L["noheart"]
    end
end
-----------------------------------------------
local function OnClick(self, button)
	if (button == "LeftButton") then
		ToggleCharacter("PaperDollFrame");
	end
end
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
    name = L["mBfA"].." Titan|cFF66b1ea "..L["AzeriteTitle"].."|r",
    tooltip = L["AzeriteTitle"],
    icon = ICON,
    category = "CATEGORY_BFA",
    version = version,
    onClick = OnClick,
    getButtonText = GetButtonText,
    getTooltipText = GetTooltipText,
    eventsTable = eventsTable,
    prepareMenu = PrepareMenu,
    savedVariables = {
        ShowIcon = 1,
        DisplayOnRightSide = false,
        ShowLabelText = false,
    }
})
