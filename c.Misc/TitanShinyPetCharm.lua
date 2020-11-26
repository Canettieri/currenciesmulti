--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Shiny Pet Charm.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_PTCMM"
local ITEM_ID = 116415
local currencyCount = 0
local startcurrency = 0

local PLAYER_NAME, PLAYER_REALM
local PLAYER_KEY
local PLAYER_FACTION
local PLAYER_CLASS_COLOR
-----------------------------------------------
local function GetCharTable()
	TitanCurrenciesMultiDb = TitanCurrenciesMultiDb or {}
	TitanCurrenciesMultiDb[ID] = TitanCurrenciesMultiDb[ID] or { charTable = {} }
	return TitanCurrenciesMultiDb[ID].charTable
end
local function GetAndSaveCurrency()
	local amount = GetItemCount(ITEM_ID, true)
	local amountBag = GetItemCount(ITEM_ID)
	if not PLAYER_KEY then return amount, amountBag end

	local charTable = GetCharTable()

	charTable[PLAYER_KEY] = charTable[PLAYER_KEY] or {}
	charTable[PLAYER_KEY].currency = amount
	charTable[PLAYER_KEY].name = PLAYER_CLASS_COLOR .. PLAYER_NAME
	charTable[PLAYER_KEY].faction = PLAYER_FACTION

	return amount, amountBag
end
local function Update(self)
	local amount, amountBag = GetAndSaveCurrency(ID)

	currencyCount = amount or 0
	if amount and not startcurrency then startcurrency = currencyCount end

	TitanPanelButton_UpdateButton(self.registry.id)
end
-----------------------------------------------
local function GetButtonText(self, id)
	local currencyCountText
	if not currencyCount then
		currencyCountText = TitanUtils_GetHighlightText("0")
	else
		currencyCountText = TitanUtils_GetHighlightText(currencyCount)
	end

	local barBalanceText = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (currencyCount - startcurrency) > 0 then
			barBalanceText = " |cFF69FF69["..(currencyCount - startcurrency).."]"
		elseif (currencyCount - startcurrency) < 0 then
			barBalanceText = " |cFFFF2e2e["..(currencyCount - startcurrency).."]"
		end
	end

	return L["PetLabel"], currencyCountText .. barBalanceText
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local colorValueAccount = "0" -- Cores da conta de valor

	local dif = currencyCount - startcurrency
	if dif == 0 then
		colorValueAccount = TitanUtils_GetHighlightText("0")
	elseif dif > 0 then
		colorValueAccount = "|cFF69FF69"..dif
	else
		colorValueAccount = "|cFFFF2e2e"..dif
	end

	local valorBag = L["totalbag"].. "\t" ..TitanUtils_GetHighlightText(GetItemCount(116415)).."\n"
	local valorBank = L["totalbank"].. "\t" ..TitanUtils_GetHighlightText(GetItemCount(116415, true) - GetItemCount(116415))

	local ValueText = "" -- Difere com e sem moeda
	if currencyCount == 0 then
		ValueText = L["info"] .. "\n" .. "|cFFFF2e2e" .. L["NoMaxPet"]
	else
		ValueText = L["info"] .. "\n" .. valorBag .. valorBank .. "\n".. L["session"] .. "\t" .. colorValueAccount
	end

	if TitanGetVar(ID, "ShowAltText") then
		ValueText = ValueText

		local charTable = GetCharTable()
		local total = currencyCount

		-- the current char first!
		ValueText = ValueText .. "\n \n" .. L["AltChars"] .. "\n" .. charTable[PLAYER_KEY].name .. "\t" .. "|cFFFFFFFF" .. (currencyCount) .. "\n|r"

		for k, v in pairs(charTable) do
			if k ~= PLAYER_KEY and PLAYER_FACTION == v.faction and (v.currency or 0) > 0 then
				ValueText = ValueText .. v.name .. "\t" .. "|cFFFFFFFF" .. (v.currency) .. "\n|r"
				total = total + v.currency
			end
		end

		ValueText = ValueText .. "\n"..L["TotalAlt"].."\t" .. total
	end

	return L["PetDescription"].."\r\r"..ValueText
end
-----------------------------------------------
local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		PLAYER_NAME, PLAYER_REALM = UnitFullName("player")
		PLAYER_KEY = PLAYER_NAME .. "-" .. PLAYER_REALM
		PLAYER_FACTION = UnitFactionGroup("player")
		PLAYER_CLASS_COLOR = "|c" .. RAID_CLASS_COLORS[select(2, UnitClass("player"))].colorStr

			local amount = GetAndSaveCurrency()
			startcurrency = amount
			currencyCount = startcurrency

		TitanPanelButton_UpdateButton(self.registry.id)

		self.BAG_UPDATE = function(self, bagID)
			local token = GetAndSaveCurrency()
			local currencyBag = token

			if currencyCount == currencyBag then return end
			currencyCount = currencyBag

			TitanPanelButton_UpdateButton(self.registry.id)
		end
		self:RegisterEvent("BAG_UPDATE")
	end
}
-----------------------------------------------
L.Elib({
	id = ID,
	name = L["mOther"].." Titan|cFF66b1ea "..L["PetTitle"].."|r",
	tooltip = L["PetTitle"],
	icon = "Interface\\Icons\\achievement_guildperk_honorablemention.blp",
	category = "CATEGORY_MISC",
	version = version,
	getButtonText = GetButtonText,
	getTooltipText = GetTooltipText,
	prepareMenu = L.PrepareCurrenciesMenu,
	savedVariables = {
		ShowIcon = 1,
		DisplayOnRightSide = false,
		HideMax = false,
		ShowBarBalance = false,
		ShowLabelText = false,
		ShowAltText = true,
	},
	eventsTable = eventsTable
})
