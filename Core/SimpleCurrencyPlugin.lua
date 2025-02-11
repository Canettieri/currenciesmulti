--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
L.Elib = LibStub("Elib-4.0").Register
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local version = GetAddOnMetadata(ADDON_NAME, "Version")

local function GetCharTable(titanId)
	TitanCurrenciesMultiDb = TitanCurrenciesMultiDb or {}
	TitanCurrenciesMultiDb[titanId] = TitanCurrenciesMultiDb[titanId] or { charTable = {} }
	return TitanCurrenciesMultiDb[titanId].charTable
end

function L:CreateSimpleCurrencyPlugin(params)
	local currencyCount = 0.0
	local startcurrency
	-- Use separate variables to track your warband alt amounts so the display can be toggled at will
	-- If we don't track both, then you would lose session info if you happened to toggle
	-- the account total display on or off (Update() isn't called when an option is toggled)
	-- These values only track ALT amounts
	local warbandAltTotal = 0
	local warbandAltStartTotal
	-- Default to true, since the request won't work until at least PLAYER_ENTERING_WORLD
	local accountDataRequested = true

	local currencyInfoBase = C_CurrencyInfo.GetCurrencyInfo(params.currencyId)
	local ICON = currencyInfoBase.iconFileID
	local CURRENCY_NAME = currencyInfoBase.name
	local isAccountTransferable = currencyInfoBase.isAccountTransferable or false
	local currencyMaximum = currencyInfoBase.maxQuantity or 0
	local useTotalEarnedForMaxQty = currencyInfoBase.useTotalEarnedForMaxQty
	local totalSeasonalEarned = currencyInfoBase.totalEarned
	-- For whatever reason, the value can be nil when the plugin first loads
	-- If the creator knows that the currency has a maximum, then allow them to force it to be treated as if it had a max.
	local forceMax = params.forceMax or false
	-- For seasonal currencies, like crests added in Dragonflight and beyond, track how much the maximum allowed
	-- amount increases weekly, to be able to color the current amount more appropriately
	local weeklyIncrease = currencyInfoBase.maxWeeklyQuantity or 0

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

		-- Make sure these values are up to date, since they can be wrong when the addon first loads
		useTotalEarnedForMaxQty = info.useTotalEarnedForMaxQty
		totalSeasonalEarned = info.totalEarned
		isAccountTransferable = info.isAccountTransferable or false
		return amount, totalMax
	end

	local function Update(self)
		local amount, totalMax = GetAndSaveCurrency()
		if isAccountTransferable then
			local accountData = C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters(params.currencyId)
			if accountData then
				local total = 0
				-- The above API returns OTHER character data, not the current one
				for _, p in ipairs(accountData) do
					total = total + p.quantity
				end
				warbandAltTotal = total
				if warbandAltTotal and not warbandAltStartTotal then
					warbandAltStartTotal = warbandAltTotal
				end
			elseif not accountDataRequested then
				accountDataRequested = true
				C_CurrencyInfo.RequestCurrencyDataForAccountCharacters()
			end
		end
		currencyCount = amount or 0
		currencyMaximum = totalMax or 0
		if amount and not startcurrency then
			startcurrency = currencyCount
		end
		TitanPanelButton_UpdateButton(self.registry.id)
	end
	-----------------------------------------------
	local eventsTable = {
		CURRENCY_DISPLAY_UPDATE = function(self, ...)
			local currencyID = ...;
			-- If the currency is account-wide, then we can't filter out events where the currencyID argument is nil
			-- We can't rely on the ACCOUNT_CHARACTER_CURRENCY_DATA_RECEIVED event below, because it doesn't fire reliably following a transfer
			-- For regular currencies, try and reduce how often things update
			if isAccountTransferable or (currencyID == params.currencyId) then
				Update(self)
			end
		end,
		PLAYER_ENTERING_WORLD = function(self, ...)
			self:UnregisterEvent("PLAYER_ENTERING_WORLD")
			self.PLAYER_ENTERING_WORLD = nil
			accountDataRequested = false

			PLAYER_NAME, PLAYER_REALM = UnitFullName("player")
			PLAYER_KEY = PLAYER_NAME .. "-" .. PLAYER_REALM
			PLAYER_FACTION = UnitFactionGroup("player")
			PLAYER_CLASS_COLOR = "|c" .. RAID_CLASS_COLORS[select(2, UnitClass("player"))].colorStr

			self.registry.menuText = params.expName .. " Titan|cFF66b1ea " .. CURRENCY_NAME .. "|r" -- Correção pra bug do Titan que faz as cores não aparecerem no menu

			Update(self)
		end,
		ACCOUNT_CHARACTER_CURRENCY_DATA_RECEIVED = function(self, ...)
			if isAccountTransferable then
				Update(self)
			end
		end,
	}
	-----------------------------------------------
	local function GetButtonText()
		local showAccountTotal = TitanGetVar(params.titanId, "TotalBalanceBar") or false
		local AddSeparator = TitanGetVar(params.titanId, "AddSeparator")
		local currencyCountTextNoColor = AddSeparator and BreakUpLargeNumbers(currencyCount) or (currencyCount or "0")
		local currencyCountText = TitanUtils_GetHighlightText(currencyCountTextNoColor)
		if isAccountTransferable and showAccountTotal then
			local totalVal = currencyCount + warbandAltTotal
			currencyCountTextNoColor = AddSeparator and BreakUpLargeNumbers(totalVal) or (totalVal or "0")
			currencyCountText = "|cFF00CCFF" .. currencyCountTextNoColor
		elseif (currencyCount or totalSeasonalEarned) and currencyMaximum > 0 then
			local maxCheckCurrency = (useTotalEarnedForMaxQty and totalSeasonalEarned) or currencyCount
			-- For currencies with a static max amount
			if weeklyIncrease == 0 then
				if maxCheckCurrency > currencyMaximum * 0.4 and maxCheckCurrency < currencyMaximum * 0.59 then
					-- Yellow
					currencyCountText = "|cFFf6ed12" .. currencyCountTextNoColor
				elseif maxCheckCurrency > currencyMaximum * 0.59 and maxCheckCurrency < currencyMaximum * 0.79 then
					-- Orange
					currencyCountText = "|cFFf69112" .. currencyCountTextNoColor
				elseif maxCheckCurrency > currencyMaximum * 0.79 then
					-- Red
					currencyCountText = "|cFFFF2e2e" .. currencyCountTextNoColor
				end
			else
				-- For currencies that increase the maximum amount weekly, color based on how much you can still earn
				-- compared to the weekly increase amount
				local localMaxValue = (useTotalEarnedForMaxQty and totalSeasonalEarned) or currencyMaximum
				local canEarnAmount = localMaxValue - totalSeasonalEarned
				-- Basically reverse the logic above
				if canEarnAmount < weeklyIncrease * 0.79 and canEarnAmount > weeklyIncrease * 0.59 then
					-- Yellow
					currencyCountText = "|cFFf6ed12" .. currencyCountTextNoColor
				elseif canEarnAmount < weeklyIncrease * 0.59 and canEarnAmount > weeklyIncrease * 0.4 then
					-- Orange
					currencyCountText = "|cFFf69112" .. currencyCountTextNoColor
				elseif canEarnAmount < weeklyIncrease * 0.4 then
					-- Red
					currencyCountText = "|cFFFF2e2e" .. currencyCountTextNoColor
				end
			end
		end

		local maxBarText = ""
		if currencyMaximum and currencyMaximum > 0 and TitanGetVar(params.titanId, "MaxBar") then
			local localMaxValue = (useTotalEarnedForMaxQty and totalSeasonalEarned) or currencyMaximum
			local canEarnText = (AddSeparator and BreakUpLargeNumbers(localMaxValue - totalSeasonalEarned)) or (localMaxValue - totalSeasonalEarned)
			canEarnText = (useTotalEarnedForMaxQty and (" [" .. canEarnText .. "]")) or ""
			maxBarText = "|r/|cFFFF2e2e" .. (AddSeparator and BreakUpLargeNumbers(currencyMaximum) or currencyMaximum)
			maxBarText = maxBarText .. canEarnText .. "|r"
		end

		local barBalanceText = ""
		if TitanGetVar(params.titanId, "ShowBarBalance") then
			local delta = (currencyCount - startcurrency)
			if isAccountTransferable and showAccountTotal then
				delta = delta + (warbandAltTotal - warbandAltStartTotal)
			end
			local deltaText = AddSeparator and BreakUpLargeNumbers(delta) or delta
			if delta > 0 then
				barBalanceText = " |cFF69FF69[" .. deltaText .. "]"
			elseif delta < 0 then
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
		local showAccountTotal = TitanGetVar(params.titanId, "TotalBalanceBar") or false
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["info"])
		local hasCurrency = (currencyCount or 0 ) > 0
		hasCurrency = showAccountTotal and (hasCurrency or ((warbandAltTotal or 0) > 0)) or hasCurrency
		if (not hasCurrency) then
			GameTooltip:AddLine("|cFFFF2e2e" .. params.noCurrencyText)
		else
			local totalLabel = L["totalAcquired"]
			local dif = 0
			local localCurrencyCount = currencyCount
			local localStartCurrency = startcurrency
			if isAccountTransferable and showAccountTotal then
				localCurrencyCount = localCurrencyCount + warbandAltTotal
				localStartCurrency = localStartCurrency + warbandAltStartTotal
				totalLabel = L["warbandTotal"]
			end
			if localCurrencyCount and localStartCurrency then
				dif = localCurrencyCount - localStartCurrency
			end
			local currentText = AddSeparator and BreakUpLargeNumbers(localCurrencyCount) or localCurrencyCount

			GameTooltip:AddDoubleLine(totalLabel, TitanUtils_GetHighlightText(currentText))
			if (currencyMaximum and currencyMaximum > 0) then
				local localCountValue = (useTotalEarnedForMaxQty and totalSeasonalEarned) or currencyCount
				local maxText = (AddSeparator and BreakUpLargeNumbers(currencyMaximum)) or currencyMaximum
				local canGetText = (AddSeparator and BreakUpLargeNumbers(currencyMaximum - localCountValue)) or (currencyMaximum - localCountValue)
				GameTooltip:AddDoubleLine(L["maxpermitted"], TitanUtils_GetHighlightText(maxText))
				GameTooltip:AddDoubleLine(L["canGet"], TitanUtils_GetHighlightText(canGetText))
			end

			local difText = AddSeparator and BreakUpLargeNumbers(dif) or dif
			local sessionValueText = "0"
			if dif == 0 then
				sessionValueText = TitanUtils_GetHighlightText("0")
			elseif dif > 0 then
				sessionValueText = "|cFF69FF69" .. difText
			else
				sessionValueText = "|cFFFF2e2e" .. difText
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
	local prepMenu = L.PrepareCurrenciesMenu
	local maxBarValue = nil
	if isAccountTransferable then
		prepMenu = L.PrepareCurrenciesMenuWarband
	else
		prepMenu = ifZero(currencyMaximum, prepMenu, L.PrepareCurrenciesMaxMenu)
		maxBarValue = ifZero(currencyMaximum, nil, 0)
		if forceMax then
			prepMenu = L.PrepareCurrenciesMaxMenu
			maxBarValue = 1
		end
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
		onClick = L.DefaultCurrencyClickHandler,
		prepareMenu = prepMenu,
		savedVariables = {
			ShowIcon = 1,
			DisplayOnRightSide = false,
			ShowBarBalance = false,
			ShowLabelText = false,
			ShowAltText = true,
			AltTextSortByAmount = false,
			ShowAllFactions = false,
			MaxBar = maxBarValue,
			UseHyperlink = true,
			HideInfoWhenHyperlink = false,
			AddSeparator= false,
			TotalBalanceBar = false
		}
	})

end

