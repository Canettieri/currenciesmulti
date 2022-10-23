--[[
	Do you want help us translating to your language?
	Send your file with translations in: https://www.curseforge.com/wow/addons/titan-panel-currencies-multi
	Author: Canettieri
  Russian translator: PocoMaxa, davekeys
	Last update: 25/02/2018
--]]

local _, L = ...;
if GetLocale() == "ruRU" then
------ Draenor pack
--- Apexis Crystal
L["ApexisTitle"] = "Апекситовые кристаллы"
L["ApexisDescription"] = "Апекситовые кристаллы, оставшиеся от давно угасшей древней\rцивилизации, заключают в себе практически неисчерпаемые\rрезервы магической энергии."
--- Dingy Iron Coins
L["IronCoinsTitle"] = "Тусклые железные монеты"
L["IronCoinsDescription"] = "Возможно, они ценнее, чем кажутся\rна первый взгляд."
L["NoMaxCoin"] = "Только для разбойников, доступно\rв Warlords of Draenor."
--- Garrison Resources
L["ResourcesTitle"] = "Ресурсы гарнизона"
L["ResourcesDescription"] = "Добывайте ресурсы, чтобы отстраивать\rи расширять ваш гарнизон."
L["NoMaxRes"] = "Доступно в гарнизоне."
--- Oil
L["OilTitle"] = "Нефть"
L["OilDescription"] = "Нефть встречается главным образом в Танаанских\rджунглях и используется в заданиях для флота."
L["NoMaxOil"] = "Доступно на пристани гарнизона."
--- Primal Spirit
L["SpiritTitle"] = "Первобытный дух"
L["SpiritDescription"] = "Можно использовать для изготовления предметов\rили для обмена у специального торговца в вашем\rгарнизоне."
--- Seal of Inevitable Fate
L["InevitableTitle"] = "Печать неизбежной судьбы"
L["InevitableDescription"] = "Вмешательство в естественный ход событий, предоставляющее\rвозможность получения дополнительных сокровищ в рейдах\rЦитадели Адского Пламени и эпохальных подземельях."
--- Seal of Tempered Fate
L["TemperedTitle"] = "Печать закаленной судьбы"
L["TemperedDescription"] = "Вмешательство в естественный ход событий, предоставляющее\rвозможность получения дополнительных сокровищ в рейдах в\rземлях клана Верховного Молота и Литейной Черной Горы."

------ Events pack
--- Brewfest Prize Token
L["BrewTitle"] = "Призовой жетон Хмельного фестиваля"
L["BrewDescription"] = "Используются для обмена на предметы Хмельного\rфестиваля в Стальгорне или Оргриммаре."
L["NoToken"] = "Доступно во время игрового события Хмельной\rфестиваль."
--- Coin of Ancestry
L["AncestryTitle"] = "Монета Наследия"
L["AncestryDescription"] = "Знак почета и уважения к предкам."
L["NoAncestry"] = "Доступно во время события Лунный\rФестиваль."
--- Darkmoon Prize Ticket
L["DarkmoonTitle"] = "Призовой купон ярмарки Новолуния"
L["DarkmoonDescription"] = "Выдается за победы в состязаниях ярмарки\rНоволуния или за помощь ее устроителям."
L["NoTickets"] = "Доступно во время игрового события\rЯрмарка Новолуния."
--- Love Token
L["LoveTitle"] = "Знак любви"
L["LoveDescription"] = "Можно обменять на товары у милых\rпродавщиц в любой столице."
L["NoLove"] = "Доступно во время события\rЛюбовная Лихорадка."
--- Spooky Supplies
L["SpookyTitle"] = "Страшные припасы"
L["SpookyDescription"] = "Можно обменять у координатора\rсобытий в вашем гарнизоне."
L["HallowEnd"] = "Доступно во время игрового\rсобытия Тыквовин."
--- Tricky Treat
L["TrickyTitle"] = "Тыквовинские сладости"
L["TrickyDescription"] = "Используются как валюта во время\rТыквовина. А в целом, очень вкусная\rконфета!"

------ Legion pack
--- Ancient Mana
L["ManaTitle"] = "Древняя мана"

------ Old pack
--- Bloody Coin
L["BloodyTitle"] = "Окровавленная монета"
L["BloodyDescription"] = "Эту монету можно найти на еще теплых телах врагов,\rвстретивших смерть в туманах Вневременного острова."
L["NoBloody"] = "Available using |cff0070ddCenser of Eternal Agony|r|cFFFF2e2e\ror|r |cff0070ddFire-Watcher's Oath|r |cFFFF2e2ein Timeless Isle.|r" -- NO TRANSLATION
--- Champion's Seal
L["ChampionsTitle"] = "Печать чемпиона"
L["ChampionsDescription"] = "За храбрость, проявленную на\rтурнирах Колизея Авангарда."
L["NoChampions"] = "Доступно на Ристалище Серебрянного\rАвангарда в Нордсколе."
--- Timeless Coin
L["TimelessTitle"] = "Вневременная монета"
L["TimelessDescription"] = "Вы чувствуете прикосновение призрачных пальцев предыдущих\rвладельцев монеты, как будто ткань времени рвется. Вы можете\rиспользовать эту монету на Вневременном острове для\rполучения ценных наград."
L["NoTimeless"] = "Доступно на Вневременном острове."

------ Others pack
--- Gold
L["GoldTitle"] = "Золото"
L["GoldPlayerTip"] = "|cFFB4EEB4Подсказка:|r |cFFFFFFFFлевый клик открывает\rокно валют ${player}|cFFFFFFFF.|r"
L["HigherOnly"] = "Отображать только наивысшие значения"
--- Timewarped Badge
L["TimewarpedTitle"] = "Искаженный временем знак"
L["TimewarpedDescription"] = "Получено в подземелье в режиме путешествия во\rвремени. Можно предложить торговцам в\rШаттрате или Даларане."
L["NoBadge"] = "Для получения нужно встать в очередь подземелий\rво время события Путешествие во времени."

------ Eventual pack (will be only available sometimes)
--- Lovely Charm
L["LovelyTitle"] = "Чудесный оберег"
L["LovelyDescription"] = "Использование: Сделать чудесный браслет-оберег\rиз 10 талисманов."

--- Shared
L["full"] = "Максимум!"
L["maximum"] = "Max"
L["DraenorOnly"] = "Доступно в Draenor."
L["LegionOnly"] = "Доступно на Расколотых островах."
L["PandariaOnly"] = "Доступно в Пандарии."
L["session"] = "Получено за сессию: "
L["showbb"] = "Отображать на панели баланс сессии"
L["mEvent"] = "[|cFF198ae0Событие|r]"
L["mOther"] = "[|cFF198ae0Другое|r]"
end
