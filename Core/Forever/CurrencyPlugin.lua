-- Camelot currencies: tolerate delayed/absent data without assuming Warband support.
local ADDON_NAME, L = ...
L.Elib = LibStub("Elib-4.0").Register
local GetMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata

local function IsNumber(value)
    return type(value) == "number" and not (issecretvalue and issecretvalue(value))
end

function L:CreateForeverCurrencyPlugin(params)
    local id = params.titanId
    local name, icon = params.name, 134400
    local count, maximum, earned, weekly, weeklyMax = 0, 0, 0, 0, 0
    local baseline, playerKey, playerName, playerFaction, playerColor
    local available = false

    local function Save()
        if not playerKey then return end
        L.Utils.GetCharTable(id)[playerKey] = {
            currency = count, name = playerColor .. playerName, faction = playerFaction,
        }
    end

    local function Refresh(self)
        local getter = C_CurrencyInfo and C_CurrencyInfo.GetCurrencyInfo
        local ok, info
        if getter then ok, info = pcall(getter, params.currencyId) end
        available = ok and type(info) == "table" and IsNumber(info.quantity)
        if available then
            name = info.name or name
            icon = info.iconFileID or icon
            count = info.quantity
            maximum = IsNumber(info.maxQuantity) and info.maxQuantity or 0
            earned = info.useTotalEarnedForMaxQty and IsNumber(info.totalEarned) and info.totalEarned or count
            weekly = IsNumber(info.quantityEarnedThisWeek) and info.quantityEarnedThisWeek or 0
            weeklyMax = IsNumber(info.maxWeeklyQuantity) and info.maxWeeklyQuantity or 0
            if baseline == nil then baseline = count end
            Save()
        end
        if self and self.registry then
            self.registry.icon = icon
            self.registry.tooltipTitle = name
            self.registry.menuText = L.Utils.MakeMenuText("Forever") .. " Titan " .. L.Utils.ColorText("FF66B1EA", name)
            TitanPanelButton_UpdateButton(id)
        end
        return true
    end

    local function EnterWorld(self)
        local player, realm = UnitFullName("player")
        if player and realm then
            playerName, playerKey = player, player .. "-" .. realm
            playerFaction = UnitFactionGroup("player")
            local color = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
            playerColor = "|c" .. (color and color.colorStr or "ffffffff")
        end
        Refresh(self)
    end

    local function Format(value)
        return TitanGetVar(id, "AddSeparator") and BreakUpLargeNumbers(value) or tostring(value)
    end

    local function GetButtonText()
        if not available then return TitanUtils_GetHighlightText("--") end
        local text = (maximum > 0 and earned >= maximum)
            and TitanUtils_GetRedText(Format(count)) or TitanUtils_GetHighlightText(Format(count))
        if maximum > 0 and TitanGetVar(id, "MaxBar") then text = text .. "/" .. Format(maximum) end
        if baseline and TitanGetVar(id, "ShowBarBalance") then
            local delta = count - baseline
            if delta > 0 then text = text .. TitanUtils_GetGreenText(" [+" .. Format(delta) .. "]") end
            if delta < 0 then text = text .. TitanUtils_GetRedText(" [" .. Format(delta) .. "]") end
        end
        return text
    end

    local function CreateTooltip(_, tooltip)
        tooltip = tooltip or GameTooltip
        tooltip:ClearLines()
        local linkGetter = C_CurrencyInfo and C_CurrencyInfo.GetCurrencyLink
        local ok, link
        if available and TitanGetVar(id, "UseHyperlink") and linkGetter then
            ok, link = pcall(linkGetter, params.currencyId, count)
        end
        if ok and link then
            tooltip:SetHyperlink(link)
            if TitanGetVar(id, "HideInfoWhenHyperlink") then return end
        else
            tooltip:AddLine(name, 1, 1, 1)
        end
        tooltip:AddLine(" ")
        if not available then tooltip:AddLine(L["foreverCurrencyUnavailable"]); return end
        tooltip:AddDoubleLine(L["totalAcquired"], Format(count))
        if maximum > 0 then
            tooltip:AddDoubleLine(L["maxpermitted"], Format(maximum))
            tooltip:AddDoubleLine(L["canGet"], Format(math.max(0, maximum - earned)))
        end
        if weeklyMax > 0 then
            tooltip:AddDoubleLine(L["foreverWeeklyProgress"], Format(weekly) .. "/" .. Format(weeklyMax))
        end
        tooltip:AddDoubleLine(L["session"], Format(count - (baseline or count)))
        if TitanGetVar(id, "ShowAltText") then
            tooltip:AddLine(" ")
            tooltip:AddLine(L["AltChars"])
            local total = 0
            local sortBy = TitanGetVar(id, "AltTextSortByAmount") and "currency" or nil
            for _, entry in ipairs(L.Utils.SortTableBy(L.Utils.GetCharTable(id), sortBy, not sortBy)) do
                local character = entry.value
                if IsNumber(character.currency) and (entry.key == playerKey
                    or TitanGetVar(id, "ShowAllFactions") or character.faction == playerFaction) then
                    tooltip:AddDoubleLine(character.name or entry.key, Format(character.currency))
                    total = total + character.currency
                end
            end
            tooltip:AddDoubleLine(L["TotalAlt"], Format(total))
        end
    end

    local function CurrencyChanged(self, currencyID)
        if currencyID == nil or currencyID == params.currencyId then Refresh(self) end
    end

    L.Elib({
        id = id, name = L.Utils.MakeMenuText("Forever") .. " Titan " .. L.Utils.ColorText("FF66B1EA", name),
        tooltip = name, icon = icon, category = "CATEGORY_FOREVER", version = GetMetadata(ADDON_NAME, "Version"),
        getButtonText = GetButtonText, customTooltip = CreateTooltip,
        onClick = L.DefaultCurrencyClickHandler, onUpdate = Refresh,
        prepareMenu = function(eddm, self) L.PrepareCurrenciesMenuBase(eddm, self, id, true, false) end,
        eventsTable = { PLAYER_ENTERING_WORLD = EnterWorld, CURRENCY_DISPLAY_UPDATE = CurrencyChanged },
        savedVariables = {
            ShowIcon = 1, ShowLabelText = false, DisplayOnRightSide = false,
            ShowBarBalance = false, MaxBar = true, ShowAltText = true,
            AltTextSortByAmount = false, ShowAllFactions = false, AddSeparator = false,
            UseHyperlink = true, HideInfoWhenHyperlink = false,
        },
    })
end
