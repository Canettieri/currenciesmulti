--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows Midnight items
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Protuhj
Special Thanks to Canettieri and Eliote.
--]]

local _, L = ...;

-- Angler Pearls
L:CreateSimpleCurrencyPlugin({
	currencyId = 3373,
	titanId = "TITAN_MIDNTANGLERPERL",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT"
})

-- Brimming Arcana
L:CreateSimpleCurrencyPlugin({
	currencyId = 3379,
	titanId = "TITAN_MIDNTBRIMARCAN",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT"
})

-- Latent Arcana
-- Eversong Woods Runestones events
L:CreateSimpleItemPlugin({
	itemId = 242241,
	titanId = "TITAN_MIDNTLATARCANA",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L.Utils.MakeMenuText(L["Eversong Woods"]),
	category = "CATEGORY_MIDNIGHT",
	allowAccountTotal = true
})

-- Finery Funds
L:CreateSimpleItemPlugin({
	itemId = 264882,
	titanId = "TITAN_MIDNTFINERYFUNDS",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT",
	allowAccountTotal = true
})

-- Luminous Dust
L:CreateSimpleCurrencyPlugin({
	currencyId = 3385,
	titanId = "TITAN_MIDNTLUMDUST",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L.Utils.MakeMenuText(L["Harandar"]),
	category = "CATEGORY_MIDNIGHT"
})

-- Remnant of Anguish
L:CreateSimpleCurrencyPlugin({
	currencyId = 3392,
	titanId = "TITAN_MIDNTREMANG",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT"
})

-- Restored Coffer Keys
L:CreateSimpleCurrencyPlugin({
	currencyId = 3028,
	titanId = "TITAN_RESTCOFFKEY",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT",
})

-- Shard of Dundun
L:CreateSimpleCurrencyPlugin({
	currencyId = 3376,
	titanId = "TITAN_MIDNTSHDOFDUN",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT"
})

-- Unalloyed Abundance
L:CreateSimpleCurrencyPlugin({
	currencyId = 3377,
	titanId = "TITAN_MIDNTUNALLABUN",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT"
})

-- Uncontaminated Void Sample
L:CreateSimpleCurrencyPlugin({
	currencyId = 3400,
	titanId = "TITAN_MIDNTUNCVOIDSMP",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L.Utils.MakeMenuText(L["Voidstorm"]),
	category = "CATEGORY_MIDNIGHT"
})

-- Vile Essence
-- Currency for Hexed Vilefeather Eagle mount in Zul'Aman
L:CreateSimpleItemPlugin({
	itemId = 259361,
	titanId = "TITAN_MIDNTVILEESS",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L.Utils.MakeMenuText(L["Zul'Aman"]),
	category = "CATEGORY_MIDNIGHT",
	allowAccountTotal = true
})

-- Voidlight Marl
L:CreateSimpleCurrencyPlugin({
	currencyId = 3316,
	titanId = "TITAN_MIDNTVLMARL",
	noCurrencyText = L["NoMidnightCurrency"],
	expName = L["mMidnight"],
	category = "CATEGORY_MIDNIGHT"
})
