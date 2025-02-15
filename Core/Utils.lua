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
