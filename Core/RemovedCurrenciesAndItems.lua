--[[
	Description: This file is meant to allow us to remove database entries for currencies that are removed, deprecated, etc.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	This file was created by Protuhj
--]]
local ADDON_NAME, L = ...;

if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
	local function clean_db()
		if not TitanCurrenciesMultiDb then
			print("TitanCurrenciesMultiDb is nil?")
		end
		local removed = {
			"TITAN_TWWS2CATALYST", -- TWW S2 Catalyst Charges
			"TITAN_PUZZCARTCHIP", -- TWW S2 Puzzling Cartel Chip
			"TITAN_HARMONSILK", -- TWW S1 Catalyst Charges
			"TITAN_WEATHHARBCREST", -- TWW S1 Weathered Harbinger Crests
			"TITAN_CARVEDHARBCREST", -- TWW S1 Carved Harbinger Crests
			"TITAN_RUNEDHARBCREST", -- TWW S1 Runed Harbinger Crests
			"TITAN_GILDHARBCREST", -- TWW S1 Gilded Harbinger Crests
			"TITAN_KAALCHKNOW", -- TWW Khaz Algar Alchemy Knowledge
			"TITAN_KABSKNOW", -- TWW Khaz Algar Blacksmithing Knowledge
			"TITAN_KAENCHKNOW", -- TWW Khaz Algar Enchanting Knowledge
			"TITAN_KAENGKNOW", -- TWW Khaz Algar Engineering Knowledge
			"TITAN_KAHERBKNOW", -- TWW Khaz Algar Herbalism Knowledge
			"TITAN_KAINSCKNOW", -- TWW Khaz Algar Inscription Knowledge
			"TITAN_KAJCKNOW", -- TWW Khaz Algar Jewelcrafting Knowledge
			"TITAN_KALWKNOW", -- TWW Khaz Algar Leatherworking Knowledge
			"TITAN_KAMINEKNOW", -- TWW Khaz Algar Mining Knowledge
			"TITAN_KASKINKNOW", -- TWW Khaz Algar Skinning Knowledge
			"TITAN_KATAILKNOW", -- TWW Khaz Algar Tailoring Knowledge
			"TITAN_MEMNORTHREND", -- TWW Prepatch Memory of Northrend item
			"TITAN_MEMKALIMDOR", -- TWW Prepatch Memory of Kalimdor item
			"TITAN_MEMEASTKING", -- TWW Prepatch Memory of the Eastern Kingdoms item
			"TITAN_COLLYM", -- DF Cobalt Assembly rep currency, this was never really a "real" currency
			"TITAN_DLTPOD", -- DF Dilated Time Pod item
			"TITAN_PRESSM", -- DF Primeval Essence item
			"TITAN_DREAMENERGY", -- DF Dream Energy
			"TITAN_CLYCHM", -- DF S1 Catalyst Charges
			"TITAN_RENSFLM", -- DF S2  Renascent Shadowflame (Catalyst)
			"TITAN_WHELPDREAMINGCREST", -- DF S3 Whelpling's Dreaming Crests
			"TITAN_DRAKEDREAMINGCREST", -- DF S3 Drake's Dreaming Crests
			"TITAN_WYRMDREAMINGCREST", -- DF S3 Wyrm's Dreaming Crests
			"TITAN_ASPECTDREAMINGCREST", -- DF S3 Aspect's Dreaming Crests
			"TITAN_RNDRMM", -- DF S3 Renascent Dream (Catalyst)
			"TITAN_DRSGOON", -- DF S3 Dreamsurge Cocoon
			"TITAN_WHELPAWAKECREST", -- DF S4 Whelpling's Awakened Crests
			"TITAN_DRAKEAWAKECREST", -- DF S4 Drake's Awakened Crests
			"TITAN_WYRMAWAKECREST", -- DF S4 Wyrm's Awakened Crests
			"TITAN_ASPECTAWAKECREST", -- DF S4 Aspect's Awakened Crests
			"TITAN_RENASCENTAWAKE", -- DF S4 Renascent Awakening (Catalyst)
			"TITAN_DRSGCRADLE", -- DF S4 Dreamsurge Cradle
			"TITAN_ANTBRONZBULL", -- DF S4 Antique Bronze Bullion
			"TITAN_FLHTSM", -- DF Flightstones
			"TITAN_VLORM",  -- SL Valor
		}

		for _, titanID in pairs(removed) do
			if TitanCurrenciesMultiDb[titanID] then
				TitanCurrenciesMultiDb[titanID] = nil
			end
		end

	end
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("ADDON_LOADED")
	frame:SetScript("OnEvent", function(self, event, name)
		if event == "ADDON_LOADED" and name == ADDON_NAME then
			clean_db()
			frame:UnregisterAllEvents()
		end
	end)
end