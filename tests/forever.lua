-- Run from the addon root: lua tests/forever.lua (Lua 5.1).
local configs, frames, variables = {}, {}, {}
local playerName, faction, money = "Tester", "Alliance", 12345
local categories = { "Information" }
TITAN_ID = "Titan"
TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY = { "Information" }
TitanPlugins, StaticPopupDialogs = {}, {}
RAID_CLASS_COLORS = { MAGE = { colorStr = "ffffffff" } }
WOW_PROJECT_ID, WOW_PROJECT_MAINLINE = 1, 1
GetLocale = function() return "enUS" end
UnitFullName = function() return playerName, "Realm" end
UnitFactionGroup = function() return faction end
UnitClass = function() return "Mage", "MAGE" end
GetMoney = function() return money end
FormatLargeNumber, BreakUpLargeNumbers = tostring, tostring
TitanUtils_GetHighlightText = function(value) return "H(" .. value .. ")" end
TitanUtils_GetRedText = function(value) return "R(" .. value .. ")" end
TitanUtils_GetGreenText = function(value) return "G(" .. value .. ")" end
TitanPanelButton_UpdateButton = function() end
TitanGetVar = function(id, key) return variables[id][key] end
TitanToggleVar = function(id, key) variables[id][key] = not variables[id][key] end
C_AddOns = { GetAddOnMetadata = function() return "test" end }
C_CurrencyInfo, C_Bank, Enum = nil, nil, nil
local selectedTab
ToggleCharacter = function(tab) selectedTab = tab end
local function register(config)
    assert(not configs[config.id], "Duplicate plugin: " .. config.id)
    configs[config.id], variables[config.id] = config, config.savedVariables or {}
    frames[config.id] = { registry = { id = config.id, menuText = config.name }, UnregisterEvent = function() end }
    TitanPlugins[config.id] = frames[config.id].registry
    return frames[config.id]
end
LibStub = function(name)
    if name == "Elib-4.0" then return { Register = register } end
    return { GetLocale = function() return { TITAN_PANEL_MENU_CATEGORIES = categories } end }
end
local L = {}
local function loadAddon(path) assert(loadfile(path))("TitanCurrenciesMulti", L) end
local toc = assert(io.open("TitanCurrenciesMulti_Camelot.toc"))
for line in toc:lines() do
    local path = line:gsub("\r", ""):gsub("\\", "/")
    if path:match("%.lua$") and not path:find("ElioteDropDownMenu", 1, true)
        and not path:find("Elib-4.0", 1, true) then loadAddon(path) end
