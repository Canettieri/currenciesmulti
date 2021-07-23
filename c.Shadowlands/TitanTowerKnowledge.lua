--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon. It shows your amount of Tower Knowledge.
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Canettieri
Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local ID = "TITAN_TWRKWM"
local ICON = "Interface\\Icons\\spell_broker_orb"
local CURRENCY_ID = 1904
local currencyCount = 0.0
local currencyMaximum
local currencySeason
local startcurrency

local PLAYER_NAME, PLAYER_REALM
local PLAYER_KEY
local PLAYER_FACTION
local PLAYER_CLASS_COLOR
-----------------------------------------------
local function Util_StringComDefault(v,d)
	if not v then
		return d
	end

	return v
end
-----------------------------------------------
local function GetCharTable()
	TitanCurrenciesMultiDb = TitanCurrenciesMultiDb or {}
	TitanCurrenciesMultiDb[ID] = TitanCurrenciesMultiDb[ID] or { charTable = {} }
	return TitanCurrenciesMultiDb[ID].charTable
end
local function GetAndSaveCurrency()
	local info = C_CurrencyInfo.GetCurrencyInfo(CURRENCY_ID)
	local amount = info.quantity
    local totalMax = info.maxQuantity
    local season = info.totalEarned
	if not PLAYER_KEY then return amount end

	local charTable = GetCharTable()

	charTable[PLAYER_KEY] = charTable[PLAYER_KEY] or {}
	charTable[PLAYER_KEY].currency = amount
	charTable[PLAYER_KEY].name = PLAYER_CLASS_COLOR .. PLAYER_NAME
	charTable[PLAYER_KEY].faction = PLAYER_FACTION

	return amount, totalMax, season
end
local function Update(self)
	local amount, totalMax, season = GetAndSaveCurrency(ID)

	currencyCount = amount or 0
	currencyMaximum = totalMax
	currencySeason = season or 0
	if amount and not startcurrency then startcurrency = currencyCount end

	TitanPanelButton_UpdateButton(self.registry.id)
end
-----------------------------------------------
local eventsTable = {
	CURRENCY_DISPLAY_UPDATE = Update,
	PLAYER_ENTERING_WORLD = function(self, ...)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD")
		self.PLAYER_ENTERING_WORLD = nil

		PLAYER_NAME, PLAYER_REALM = UnitFullName("player")
		PLAYER_KEY = PLAYER_NAME .. "-" .. PLAYER_REALM
		PLAYER_FACTION = UnitFactionGroup("player")
		PLAYER_CLASS_COLOR = "|c" .. RAID_CLASS_COLORS[select(2, UnitClass("player"))].colorStr

		Update(self)
	end,
}
-----------------------------------------------
local function GetButtonText(self, id)
	local canSpendText = "|cFFFFFFFF[|r|cFF69FF69"..currencyCount.."|r|cFFFFFFFF]|r"

	local currencyCountText
	if not currencySeason then
		currencyCountText = TitanUtils_GetHighlightText("0")
	elseif currencySeason > currencyMaximum * 0.4 and currencySeason < currencyMaximum * 0.59 then
		currencyCountText = "|cFFf6ed12"..currencySeason
	elseif currencySeason > currencyMaximum * 0.59 and currencySeason < currencyMaximum * 0.79 then
		currencyCountText = "|cFFf69112"..currencySeason
	elseif currencySeason > currencyMaximum * 0.79 then
		currencyCountText = "|cFFFF2e2e"..currencySeason
	else
		currencyCountText = TitanUtils_GetHighlightText(currencySeason)
	end

	local BarBalanceText = ""
	if TitanGetVar(ID, "ShowBarBalance") then
		if (currencyCount - startcurrency) > 0 then
			BarBalanceText = " |cFF69FF69["..(currencyCount - startcurrency).."]"
		elseif (currencyCount - startcurrency) < 0 then
			BarBalanceText = " |cFFFF2e2e["..(currencyCount - startcurrency).."]"
		end
	end

	local maxBarText
	if currencyMaximum and currencyMaximum > 0 and TitanGetVar(ID, "MaxBar") then
		maxBarText = "|r/|cFFFF2e2e"..currencyMaximum.."|r"
	else
		maxBarText = ""
	end

	return canSpendText.." "..currencyCountText..maxBarText..BarBalanceText
end
-----------------------------------------------
local function GetTooltipText(self, id)
	local ColorValueAccount = "0" -- Cores da conta de valor
	if currencyCount and startcurrency then
		local dif = currencyCount - startcurrency
		if dif == 0 then
			ColorValueAccount = TitanUtils_GetHighlightText("0")
		elseif dif > 0 then
			ColorValueAccount = "|cFF69FF69"..dif
		else
			ColorValueAccount = "|cFFFF2e2e"..dif
		end
	end

	local valorSeason = TitanUtils_GetHighlightText(Util_StringComDefault(currencySeason, "0"))
	local valorMaximo = TitanUtils_GetHighlightText(Util_StringComDefault(currencyMaximum, "0"))
	local valorGastar = TitanUtils_GetHighlightText(Util_StringComDefault(currencyCount, "0"))

	local ValueText = "" -- Difere com e sem moeda
	if valorAtual == TitanUtils_GetHighlightText("0") then
		ValueText = L["info"] .. "\n" .. "|cFFFF2e2e" .. L["NoSLCurrency14"]
	else
		ValueText = L["info"] .. "\n" .. L["canExpend"] .. "\t" .. valorGastar .. "\n" .. L["seasonEarn"] .. "\t" .. valorSeason .. "\n" .. L["maxpermitted"] .. "\t" .. valorMaximo .. "\n" .. L["canGet"] .. "\t" .. TitanUtils_GetHighlightText((currencyMaximum - currencySeason)).. "\n" ..L["session"] .. "\t" .. ColorValueAccount
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

	return L["SLCurrency14Description"].."\r\r"..ValueText
end
-----------------------------------------------
L.Elib({
	id = ID,
	name = L["mShadowlands"] .. " Titan|cFF66b1ea " .. L["SLCurrency18Title"] .. "|r",
	tooltip = L["SLCurrency18Title"],
	icon = ICON,
	category = "CATEGORY_SHADOWLANDS",
	version = version,
	getButtonText = GetButtonText,
	getTooltipText = GetTooltipText,
	eventsTable = eventsTable,
	prepareMenu = L.PrepareCurrenciesMaxMenu,
	savedVariables = {
		ShowIcon = 1,
		DisplayOnRightSide = false,
		ShowBarBalance = false,
		ShowLabelText = false,
		MaxBar = false,
		ShowAltText = true,
	}
})
