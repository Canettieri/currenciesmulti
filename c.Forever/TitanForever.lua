-- Public player-facing Camelot currencies; IDs/scope: docs/forever-currencies.md.
local _, L = ...
for _, currency in ipairs({
    { 3402, "TITAN_FOREVER_MERCHANTSFAVOR", "Merchant's Favor" },
    { 3469, "TITAN_FOREVER_UNDERMINEREAL", "Tarnished Undermine Real" },
    { 515, "TITAN_DRKTKM", "Darkmoon Prize Ticket" },
    { 1792, "TITAN_PVHNRM", "Honor Points" },
    { 3468, "TITAN_FOREVER_RANKPOINTS", "Rank Points" },
}) do
    L:CreateForeverCurrencyPlugin({ currencyId = currency[1], titanId = currency[2], name = currency[3] })
end
