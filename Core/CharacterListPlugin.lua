--[[
	Description: This plugin is part of the "Titan Panel [Currencies] Multi" addon.
	Site: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
	This file written by Protuhj
--]]

local ADDON_NAME, L = ...;
L.Elib = LibStub("Elib-4.0").Register
local GetAddOnMetadata = C_AddOns and C_AddOns.GetAddOnMetadata or GetAddOnMetadata
local ACE = LibStub("AceLocale-3.0"):GetLocale("Titan", true)
local version = GetAddOnMetadata(ADDON_NAME, "Version")
local TITAN_ID = "TITAN_MCCHARS"
local PLAYER_KEY

StaticPopupDialogs["CONFIRM_PURGE"] = {
	text = L["purgeDataQuestion"],
	button1 = YES,
	button2 = NO,
	OnAccept = function(self)
		print("Purging data for: " .. self.character)
		for key, val in pairs(TitanCurrenciesMultiDb) do
			if string.match(key, "^TITAN_") ~= nil then
				val.charTable[self.character] = nil;
			end
		end
		print("done!")
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
	preferredIndex = 3,  -- avoid some UI taint, see http://www.wowace.com/announcements/how-to-avoid-some-ui-taint/
};

local function PrepareCharacterList(eddm, self, id, level, menuList)
	local CHUNK_SIZE = 20;
	if (level or 1) == 1 then
		eddm.UIDropDownMenu_AddButton(L.Utils.CreateTitle(id, TitanPlugins[id].menuText));
		if not TitanCurrenciesMultiDb then
			eddm.UIDropDownMenu_AddButton(L.Utils.CreateTitle(id, "Unable to load character DB"));
			return
		end
		eddm.UIDropDownMenu_AddButton({
			notCheckable = true,
			text = ACE["TITAN_PANEL_MENU_HIDE"],
			func = function()
				TitanPanelRightClickMenu_Hide(id);
			end
		});
		eddm.UIDropDownMenu_AddButton({
			text = CLOSE,
			notCheckable = true,
			keepShownOnClick = false,
		});
		eddm.UIDropDownMenu_AddSeparator();
		-- Probably need to limit how much is displayed, because I imagine
		-- some people have more characters than will work here
		local charList = {};
		local uniqueChars = {};
		-- Using #charCount didn't work, so I have to track the size of the list separately
		local charCount = 0;
		for pluginID, pluginData in pairs(TitanCurrenciesMultiDb) do
			if string.match(pluginID, "^TITAN_") ~= nil then
				for key, val in pairs(pluginData.charTable) do
					if key ~= PLAYER_KEY and not uniqueChars[key] then
						table.insert(charList, { key = key, value = val.name } )
						uniqueChars[key] = true
						charCount = charCount + 1;
					end
				end
			end
		end
		-- Sort the character list alphabetically
		table.sort(charList, function(a,b) return a.key < b.key end);
		local splitChars = (true and #charList > CHUNK_SIZE) or false;
		if not splitChars then
			for _, charData in pairs(charList) do
				-- Grab the color from the charTable.name and turn the key into that color
				-- The charTable.name only has the name, no realm
				local charName = string.sub(charData.key, 1, string.find(charData.key, "-") - 1);
				local color = string.sub(charData.value, 1, string.find(charData.value, charName) - 1);
				eddm.UIDropDownMenu_AddButton({
					notCheckable = true,
					text = color .. charData.key,
					hasArrow = true,
					menuList = {
						{ text = L["purgeDataMenu"], char = charData.key }
					},
				}, 1);
			end
		else
			local menusCreated = 1;
			local totalProcessed = 1;
			local subMenuData = {};
			for _, charData in pairs(charList) do
				-- Grab the color from the charTable.name and turn the key into that color
				-- The charTable.name only has the name, no realm
				local charName = string.sub(charData.key, 1, string.find(charData.key, "-") - 1);
				local color = string.sub(charData.value, 1, string.find(charData.value, charName) - 1);
				table.insert(subMenuData, { key = charData.key, color = color} )
				if #subMenuData == CHUNK_SIZE or totalProcessed == #charList then
					eddm.UIDropDownMenu_AddButton({
						notCheckable = true,
						text = string.format(L["charsChunkMenu"], menusCreated),
						hasArrow = true,
						menuList = {
							{ chars = subMenuData }
						},
					}, 1);
					subMenuData = {};
					menusCreated = menusCreated + 1;
				end
				totalProcessed = totalProcessed + 1;
			end
		end
	elseif #menuList == 1 and menuList[1].text then
		eddm.UIDropDownMenu_AddButton({
			notCheckable = true,
			text = menuList[1].text,
			func = function()
				local dialog = StaticPopup_Show("CONFIRM_PURGE", menuList[1].char);
				if (dialog) then
					dialog.character = menuList[1].char;
				end
			end
		}, level);
	elseif #menuList == 1 and menuList[1].chars then
		for _, charData in pairs(menuList[1].chars) do
			eddm.UIDropDownMenu_AddButton({
				notCheckable = true,
				text = charData.color .. charData.key,
				hasArrow = true,
				menuList = {
					{ text = L["purgeDataMenu"], char = charData.key }
				},
			}, level);
		end
	end
end

local eventsTable = {
	PLAYER_ENTERING_WORLD = function(self, ...)
		self:UnregisterEvent("PLAYER_ENTERING_WORLD");
		self.PLAYER_ENTERING_WORLD = nil;

		local PLAYER_NAME, PLAYER_REALM = UnitFullName("player");
		PLAYER_KEY = PLAYER_NAME .. "-" .. PLAYER_REALM;

		self.registry.menuText = "[|cFF198ae0".. ADDON_NAME .. "|r]|cFF66b1ea " .. L["charListPluginDisplayName"] .. "|r";

		TitanPanelButton_UpdateButton(self.registry.id);
	end,
};
L.Elib({
	id = TITAN_ID,
	name = "[|cFF198ae0".. ADDON_NAME .. "|r]|cFF66b1ea " .. L["charListPluginDisplayName"] .. "|r",
	icon = "Interface\\Icons\\INV_Misc_QuestionMark",
	tooltip = L["charListPluginDisplayName"],
	getTooltipText = function()
		return L["charMgmtTooltip"];
	end,
	category = "CATEGORY_MISC",
	eventsTable = eventsTable,
	version = version,
	menuText = "[|cFF198ae0".. ADDON_NAME .. "|r]|cFF66b1ea " .. L["charListPluginDisplayName"] .. "|r",
	getButtonText = function()
		return TitanUtils_GetHighlightText(ADDON_NAME .." " .. L["charListPluginDisplayName"]);
	end,
	prepareMenu = PrepareCharacterList,
});