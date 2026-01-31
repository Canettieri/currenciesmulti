--[[
Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
It shows the different Housing lumber items
Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
Author: Protuhj
Special Thanks to Canettieri and Eliote.
--]]

local _, L = ...;

-- Classic
L:CreateSimpleItemPlugin({
    itemId = 245586,
    titanId = "TITAN_LUMBERIW",
    noCurrencyText = L["IronwoodLumber"],
    expName = L["mLumber"],
    category = "CATEGORY_HOUSING",
    allowAccountTotal = true
})

-- TBC
L:CreateSimpleItemPlugin({
	itemId = 242691,
	titanId = "TITAN_LUMBEROLEM",
	noCurrencyText = L["OlembaLumber"],
	expName = L["mLumber"],
	category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- WotLK
L:CreateSimpleItemPlugin({
	itemId = 251762,
	titanId = "TITAN_LUMBERCW",
	noCurrencyText = L["ColdwindLumber"],
	expName = L["mLumber"],
	category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- Cata
L:CreateSimpleItemPlugin({
    itemId = 251764,
    titanId = "TITAN_LUMBERASH",
    noCurrencyText = L["AshwoodLumber"],
    expName = L["mLumber"],
    category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- MoP
L:CreateSimpleItemPlugin({
	itemId = 251763,
	titanId = "TITAN_LUMBERBB",
	noCurrencyText = L["BambooLumber"],
	expName = L["mLumber"],
	category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- WoD
L:CreateSimpleItemPlugin({
	itemId = 251766,
	titanId = "TITAN_LUMBERSM",
	noCurrencyText = L["ShadowmoonLumber"],
	expName = L["mLumber"],
	category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- Legion
L:CreateSimpleItemPlugin({
	itemId = 251767,
	titanId = "TITAN_LUMBERFT",
	noCurrencyText = L["FelTouchedLumber"],
	expName = L["mLumber"],
	category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- BfA
L:CreateSimpleItemPlugin({
	itemId = 251768,
    titanId = "TITAN_LUMBERDARKP",
	noCurrencyText = L["DarkpineLumber"],
	expName = L["mLumber"],
	category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- SL
L:CreateSimpleItemPlugin({
    itemId = 251772,
    titanId = "TITAN_LUMBERARD",
    noCurrencyText = L["ArdenLumber"],
    expName = L["mLumber"],
    category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- DF
L:CreateSimpleItemPlugin({
    itemId = 251773,
    titanId = "TITAN_LUMBERDRAGP",
    noCurrencyText = L["DragonpineLumber"],
    expName = L["mLumber"],
    category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- TWW
L:CreateSimpleItemPlugin({
	itemId = 248012,
	titanId = "TITAN_LUMBERDORNFIR",
	noCurrencyText = L["DornicFirLumber"],
	expName = L["mLumber"],
	category = "CATEGORY_HOUSING",
	allowAccountTotal = true
})

-- -- Midnight
-- L:CreateSimpleItemPlugin({
    -- 	itemId = 256963,
    -- 	titanId = "TITAN_LUMBERCTHAL",
    -- 	noCurrencyText = L["ThalassianLumber"],
    -- 	expName = L["mLumber"],
    -- 	category = "CATEGORY_HOUSING",
    -- 	allowAccountTotal = true
    -- })

