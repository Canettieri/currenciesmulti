local _, T = ...

local ACE = LibStub("AceLocale-3.0"):GetLocale(TITAN_ID, true)
local Utils = {}
T.Utils = Utils

function Utils.SortTableBy(t, valueKey, asc)
	local sortedList = {}
	for k, v in pairs(t) do
		table.insert(sortedList, { key = k, value = v, lowerKey = tostring(k):lower() })
	end
	if (asc) then
		if not valueKey then
			table.sort(sortedList, function(a, b)
				return a.lowerKey < b.lowerKey
			end)
		else
			table.sort(sortedList, function(a, b)
				return a.value[valueKey] < b.value[valueKey]
			end)
		end
	else
		if not valueKey then
			table.sort(sortedList, function(a, b)
				return a.lowerKey > b.lowerKey
			end)
		else
			table.sort(sortedList, function(a, b)
				return a.value[valueKey] > b.value[valueKey]
			end)
		end
	end
	return sortedList
end

function Utils.ifZero(valueToCheck, resultIfZero, resultElse)
	if (valueToCheck == nil or valueToCheck <= 0) then
		return resultIfZero
	end
	return resultElse
end

function Utils.GetCharTable(titanId)
	TitanCurrenciesMultiDb = TitanCurrenciesMultiDb or {}
	TitanCurrenciesMultiDb[titanId] = TitanCurrenciesMultiDb[titanId] or { charTable = {} }
	return TitanCurrenciesMultiDb[titanId].charTable
end

function Utils.CreateTitle(id, text)
	local info = {};
	info.text = text;
	info.notClickable = true
	info.notCheckable = true
	info.isTitle = true
	info.isUninteractable = true
	info.hasArrow = false
	return info
end

function Utils.CreateToggle(id, text, var)
	local info = {}
	info.text = text
	info.func = function()
		TitanToggleVar(id, var);
		TitanPanelButton_UpdateButton(id)
	end
	info.arg1 = id
	info.arg2 = var
	info.checked = TitanGetVar(id, var)
	info.keepShownOnClick = true
	return info
end

-- Adds the "Shift Right", "Shift Left", "Hide", and "Close" menus
function Utils.AddCommonMenuItems(eddm, id)
	eddm.UIDropDownMenu_AddButton({
		text = ACE["TITAN_PANEL_SHIFT_RIGHT"],
		func = function()
			TitanUtils_ShiftButtonOnBarRight(id)
		end,
		arg1 = id,
		keepShownOnClick = true,
		notCheckable = true
	});

	eddm.UIDropDownMenu_AddButton({
		text = ACE["TITAN_PANEL_SHIFT_LEFT"],
		func = function()
			TitanUtils_ShiftButtonOnBarLeft(id)
		end,
		arg1 = id,
		keepShownOnClick = true,
		notCheckable = true
	});

	eddm.UIDropDownMenu_AddSpace();

	eddm.UIDropDownMenu_AddButton({
		notCheckable = true,
		text = ACE["TITAN_PANEL_MENU_HIDE"],
		func = function()
			TitanPanelRightClickMenu_Hide(id)
		end
	})

	eddm.UIDropDownMenu_AddSeparator();

	eddm.UIDropDownMenu_AddButton({
		text = CLOSE,
		notCheckable = true,
		keepShownOnClick = false,
	});
end

-- First argument from ElioteDropDownMenu is 'self', just ignore it
function Utils.ToggleRightSideDisplay(_, id)
	-- Right side display
	local bar = TitanUtils_GetWhichBar(id)
	TitanToggleVar(id, "DisplayOnRightSide");
	TitanPanel_RemoveButton(id);
	TitanUtils_AddButtonOnBar(bar, id);
	TitanPanelButton_UpdateButton(id)
end

-- This is the TitanGlobal.lua function "Encode"
---@param color string Hex color code (can handle 3 or 4 byte codes, 3 bytes will get 'FF' prepended)
---@param text string Text to wrap
---@return string text Color encoded string
function Utils.ColorText(color, text)
	-- This does the sanity checks for the Get<color> routines below
	local res = ""
	local c = tostring(color)
	local t = tostring(text)
	if (c and t) then
		local alpha = ""
		if string.len(c) == 6 then
			alpha = "ff"
		end
		res = "|c" .. alpha .. c .. t .. "|r"
	else
		if (t) then
			res = tostring(t)
		else
			-- return blank string
		end
	end

	return res
end
