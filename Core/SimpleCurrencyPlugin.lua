--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
L.Elib = LibStub("Elib-4.0").Register
local version = GetAddOnMetadata(ADDON_NAME, "Version")

local function Util_StringComDefault(v, d)
	if not v then
		return d
	end
	return v
end

local function GetCharTable(titanId)
	TitanCurrenciesMultiDb = TitanCurrenciesMultiDb or {}
	TitanCurrenciesMultiDb[titanId] = TitanCurrenciesMultiDb[titanId] or { charTable = {} }
	return TitanCurrenciesMultiDb[titanId].charTable
end

function L:CreateSimpleCurrencyPlugin(currencyId, titanId)
	local currencyCount = 0.0
	local startcurrency

	local currencyInfoBase = C_CurrencyInfo.GetCurrencyInfo(currencyId)
	local ICON = currencyInfoBase.iconFileID
	local CURRENCY_NAME = currencyInfoBase.name

	local PLAYER_NAME, PLAYER_REALM
	local PLAYER_KEY
	local PLAYER_FACTION
	local PLAYER_CLASS_COLOR

	local function GetAndSaveCurrency()
		local info = C_CurrencyInfo.GetCurrencyInfo(currencyId)
		local amount = info.quantity
		if not PLAYER_KEY then return amount end

		local charTable = GetCharTable(titanId)

		charTable[PLAYER_KEY] = charTable[PLAYER_KEY] or {}
		charTable[PLAYER_KEY].currency = amount
		charTable[PLAYER_KEY].name = PLAYER_CLASS_COLOR .. PLAYER_NAME
		charTable[PLAYER_KEY].faction = PLAYER_FACTION

		return amount
	end

	local function Update(self)
		local amount = GetAndSaveCurrency()

		currencyCount = amount or 0
		if amount and not startcurrency then
			startcurrency = currencyCount
		end

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
		local currencyCountText
		if not currencyCount then
			currencyCountText = TitanUtils_GetHighlightText("0")
		else
			currencyCountText = TitanUtils_GetHighlightText(currencyCount)
		end

		local BarBalanceText = ""
		if TitanGetVar(titanId, "ShowBarBalance") then
			if (currencyCount - startcurrency) > 0 then
				BarBalanceText = " |cFF69FF69[" .. (currencyCount - startcurrency) .. "]"
			elseif (currencyCount - startcurrency) < 0 then
				BarBalanceText = " |cFFFF2e2e[" .. (currencyCount - startcurrency) .. "]"
			end
		end

		return currencyCountText .. BarBalanceText
	end
	-----------------------------------------------
	local function CreateTooltip()
		GameTooltip:ClearLines()
		local link = C_CurrencyInfo.GetCurrencyLink(currencyId, currencyCount)
		if (link) then
			GameTooltip:SetHyperlink(link)
		else
			GameTooltip:AddLine(CURRENCY_NAME, 1, 1, 1)
		end

		local ColorValueAccount = "0" -- Cores da conta de valor
		if currencyCount and startcurrency then
			local dif = currencyCount - startcurrency
			if dif == 0 then
				ColorValueAccount = TitanUtils_GetHighlightText("0")
			elseif dif > 0 then
				ColorValueAccount = "|cFF69FF69" .. dif
			else
				ColorValueAccount = "|cFFFF2e2e" .. dif
			end
		end

		local valorAtual = TitanUtils_GetHighlightText(Util_StringComDefault(currencyCount, "0"))

		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["info"])

		if valorAtual == TitanUtils_GetHighlightText("0") then
			GameTooltip:AddLine("|cFFFF2e2e" .. L["SLShared02"])
		else
			GameTooltip:AddDoubleLine(L["totalAcquired"], valorAtual)
			GameTooltip:AddDoubleLine(L["session"], ColorValueAccount)
		end

		if TitanGetVar(titanId, "ShowAltText") then
			local charTable = GetCharTable(titanId)
			local total = currencyCount
			local showAllFactions = TitanGetVar(titanId, "ShowAllFactions")

			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(L["AltChars"])

			-- the current char first!
			GameTooltip:AddDoubleLine(charTable[PLAYER_KEY].name, "|cFFFFFFFF" .. (currencyCount))

			for k, v in pairs(charTable) do
				if k ~= PLAYER_KEY and (showAllFactions or PLAYER_FACTION == v.faction) and (v.currency or 0) > 0 then
					GameTooltip:AddDoubleLine(v.name, "|cFFFFFFFF" .. (v.currency))
					total = total + v.currency
				end
			end

			GameTooltip:AddDoubleLine(L["TotalAlt"], total)
		end
	end
	-----------------------------------------------
	L.Elib({
		id = titanId,
		name = L["mShadowlands"] .. " Titan|cFF66b1ea " .. CURRENCY_NAME .. "|r",
		tooltip = CURRENCY_NAME,
		customTooltip = CreateTooltip,
		icon = ICON,
		category = "CATEGORY_SHADOWLANDS",
		version = version,
		getButtonText = GetButtonText,
		eventsTable = eventsTable,
		prepareMenu = L.PrepareCurrenciesMenu,
		savedVariables = {
			ShowIcon = 1,
			DisplayOnRightSide = false,
			ShowBarBalance = false,
			ShowLabelText = false,
			ShowAltText = true,
			ShowAllFactions = false,
		}
	})

end