end
toc:close()
local count = 0
for _ in pairs(configs) do count = count + 1 end
assert(count == 7) -- Five currencies, Gold, and the management utility.
assert(#categories == 3 and #TITAN_PANEL_BUTTONS_PLUGIN_CATEGORY == 3)
local ids = {
    [3402] = "TITAN_FOREVER_MERCHANTSFAVOR", [3469] = "TITAN_FOREVER_UNDERMINEREAL",
    [515] = "TITAN_DRKTKM", [1792] = "TITAN_PVHNRM", [3468] = "TITAN_FOREVER_RANKPOINTS",
}
local function tooltip(id)
    local result = { lines = {}, doubles = {} }
    function result:ClearLines() self.lines, self.doubles = {}, {} end
    function result:AddLine(text) self.lines[#self.lines + 1] = text end
    function result:AddDoubleLine(label, text) self.doubles[label] = text end
    function result:SetHyperlink(link) self.link = link end
    configs[id].customTooltip(nil, result)
    return result
end
for _, id in pairs(ids) do
    assert(configs[id].getButtonText() == "H(--)")
    assert(tooltip(id).lines[3] == L.foreverCurrencyUnavailable)
    configs[id].eventsTable.PLAYER_ENTERING_WORLD(frames[id])
    assert(L.Utils.GetCharTable(id)["Tester-Realm"] == nil)
end
local data = {}
for currencyID in pairs(ids) do
    data[currencyID] = { name = "Localized " .. currencyID, iconFileID = currencyID,
        quantity = 100, maxQuantity = 0 }
end
local queried, secret = {}, false
issecretvalue = function() return secret end
C_CurrencyInfo = { GetCurrencyInfo = function(currencyID)
    assert(ids[currencyID], "Unexpected currency lookup: " .. currencyID)
    queried[#queried + 1] = currencyID
    return data[currencyID]
end }
local id = ids[3402]
local function update(currencyID) configs[id].eventsTable.CURRENCY_DISPLAY_UPDATE(frames[id], currencyID) end
for currencyID, pluginID in pairs(ids) do
    configs[pluginID].onUpdate(frames[pluginID])
    assert(frames[pluginID].registry.tooltipTitle == "Localized " .. currencyID)
    assert(frames[pluginID].registry.icon == currencyID)
end
variables[id].ShowBarBalance = true
assert(configs[id].getButtonText() == "H(100)")
data[3402].quantity = 125
update(3402)
assert(configs[id].getButtonText():find("[+25]", 1, true))
assert(L.Utils.GetCharTable(id)["Tester-Realm"].currency == 125)
local calls = #queried
update(999)
assert(#queried == calls) -- Unrelated events are filtered.
data[3402] = nil
update(nil)
assert(configs[id].getButtonText() == "H(--)")
assert(L.Utils.GetCharTable(id)["Tester-Realm"].currency == 125)
data[3402] = { name = "Updated name", iconFileID = 9, quantity = 150, maxQuantity = 165,
    useTotalEarnedForMaxQty = true, totalEarned = 160, quantityEarnedThisWeek = 10, maxWeeklyQuantity = 20 }
configs[id].onUpdate(frames[id])
assert(configs[id].getButtonText():find("[+50]", 1, true))
assert(frames[id].registry.tooltipTitle == "Updated name")
local tip = tooltip(id)
assert(tip.doubles[L.canGet] == "5" and tip.doubles[L.foreverWeeklyProgress] == "10/20")
assert(tip.doubles[L.maxpermitted] == "165")
secret = true
data[3402].quantity = 200
configs[id].onUpdate(frames[id])
assert(configs[id].getButtonText() == "H(--)")
assert(L.Utils.GetCharTable(id)["Tester-Realm"].currency == 150)
secret = false
data[3402].quantity, data[3402].maxQuantity = 0, 200
data[3402].useTotalEarnedForMaxQty = false
update(nil)
assert(configs[id].getButtonText():find("[-100]", 1, true))
assert(L.Utils.GetCharTable(id)["Tester-Realm"].currency == 0)
local tableData = L.Utils.GetCharTable(id)
tableData["Other-Realm"] = { name = "Other", currency = 40, faction = "Alliance" }
tableData["Enemy-Realm"] = { name = "Enemy", currency = 60, faction = "Horde" }
assert(tooltip(id).doubles[L.TotalAlt] == "40")
variables[id].ShowAllFactions = true
assert(tooltip(id).doubles[L.TotalAlt] == "100")
variables[id].AltTextSortByAmount = true
tooltip(id)
local entries = {}
configs[id].prepareMenu({
    UIDropDownMenu_AddButton = function(info) entries[#entries + 1] = info end,
    UIDropDownMenu_AddSpace = function() end, UIDropDownMenu_AddSeparator = function() end,
}, frames[id], id)
local maxOption, warbandOption = false, false
for _, entry in ipairs(entries) do
    if entry.text == L.maxBar then maxOption = true end
    if entry.text == L.showWarbandTotal then warbandOption = true end
end
assert(maxOption and not warbandOption)
configs[id].onClick(frames[id], "LeftButton")
assert(selectedTab == "TokenFrame")
-- Exercise the shared Gold fix without assuming C_Bank or Enum exists.
local gold = configs.TITAN_OUROM
gold.eventsTable.PLAYER_ENTERING_WORLD(frames.TITAN_OUROM)
assert(type(gold.getTooltipText(frames.TITAN_OUROM, "TITAN_OUROM")) == "string")
C_Bank, Enum = { FetchDepositedMoney = function() return nil end }, { BankType = { Account = 2 } }
gold.getTooltipText(frames.TITAN_OUROM, "TITAN_OUROM")
C_Bank.FetchDepositedMoney = function() return 90000 end
assert(gold.getTooltipText(frames.TITAN_OUROM, "TITAN_OUROM"):find(L.WarbandBank, 1, true))
print("PASS: Camelot loading, five currency IDs, delayed/secret data, recovery, zero balance, caps, sessions, alt filters, menu, Gold optional bank")
