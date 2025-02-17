--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	Special Thanks to Eliote.
--]]

local ADDON_NAME, L = ...;
L.Elib = LibStub("Elib-4.0").Register
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local GetItemCount = GetItemCount or C_Item.GetItemCount
local version = GetAddOnMetadata(ADDON_NAME, "Version")


function L:CreateSimpleItemPlugin(params)
	local itemMixin = Item:CreateFromItemID(params.itemId)

	local currencyCount = 0.0
	local startcurrency

	local PLAYER_NAME, PLAYER_REALM
	local PLAYER_KEY
	local PLAYER_FACTION
	local PLAYER_CLASS_COLOR

	local function GetAndSaveCurrency()
		local amount = GetItemCount(params.itemId, true)
		local amountBag = GetItemCount(params.itemId)
		if not PLAYER_KEY then
			return amount, amountBag
		end

		local charTable = L.Utils.GetCharTable(params.titanId)

		charTable[PLAYER_KEY] = charTable[PLAYER_KEY] or {}
		charTable[PLAYER_KEY].currency = amount
		charTable[PLAYER_KEY].name = PLAYER_CLASS_COLOR .. PLAYER_NAME
		charTable[PLAYER_KEY].faction = PLAYER_FACTION

		return amount, amountBag
	end

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

			-- Reset menuText to fix colors in titan menu
			self.registry.menuText = params.expName .. " Titan|cFF66b1ea " .. (itemMixin:GetItemName() or params.titanId) .. "|r"

			TitanPanelButton_UpdateButton(self.registry.id)

			self.BAG_UPDATE = function(self, bagID)
				local token = GetAndSaveCurrency()
				local currencyBag = token

				if currencyCount == currencyBag then
					return
				end
				currencyCount = currencyBag

				TitanPanelButton_UpdateButton(self.registry.id)
			end
			self:RegisterEvent("BAG_UPDATE")
		end
	}

	local function GetButtonText()
		local AddSeparator = TitanGetVar(params.titanId, "AddSeparator")
		local currencyCountText = TitanUtils_GetHighlightText(AddSeparator and BreakUpLargeNumbers(currencyCount) or (currencyCount or "0"))

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

		return currencyCountText .. barBalanceText
	end

	local function CreateTooltip()
		GameTooltip:ClearLines()
		local link = itemMixin:GetItemLink()
		if (link and TitanGetVar(params.titanId, "UseHyperlink")) then
			GameTooltip:SetHyperlink(link)
			if (TitanGetVar(params.titanId, "HideInfoWhenHyperlink")) then
				return
			end
		else
			GameTooltip:AddLine(itemMixin:GetItemName(), 1, 1, 1)
		end

		local AddSeparator = TitanGetVar(params.titanId, "AddSeparator")
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["info"])

		if not currencyCount or currencyCount == 0 then
			GameTooltip:AddLine("|cFFFF2e2e" .. params.noCurrencyText)
		else
			local bag = GetItemCount(params.itemId)
			local bank = GetItemCount(params.itemId, true) - bag
			local bagText = AddSeparator and BreakUpLargeNumbers(bag) or bag
			local bankText = AddSeparator and BreakUpLargeNumbers(bank) or bank

			GameTooltip:AddDoubleLine(L["totalbag"], TitanUtils_GetHighlightText(bagText))
			GameTooltip:AddDoubleLine(L["totalbank"], TitanUtils_GetHighlightText(bankText))

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
			local charTable = L.Utils.GetCharTable(params.titanId)
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

	L.Elib({
		id = params.titanId,
		name = params.expName .. " Titan|cFF66b1ea " .. params.titanId .. "|r",
		tooltip = "",
		customTooltip = CreateTooltip,
		icon = "0",
		category = params.category,
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
			AltTextSortByAmount = false,
			ShowAllFactions = false,
			UseHyperlink = true,
			HideInfoWhenHyperlink = false,
			AddSeparator= false,
		},
		afterLoad = function(self)
			itemMixin:ContinueOnItemLoad(function()
				self.registry.menuText = params.expName .. " Titan|cFF66b1ea " .. itemMixin:GetItemName() .. "|r"
				self.registry.tooltipTitle = itemMixin:GetItemName()
				self.registry.icon = itemMixin:GetItemIcon()
				TitanPanelButton_UpdateButton(params.titanId)
			end)
		end
	})
end

