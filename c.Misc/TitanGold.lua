--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Gold.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Eliote
--]]

local ADDON_NAME, L = ...;
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_OUROM"
local Color = {}
--Color.WHITE = "|cFFFFFFFF"
Color.RED = "|cFFDC2924"
--Color.YELLOW = "|cFFFFF244"
Color.GREEN = "|cFF3DDC53"
Color.OURO = "|cFFFFFF00"
Color.PRATA = "|cFFCCCCCC"
Color.BRONZE = "|cFFFF6600"

local ICO_OURO = "|TInterface\\MoneyFrame\\UI-GoldIcon:0|t"
local ICO_PRATA = "|TInterface\\MoneyFrame\\UI-SilverIcon:0|t"
local ICO_BRONZE = "|TInterface\\MoneyFrame\\UI-CopperIcon:0|t"

local PLAYER_NAME, PLAYER_REALM
local PLAYER_KEY
local PLAYER_FACTION
local PLAYER_CLASS_COLOR

local startMoney = 0

local function interp(str, tab)
	return (str:gsub('($%b{})', function(w) return tostring(tab[w:sub(3, -2)] or w) end))
end

local function trim(s)
	local from = s:match"^%s*()"
	return from > #s and "" or s:match(".*%S", from)
end

local function formatGold(value, cor, somenteMaior)
	local text = ""

	if not somenteMaior or value >= 10000 then
		text = text .. (cor or Color.OURO) .. FormatLargeNumber(math.floor(value / 10000)) .. ICO_OURO .. "|r "
	end

	if not somenteMaior or (value >= 100 and value < 10000) then
		text = text .. (cor or Color.PRATA) .. math.floor((value / 100) % 100) .. ICO_PRATA .. "|r "
	end

	if not somenteMaior or (value < 100) then
		text = text .. (cor or Color.BRONZE) .. math.floor(value % 100) .. ICO_BRONZE .. "|r"
	end

	text = trim(text)

	return text
end

local function GetAndSaveMoney(id)
	local money = GetMoney()

	local charTable = L.Utils.GetCharTable(ID)
	charTable[PLAYER_KEY] = charTable[PLAYER_KEY] or {}
	charTable[PLAYER_KEY].value = money
	charTable[PLAYER_KEY].name = PLAYER_CLASS_COLOR .. PLAYER_NAME
	charTable[PLAYER_KEY].realm = PLAYER_REALM
	charTable[PLAYER_KEY].faction = PLAYER_FACTION

	return money
end

local function GetButtonText(self, id)
	local money = GetMoney()

	local balance = ""
	if TitanGetVar(id, "ShowBarBalance") then
		local dif = money - startMoney
		if dif > 0 then
			balance = Color.GREEN .. " [+" .. formatGold(dif, nil, true) .. Color.GREEN .. "]"
		elseif dif < 0 then
			balance = Color.RED .. " [-" .. formatGold(-dif, Color.RED, true) .. Color.RED .. "]"
		end
	end

	return L["GoldTitle"] .. ": ", formatGold(money, nil, TitanGetVar(id, "ShowHigherOnly")) .. balance
end

local function GetTooltipText(self, id)
	local money = GetAndSaveMoney(id)

	local text = interp(L["GoldPlayerTip"], { player = PLAYER_NAME }) .. "\n \n"

	local charTable = L.Utils.GetCharTable(ID)

	if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
		local success, value =  pcall(C_Bank.FetchDepositedMoney, Enum.BankType.Account)

		if success and value > 0 then
			local newCharTable = {}
			newCharTable[L["WarbandBank"]] = {}
			newCharTable[L["WarbandBank"]].value = value
			newCharTable[L["WarbandBank"]].faction = PLAYER_FACTION
			newCharTable[L["WarbandBank"]].realm = PLAYER_REALM
			newCharTable[L["WarbandBank"]].name = "|cFF00CCFF" .. L["WarbandBank"]
			-- Merge the tables
			for k,v in pairs(charTable) do newCharTable[k] = v end
			charTable = newCharTable
		end
	end

	local showAllFactions = TitanGetVar(ID, "ShowAllFactions")
	local total = 0
	local dif = money - startMoney
	if dif > 0 then
		text = text .. L["session"] .. "\t" .. formatGold(dif) .. "\n \n"
	elseif dif < 0 then
		text = text .. L["session"] .. "\t" .. formatGold(-dif, Color.RED) .. "\n \n"
	end

	local sortBy = TitanGetVar(id, "AltTextSortByAmount") and "value"
	local sortAsc = not sortBy
	local sortedList = L.Utils.SortTableBy(charTable, sortBy, sortAsc)
	for _, p in ipairs(sortedList) do
		local k, v = p.key, p.value
		local isCurrent = k == PLAYER_KEY
		if isCurrent or ((showAllFactions or PLAYER_FACTION == v.faction) and (v.value or 0) > 0) then
			local arrow = isCurrent and "> " or ""
			local arrowEnd = isCurrent and "|r <" or ""
			text = text .. arrow .. v.name .. arrowEnd .. "\t" .. (formatGold(v.value)) .. "\n|r"
			total = total + v.value
		end
	end

	text = text .. " \n"
	text = text .. "Total:\t" .. formatGold(total)

	return text
end

local function OnClick(self, button)
	if (button == "LeftButton") then
		ToggleCharacter("TokenFrame");
	end
end

local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		PLAYER_NAME, PLAYER_REALM = UnitFullName("player")
		PLAYER_KEY = PLAYER_NAME .. "-" .. PLAYER_REALM
		PLAYER_FACTION = UnitFactionGroup("player")
		PLAYER_CLASS_COLOR = "|c" .. RAID_CLASS_COLORS[select(2, UnitClass("player"))].colorStr

		startMoney = GetAndSaveMoney(self.registry.id)

		-- Reset menuText to fix colors in titan menu
		self.registry.menuText = L["mOther"].." Titan|cFF66b1ea "..L["GoldTitle"].."|r"

		TitanPanelButton_UpdateButton(self.registry.id)
	end,
	PLAYER_MONEY = function(self)
		TitanPanelButton_UpdateButton(self.registry.id)
	end
}

L.Elib({
	id = ID,
	name = L["mOther"].." Titan|cFF66b1ea "..L["GoldTitle"].."|r",
	tooltip = L["GoldTitle"],
	icon = "Interface\\Icons\\inv_misc_coin_02.blp",
	category = "CATEGORY_MISC",
	version = version,
	getButtonText = GetButtonText,
	getTooltipText = GetTooltipText,
	eventsTable = eventsTable,
	onClick = OnClick,
	menus = {
		{ type = "toggle", text = L["HigherOnly"], var = "ShowHigherOnly", def = true, keepShown = true },
		{ type = "toggle", text = L["showbb"], var = "ShowBarBalance", def = true, keepShown = true },
		{ type = "toggle", text = L["showAllFactions"], var = "ShowAllFactions", def = false, keepShown = true },
		{ type = "toggle", text = L["sortByAmount"], var = "AltTextSortByAmount", def = false, keepShown = true },
		{ type = "rightSideToggle" }
	},
	savedVariables = {
		ShowIcon = 1,
		DisplayOnRightSide = false,
		ShowBarBalance = false,
		ShowLabelText = false,
		ShowHigherOnly = false,
		charTable = {},
		ShowAllFactions = false,
	}
})
