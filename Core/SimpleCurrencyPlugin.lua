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

			Update(self)
		end,
	}
	-----------------------------------------------
	local function GetButtonText()
		local currencyCountText = TitanUtils_GetHighlightText(currencyCount or "0")
		if currencyCount and currencyMaximum > 0 then
			if currencyCount > currencyMaximum * 0.4 and currencyCount < currencyMaximum * 0.59 then
				currencyCountText = "|cFFf6ed12" .. currencyCount
			elseif currencyCount > currencyMaximum * 0.59 and currencyCount < currencyMaximum * 0.79 then
				currencyCountText = "|cFFf69112" .. currencyCount
			elseif currencyCount > currencyMaximum * 0.79 then
				currencyCountText = "|cFFFF2e2e" .. currencyCount
			end
		end

		local maxBarText = ""
		if currencyMaximum and currencyMaximum > 0 and TitanGetVar(params.titanId, "MaxBar") then
			maxBarText = "|r/|cFFFF2e2e" .. currencyMaximum .. "|r"
		end

		local barBalanceText = ""
		if TitanGetVar(params.titanId, "ShowBarBalance") then
			if (currencyCount - startcurrency) > 0 then
				barBalanceText = " |cFF69FF69[" .. (currencyCount - startcurrency) .. "]"
			elseif (currencyCount - startcurrency) < 0 then
				barBalanceText = " |cFFFF2e2e[" .. (currencyCount - startcurrency) .. "]"
			end
		end

		return currencyCountText .. maxBarText .. barBalanceText
	end
	-----------------------------------------------
	local function CreateTooltip()
		GameTooltip:ClearLines()
		local link = C_CurrencyInfo.GetCurrencyLink(params.currencyId, currencyCount)
		if (link) then
			GameTooltip:SetHyperlink(link)
		else
			GameTooltip:AddLine(CURRENCY_NAME, 1, 1, 1)
		end

		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["info"])

		if not currencyCount or currencyCount == 0 then
			GameTooltip:AddLine("|cFFFF2e2e" .. params.noCurrencyText)
		else
			GameTooltip:AddDoubleLine(L["totalAcquired"], TitanUtils_GetHighlightText(currencyCount))
			if (currencyMaximum and currencyMaximum > 0) then
				GameTooltip:AddDoubleLine(L["maxpermitted"], TitanUtils_GetHighlightText(currencyMaximum))
				GameTooltip:AddDoubleLine(L["canGet"], TitanUtils_GetHighlightText((currencyMaximum - currencyCount)))
			end

			local sessionValueText = "0" -- Cores da conta de valor
			if currencyCount and startcurrency then
				local dif = currencyCount - startcurrency
				if dif == 0 then
					sessionValueText = TitanUtils_GetHighlightText("0")
				elseif dif > 0 then
					sessionValueText = "|cFF69FF69" .. dif
				else
					sessionValueText = "|cFFFF2e2e" .. dif
				end
			end

			GameTooltip:AddDoubleLine(L["session"], sessionValueText)
		end

		if TitanGetVar(params.titanId, "ShowAltText") then
			local charTable = GetCharTable(params.titanId)
			local total = currencyCount
			local showAllFactions = TitanGetVar(params.titanId, "ShowAllFactions")

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
			ShowAllFactions = false,
			MaxBar = ifZero(currencyMaximum, nil, false),
		}
	})

end

