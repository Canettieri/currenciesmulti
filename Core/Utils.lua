local _, T = ...

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

-- First argument from ElioteDropDownMenu is 'self', just ignore it
function Utils.ToggleRightSideDisplay(_, id)
	-- Right side display
	local bar = TitanUtils_GetWhichBar(id)
	TitanToggleVar(id, "DisplayOnRightSide");
	TitanPanel_RemoveButton(id);
	TitanUtils_AddButtonOnBar(bar, id);
	TitanPanelButton_UpdateButton(id)
end
