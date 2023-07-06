--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
L.Elib = LibStub("Elib-4.0").Register
local version = GetAddOnMetadata(ADDON_NAME, "Version")

local function GetCharTable(titanId)
	TitanCurrenciesMultiDb = TitanCurrenciesMultiDb or {}
	TitanCurrenciesMultiDb[titanId] = TitanCurrenciesMultiDb[titanId] or { charTable = {} }
	return TitanCurrenciesMultiDb[titanId].charTable
end

function L:CreateSimpleCurrencyPlugin(params)
	local currencyCount = 0.0
	local startcurrency

	local currencyInfoBase = C_CurrencyInfo.GetCurrencyInfo(params.currencyId)
	local ICON = currencyInfoBase.iconFileID
	local CURRENCY_NAME = currencyInfoBase.name
	local currencyMaximum = currencyInfoBase.maxQuantity

	local PLAYER_NAME, PLAYER_REALM
	local PLAYER_KEY
	local PLAYER_FACTION
	local PLAYER_CLASS_COLOR

	local function GetAndSaveCurrency()
		local info = C_CurrencyInfo.GetCurrencyInfo(params.currencyId)
		local amount = info.quantity
		local totalMax = info.maxQuantity
		if not PLAYER_KEY then
			return amount, totalMax
		end

		local charTable = GetCharTable(params.titanId)

		charTable[PLAYER_KEY] = charTable[PLAYER_KEY] or {}
		charTable[PLAYER_KEY].currency = amount
		charTable[PLAYER_KEY].name = PLAYER_CLASS_COLOR .. PLAYER_NAME
		charTable[PLAYER_KEY].faction = PLAYER_FACTION

		return amount, totalMax
	end

	local function Update(self)
		local amount, totalMax = GetAndSaveCurrency()

		currencyCount = amount or 0
		currencyMaximum = totalMax or 0
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

			self.registry.menuText = params.expName .. " Titan|cFF66b1ea " .. CURRENCY_NAME .. "|r" -- Correção pra bug do Titan que faz as cores não aparecerem no menu

			Update(self)
		end,
	}
	-----------------------------------------------
	local function GetButtonText()
		local AddSeparator = TitanGetVar(params.titanId, "AddSeparator")
		local currencyCountText = TitanUtils_GetHighlightText(AddSeparator and BreakUpLargeNumbers(currencyCount) or (currencyCount or "0"))
		if currencyCount and currencyMaximum > 0 then
			local currencyCountText = AddSeparator and BreakUpLargeNumbers(currencyCount) or (currencyCount or "0")
			if currencyCount > currencyMaximum * 0.4 and currencyCount < currencyMaximum * 0.59 then
				currencyCountText = "|cFFf6ed12" .. currencyCountText
			elseif currencyCount > currencyMaximum * 0.59 and currencyCount < currencyMaximum * 0.79 then
				currencyCountText = "|cFFf69112" .. currencyCountText
			elseif currencyCount > currencyMaximum * 0.79 then
				currencyCountText = "|cFFFF2e2e" .. currencyCountText
			end
		end

		local maxBarText = ""
		if currencyMaximum and currencyMaximum > 0 and TitanGetVar(params.titanId, "MaxBar") then
			maxBarText = "|r/|cFFFF2e2e" .. (AddSeparator and BreakUpLargeNumbers(currencyMaximum) or currencyMaximum) .. "|r"
		end

		local barBalanceText = ""
		if TitanGetVar(params.titanId, "ShowBarBalance") then
			local delta = (currencyCount - startcurrency)
			local deltaText = AddSeparator and BreakUpLargeNumbers(delta) or delta
			if delta > 0 then
				barBalanceText = " |cFF69FF69[" .. deltaText .. "]"
			elseif (currencyCount - startcurrency) < 0 then
				barBalanceText = " |cFFFF2e2e[" .. deltaText .. "]"
			end
		end

		return currencyCountText .. maxBarText .. barBalanceText
	end
	-----------------------------------------------
	local function CreateTooltip()
		GameTooltip:ClearLines()
		local link = C_CurrencyInfo.GetCurrencyLink and C_CurrencyInfo.GetCurrencyLink(params.currencyId, currencyCount)
		if (link and TitanGetVar(params.titanId, "UseHyperlink")) then
			GameTooltip:SetHyperlink(link)
			if (TitanGetVar(params.titanId, "HideInfoWhenHyperlink")) then
				return
			end
		else
			GameTooltip:AddLine(CURRENCY_NAME, 1, 1, 1)
		end

		local AddSeparator = TitanGetVar(params.titanId, "AddSeparator")
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["info"])

		if not currencyCount or currencyCount == 0 then
			GameTooltip:AddLine("|cFFFF2e2e" .. params.noCurrencyText)
		else
			local currentText = AddSeparator and BreakUpLargeNumbers(currencyCount) or currencyCount

			GameTooltip:AddDoubleLine(L["totalAcquired"], TitanUtils_GetHighlightText(currentText))
			if (currencyMaximum and currencyMaximum > 0) then
				local maxText = AddSeparator and BreakUpLargeNumbers(currencyMaximum) or currencyMaximum
				local canGetText = AddSeparator and BreakUpLargeNumbers((currencyMaximum - currencyCount)) or (currencyMaximum - currencyCount)
				GameTooltip:AddDoubleLine(L["maxpermitted"], TitanUtils_GetHighlightText(maxText))
				GameTooltip:AddDoubleLine(L["canGet"], TitanUtils_GetHighlightText(canGetText))
			end

			local sessionValueText = "0" -- Cores da conta de valor
			if currencyCount and startcurrency then
				local dif = currencyCount - startcurrency
				local difText = AddSeparator and BreakUpLargeNumbers(dif) or dif
				if dif == 0 then
					sessionValueText = TitanUtils_GetHighlightText("0")
				elseif dif > 0 then
					sessionValueText = "|cFF69FF69" .. difText
				else
					sessionValueText = "|cFFFF2e2e" .. difText
				end
			end

			GameTooltip:AddDoubleLine(L["session"], sessionValueText)
		end

		if TitanGetVar(params.titanId, "ShowAltText") then
			local charTable = GetCharTable(params.titanId)
			local total = 0
			local showAllFactions = TitanGetVar(params.titanId, "ShowAllFactions")

			GameTooltip:AddLine(" ")
			GameTooltip:AddLine(L["AltChars"])

			local sortBy = TitanGetVar(params.titanId, "AltTextSortByAmount") and "currency"
			local sortAsc = not sortBy
			local sortedList = L.Utils.SortTableBy(charTable, sortBy, sortAsc)
			for _, p in ipairs(sortedList) do
				local k, v = p.key, p.value
				local isCurrent = k == PLAYER_KEY
				if isCurrent or ((showAllFactions or PLAYER_FACTION == v.faction) and (v.currency or 0) > 0) then
					local arrow = isCurrent and "> " or ""
					local arrowEnd = isCurrent and "|r <" or ""
					local amountText = AddSeparator and BreakUpLargeNumbers(v.currency) or v.currency

					GameTooltip:AddDoubleLine(arrow .. v.name .. arrowEnd, "|cFFFFFFFF" .. (amountText))
					total = total + v.currency
				end
			end

			GameTooltip:AddDoubleLine(L["TotalAlt"], AddSeparator and BreakUpLargeNumbers(total) or total)
		end
	end

	local function ifZero(valueToCheck, resultIfZero, resultElse)
		if (valueToCheck == nil or valueToCheck <= 0) then
			return resultIfZero
		end
		return resultElse
	end

	L.Elib({
		id = params.titanId,
		name = params.expName .. " Titan|cFF66b1ea " .. CURRENCY_NAME .. "|r",
		tooltip = CURRENCY_NAME,
		customTooltip = CreateTooltip,
		icon = ICON,
		category = params.category,
		version = version,
		getButtonText = GetButtonText,
		eventsTable = eventsTable,
		prepareMenu = ifZero(currencyMaximum, L.PrepareCurrenciesMenu, L.PrepareCurrenciesMaxMenu),
		savedVariables = {
			ShowIcon = 1,
			DisplayOnRightSide = false,
			ShowBarBalance = false,
			ShowLabelText = false,
			ShowAltText = true,
			AltTextSortByAmount = false,
			ShowAllFactions = false,
			MaxBar = ifZero(currencyMaximum, nil, false),
			UseHyperlink = true,
			HideInfoWhenHyperlink = false,
			AddSeparator= false,
		}
	})

end

