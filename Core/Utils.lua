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

function Utils.ToggleRightSideDisplay(id)
	-- Right side display
	TitanToggleVar(id, "DisplayOnRightSide");
	TitanPanel_InitPanelButtons();
end