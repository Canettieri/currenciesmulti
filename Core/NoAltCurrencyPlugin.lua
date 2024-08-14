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

function L:CreateNoAltCurrencyPlugin(params)
	local currencyCount = 0.0
	local startcurrency

	local currencyInfoBase = C_CurrencyInfo.GetCurrencyInfo(params.currencyId)
	local ICON = currencyInfoBase.iconFileID
	local CURRENCY_NAME = currencyInfoBase.name
	local currencyMaximum = currencyInfoBase.maxQuantity or 0
	local useTotalEarnedForMaxQty = currencyInfoBase.useTotalEarnedForMaxQty
	local totalSeasonalEarned = currencyInfoBase.totalEarned
	-- For whatever reason, the value can be nil when the plugin first loads
	-- If the creator knows that the currency has a maximum, then allow them to force it to be treated as if it had a max.

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
		local currencyCountTextNoColor = AddSeparator and BreakUpLargeNumbers(currencyCount) or (currencyCount or "0")
		local currencyCountText = TitanUtils_GetHighlightText(currencyCountTextNoColor)
		if (currencyCount or totalSeasonalEarned) and currencyMaximum > 0 then
			local maxCheckCurrency = (useTotalEarnedForMaxQty and totalSeasonalEarned) or currencyCount
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
		end

		local maxBarText = ""
		if currencyMaximum and currencyMaximum > 0 and TitanGetVar(params.titanId, "MaxBar") then
			local localMaxValue = (useTotalEarnedForMaxQty and totalEarned) or currencyMaximum
			local canEarnText = (AddSeparator and BreakUpLargeNumbers(localMaxValue - totalSeasonalEarned)) or (localMaxValue - totalSeasonalEarned)
			canEarnText = (useTotalEarnedForMaxQty and (" [" .. canEarnText .. "]")) or ""
			maxBarText = "|r/|cFFFF2e2e" .. (AddSeparator and BreakUpLargeNumbers(currencyMaximum) or currencyMaximum)
			maxBarText = maxBarText .. canEarnText .. "|r"
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
				local localCountValue = (useTotalEarnedForMaxQty and totalSeasonalEarned) or currencyCount
				local maxText = (AddSeparator and BreakUpLargeNumbers(currencyMaximum)) or currencyMaximum
				local canGetText = (AddSeparator and BreakUpLargeNumbers(currencyMaximum - localCountValue)) or (currencyMaximum - localCountValue)
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
	end

	local prepMenu = L.PrepareNoAltCurrenciesMenuBase

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
		prepareMenu = prepMenu,
		savedVariables = {
			ShowIcon = 1,
			DisplayOnRightSide = false,
			ShowBarBalance = false,
			ShowLabelText = false,
			MaxBar = maxBarValue,
			UseHyperlink = true,
			HideInfoWhenHyperlink = false,
			AddSeparator= false,
		}
	})

end

