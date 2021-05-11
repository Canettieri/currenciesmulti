--[[
  Oi para você que é brasileiro (ou português) e está vindo até aqui ler as traduções! Se encontrar algum erro, me avise, tá bem?
  Esse addon foi feito por um cara que não manja nada de programação, então erros podem aparecer. xD
  Mas enfim, aproveite minhas gambiarras, foram feitas com amor para você. :)
  Tudo aqui neste arquivo foi traduzido por mim, Paulo Canettieri! (com ajuda do wowhead, claro...)
--]]

local _, L = ...;
if GetLocale() == "ptBR" then
------ Shadowlands pack
--- Argent Commendation
L["SLCurrency01Title"] = "Comenda Argêntea"
L["SLCurrency01Description"] = "Comenda da Cruzada Argêntea\restacionada no norte da Coroa\rde Gelo por ações tomadas\rcontra as forças invasoras das\rTerras Sombrias."
--- Grateful Offering
L["SLCurrency02Title"] = "Oferenda Agradecida"
L["SLCurrency02Description"] = "Um presente dos habitantes das\rTerras Sombrias, gratos pelo\rretorno da ânima. Obtido ao se\rconduzir ânima a um local e\rparticipar de atividades\rassociadas aos habitantes."
--- Infused Ruby
L["SLCurrency03Title"] = "Rubi Imbuído"
L["SLCurrency03Description"] = "Usado para energizar santuários e\rdispositivos que funcionam à base\rde ânima em Revendreth. Com a\rseca, vários dragadores passaram\ra aceitá-lo em troca de itens."
--- Medallion of Service
L["SLCurrency04Title"] = "Medalhão de Serviço"
L["SLCurrency04Description"] = "Uma distinção de serviço ao\rBastião. Usado para entrar\rno Caminho da Ascensão."
--- Shadowlands PvP Weekly Reward Progress
L["SLCurrency05Title"] = "Progresso da Recompensa Semanal JxJ de Shadowlands"
L["SLCurrency05Description"] = "Obtenha essa moeda para obter recompensas do baú semanal\rem Oribos."
--- Sinstone Fragments
L["SLCurrency06Title"] = "Fragmentos de Pedra de Pecado"
L["SLCurrency06Description"] = "O Arquivista Fane pode usar isso\rpara recriar Pedras de Pecado do\rInquisidor, que permitirão que\rvocê saia à caça de inquisidores\rnos Salões da Expiação."
--- Soul Ash
L["SLCurrency07Title"] = "Cinzas d'Alma"
L["SLCurrency07Description"] = "Uma fonte de poder bruta\rencontrada no Thanator. Usada\rpara alimentar a Câmara do\rEntalhador de Runas."
L["NoSLCurrency07"] = "Adquirida em Thanator."
--- Stygia
L["SLCurrency08Title"] = "Estígia"
L["SLCurrency08Description"] = "Resíduo da destruição violenta\rde uma alma na Gorja."
--- Redeemed Soul
L["SLCurrency09Title"] = "Alma Redimida"
L["SLCurrency09Description"] = "Uma alma excepcional que deseja\rcontribuir para o fortalecimento\rdo Santuário do Pacto."
--- Reservoir Anima
L["SLCurrency10Title"] = "Ânima-reserva"
L["SLCurrency10Description"] = "Uma medida da ânima\rdisponível para o seu Pacto."
--- Renown
L["SLCurrency11Title"] = "Renome"
L["SLCurrency11Description"] = "Este é o seu nível de Renome!"
--- Phantasma
L["SLCurrency12Title"] = "Fantom"
L["SLCurrency12Description"] = "Este fragmento de ânima exaurido\rpode ser usado para ganhar poder\rem Thanator. Sair de Thanator\rdestrói todo o fantom."
L["NoSLCurrency12"] = "Disponível apenas em Thanator."
--- Adventure Campaign Progress
L["SLCurrency13Title"] = "Progresso na Campanha de Aventura"
L["SLCurrency13Description"] = "Esse desafio leva a novas aventuras, com\rrecompensas maiores."
L["NoSLCurrency13"] = "Obtido através da Mesa de Comando."
--- Valor
L["SLCurrency14Title"] = "Bravura"
L["SLCurrency14Description"] = "Moeda usada para aumentar o poder\rde itens de masmorras Míticas."
L["NoSLCurrency14"] = "Obtido através de Mítica+."
L["seasonEarn"] = "Total da temporada:"
L["canExpend"] = "Pode gastar:"

------ BfA pack
--- A&H Service Medal
L["SMedalLabel"] = "M. de Serviço: "
L["SMedalATitle"] = "Medalha de Serviço da 7ª Legião"
L["SMedalHTitle"] = "Medalha de Serviço da Brigada da Honra"
L["SMedalDescription"] = "Um distintivo de mérito por ações\rtomadas nos campos de batalhas\rde Kul Tiraz, Zandalar e Fronts de\rGuerra ativos."
--- Artifact Power
L["noheart"] = "|cFFFF2e2eSem o Coração de Azeroth!"
L["AzeriteLevel"] = "Nível do Coração de Azeroth:|cFFFFFFFF "
L["AzeriteXP"] = "Poder Atual:|cFFFFFFFF "
L["AzeritetoLvL"] = "Azerita para Upar:|cFFFFFFFF "
L["AzeritetoMaximum"] = "Pode Máximo deste Nível:|cFFFFFFFF "
L["AzeriteLabel"] = "Artefato: "
L["AzeriteTitle"] = "Poder de Artefato (Azerita)"
L["AzeriteDescription"] = "Poder de Artefato aumenta o poder de\rseu Coração de Azeroth."
--- Coalescing Visions
L["CoaviLabel"] = "V. Aglutinantes: "
L["CoaviTitle"] = "Visões Aglutinantes"
L["CoaviDescription"] = "Wrathion pode manipular essas\rvisões para criar um receptáculo\rque permite a você adentrar uma\rVisão Horrenda de N'Zoth."
--- Corrupted Memento
L["CMementoLabel"] = "L. Corrompida: "
L["CMementoTitle"] = "Lembrança Corrompida"
L["CMementoDescription"] = "Fragmentos de memória das Visões\rHorrendas de N'Zoth que podem ser\ranalisados no Arquivo de Pesquisa\rTitânico na Câmara do Coração."
--- Echoes of Ny'alotha
L["ENyalothaLabel"] = "E. Ny'alotha: "
L["ENyalothTitle"] = "Ecos de Ny'alotha"
L["ENyalothDescription"] = "Essa substância carcomida pela\rcorrupção de N'Zoth pode ser usada\rpela M.A.D.R.E. para sintetizar\ressências na Câmara do Coração."
--- Jelly
L["thinJ"] = "|cff1eff00Geleia Rala|r"
L["richJ"] = "|cff0070ddGeleia Rica|r"
L["royalJ"] = "|cffa335eeGeleia Real|r"
L["JellyLabel"] = "Geleia: "
L["JellyTitle"] = "Geleia"
L["NoJelly"] = "Apenas Aliança! Necessário reputação\rcom Colmeia Meleira."
--- Prismatic Manapearl
L["PpearlLabel"] = "M. Prismática: "
L["PpearlTitle"] = "Pérola de Mana Prismática"
L["PpearlDescription"] = "Uma esfera fúlgida de energia\rarcana encontrada em Nazjatar.\rPodem ser trocadas por itens\rraros e poderosos ou usadas para\rpotencializar armaduras bênticas."
L["NoPpearl"] = "Disponível em Nazjatar."
--- War Resources
L["WResLabel"] = "Recursos: "
L["WResTitle"] = "Recursos de Guerra"
L["WResDescription"] = "Usada para recrutar tropas,\rrealizar missões e pesquisar\raprimoramentos para o seu\resforço de guerra."
--- Seafarer's Dubloon
L["DubloonLabel"] = "Dobrão: "
L["DubloonTitle"] = "Dobrão do Marinheiro"
L["DubloonDescription"] = "Moeda usada pelas diferentes\rtribos do Grande Oceano.\rUsada para obter itens com\rcomerciantes nas Expedições\rInsulares."
--- Seal of Wartorn Fate
L["WartornLabel"] = "Destino Belicoso: "
L["WartornTitle"] = "Selo do Destino Belicoso"
L["WartornDescription"] = "Distorce o destino para\rconceder uma oportunidade\rde obter tesouros adicionais\rde chefes de masmorras e\rraides de Battle for Azeroth."
--- Titan Residuum
L["TitanTitanLabel"] = "Resíduo: "
L["TitanTitanTitle"] = "Resíduo Titânico"
L["TitanTitanDescription"] = "Restos desenergizados de armadura de\rAzerita, obtidos de baús semanais de\rPedra-chave Mítica e sucateando ou\rdesencantando armaduras de Azerita."

------ Draenor pack
--- Apexis Crystal
L["ApexisLabel"] = "Cristais: "
L["ApexisTitle"] = "Cristais Apexis"
L["ApexisDescription"] = "Os cristais Apexis, o legado\rduradouro de uma civilização\rperdida, contêm reservas\rincalculáveis de poder mágico."
--- Dingy Iron Coins
L["IronCoinsLabel"] = "Moedinhas: "
L["IronCoinsTitle"] = "Moedinhas de Ferro"
L["IronCoinsDescription"] = "Talvez sejam mais valiosas do\rque aparentam na superfície."
L["NoMaxCoin"] = "Apenas Ladino, disponível em\rWarlords of Draenor."
--- Garrison Resources
L["ResourcesLabel"] = "Recursos: "
L["ResourcesTitle"] = "Recursos da Guarnição"
L["ResourcesDescription"] = "Ganhe recursos para expandir ou\rconstruir sua Guarnição."
L["NoMaxRes"] = "Disponível através da Guarnição\rem Warlords of Draenor."
--- Oil
L["OilLabel"] = "Óleo: "
L["OilTitle"] = "Latas de Óleo"
L["OilDescription"] = "Encontrado principalmente na\rSelva de Tanaan, o Óleo é usado\rem missões navais."
L["NoMaxOil"] = "Disponível através do Estaleiro em\rWarlords of Draenor."
--- Primal Spirit
L["SpiritLabel"] = "Primevo: "
L["SpiritTitle"] = "Espírito Primevo"
L["SpiritDescription"] = "Pode ser usado para criar itens\rou vendido a um comerciante\respecial da sua guarnição."
--- Seal of Inevitable Fate
L["InevitableLabel"] = "Destino Inevitável: "
L["InevitableTitle"] = "Selo do Destino Inevitável"
L["InevitableDescription"] = "Manipula o destino para aumentar\ra chance de encontrar tesouro\rextra na Cidadela Fogo do Inferno\rou Masmorras Míticas."
--- Seal of Tempered Fate
L["TemperedLabel"] = "Destino Temperado: "
L["TemperedTitle"] = "Selo do Destino Temperado"
L["TemperedDescription"] = "Distorce o destino para conceder\ruma oportunidade de conseguir\rtesouros adicionais nos raides do\rMalho Imponente ou da Fundição\rda Rocha Negra."

------ Events pack
--- Brewfest Prize Token
L["BrewLabel"] = "Fichas: "
L["BrewTitle"] = "Ficha-prêmio da CervaFest"
L["BrewDescription"] = "Usada para comprar itens\rda CervaFest em Altaforja\rou Orgrimmar."
L["NoToken"] = "Disponível através do\revento 'CervaFest'."
--- Coin of Ancestry
L["AncestryLabel"] = "Moedas: "
L["AncestryTitle"] = "Moeda dos Ancestrais"
L["AncestryDescription"] = "Um símbolo de honra e respeito\rpor uma linhagem."
L["NoAncestry"] = "Disponível através do evento\r'Festival da Lua'."
--- Darkmoon Prize Ticket
L["DarkmoonLabel"] = "Cupons: "
L["DarkmoonTitle"] = "Cupom Premiado de Negraluna"
L["DarkmoonDescription"] = "Concedidos a quem ganhar jogos ou\rrealizar favores na Feira de Negraluna."
L["NoTickets"] = "Disponível através da 'Feira de Negraluna'."
--- Love Token
L["LoveLabel"] = "Amor: "
L["LoveTitle"] = "Prova de Amor"
L["LoveDescription"] = "Pode ser trocado por mercadoria\rcom uma Mercadora Amorosa\rem qualquer capital."
L["NoLove"] = "Disponível através do evento\r'O Amor Está No Ar'."
--- Spooky Supplies
L["SpookyLabel"] = "Suprimentos: "
L["SpookyTitle"] = "Suprimentos Assustadores"
L["SpookyDescription"] = "Pode ser trocado com o\rcoordenador de eventos\rda sua guarnição."
L["HallowEnd"] = "Disponível através do\revento 'Noturnália'."
--- Tricky Treat
L["TrickyLabel"] = "Doces: "
L["TrickyTitle"] = "Gostosura Travessa"
  L["TrickyDescription"] = "Utilizada como moeda no\revento Noturnália. Costuma\rser um delicioso doce!"

------ Legion pack
--- Ancient Mana
L["ManaLabel"] = "M. Ancestral: "
L["ManaTitle"] = "Mana Ancestral"
L["ManaDescription"] = "Magia concentrada dos antigos\rmeridianos abaixo de Suramar."
L["NoMana"] = "Adquirida em Suramar."
--- Coins of Air
L["CAirLabel"] = "M. de Vento: "
L["CAirTitle"] = "Moedas de Vento"
L["CAirDescription"] = "Evapora na forma de bruma após\ralguns instantes."
L["NoCAir"] = "Apenas Ladino, disponível em\rLegion."
--- Curious Coin
L["CuriousLabel"] = "M. Curiosa: "
L["CuriousTitle"] = "Moeda Curiosa"
L["CuriousDescription"] = "Essa moeda incomum é quente\re vibra um pouco em suas mãos.\rUsada para obter itens com\rXur'ios, em Dalaran."
L["NoCurious"] = "Encontrada em saques aleatórios nas\rIlhas Partidas."
--- Drowned Mana
L["DrownedLabel"] = "Mana Afogado: "
L["DrownedTitle"] = "Mana Afogado"
L["DrownedDescription"] = "Usado para conseguir reputação\rcom Conjurador Margoss ou\rusado como moeda por itens\rvendidos pelo mesmo."
L["NoDrowned"] = "Pesque no Retiro de Margoss, próximo a Dalaran."
--- Legionfall War Supplies
L["LegionfallLabel"] = "Suprimentos de Guerra: "
L["LegionfallTitle"] = "Suprimentos de Guerra da Queda da Legião"
L["LegionfallDescription"] = "Adianta a construção de estrutura importantes na\rCosta Partida."
L["NoLegionfall"] = "Adquirido na Costa Partida."
--- Nethershard
L["NetherLabel"] = "Estiléter: "
L["NetherTitle"] = "Estiléter"
L["NetherDescription"] = "Um fragmento de éter cristalizado\rtrazido para Azeroth pela Legião."
L["NoNether"] = "Adquirido na Costa Partida e nas invasões da Legião nas Ilhas Partidas."
--- Order Resource
L["OrderLabel"] = "Rec. Ordem: "
L["OrderTitle"] = "Recursos da Ordem"
L["OrderDescription"] = "Usados para recrutar tropas,\rrealizar missões e pesquisar\raprimoramentos no seu\rSalão da Ordem."
--- Seal of Broken Fate
L["BrokenFateLabel"] = "Destino Interrompido: "
L["BrokenFateTitle"] = "Selo do Destino Interrompido"
L["BrokenFateDescription"] = "Distorce o destino para conceder\ruma oportunidade de obter tesouros\radicionais de chefes de masmorras\rMíticas e raides de Legion."
L["NoBrokenFate"] = "Pode ser comprado com o Arquimago Lan'dalock, em\rDalaran."
--- Sightless Eye
L["SightlessLabel"] = "Olho Cego: "
L["SightlessTitle"] = "Olho Cego"
L["SightlessDescription"] = "Uma moeda rústica, gravada a\rmão. Traz um símbolo similar ao\rdo Kirin Tor, com uma diferença\rfundamental: o olho está fechado."
L["NoSightless"] = "Adquirido nos Esgotos de Dalaran."
--- Timeworn Artifact
L["TimewornLabel"] = "A. Envelhecido: "
L["TimewornTitle"] = "Artefato Envelhecido"
L["TimewornDescription"] = "Um misterioso artefato naga das\rprofundezas do Grande Oceano. O rei\rMrgl-Mrgl está procurando por estes\rartefatos na Barra dos Tempos Idos."
L["NoTimeworn"] = "Disponível através de Missões\rMundiais PvP nas Ilhas Partidas."
--- Veiled Argunite
L["ArguniteLabel"] = "Argunita V.: "
L["ArguniteTitle"] = "Argunita Velada"
L["ArguniteDescription"] = "Esse cristal opaco é muito estimado\rpelos mercadores etéreos,\rprincipalmente pelo Taumaturgo\rVashreen, a bordo da Vindicaar."
L["NoArgunite"] = "Adquirida em Argus."

------ Old pack
--- Bloody Coin
L["BloodyLabel"] = "Sangrenta: "
L["BloodyTitle"] = "Moeda Sangrenta"
L["BloodyDescription"] = "Arrancada dos corpos fumegantes\rde inimigos vencidos em meio\ràs névoas da Ilha Perene."
L["NoBloody"] = "Disponível ao usar |cff0070ddIncensário da\rAgonia Eterna|r|cFFFF2e2e ou|r |cff0070ddJuramento do\rVigilante do Fogo|r |cFFFF2e2ena Ilha Perene.|r"
--- Champion's Seal
L["ChampionsLabel"] = "Selo: "
L["ChampionsTitle"] = "Selo do Campeão"
L["ChampionsDescription"] = "Concedido por atos de bravura\rno Coliseu dos Cruzados."
L["NoChampions"] = "Disponível no Coliseu dos\rCruzados, em Nortúndria."
--- Epicurean's Award
L["EpicureanLabel"] = "P. Epicurista: "
L["EpicureanTitle"] = "Prêmio do Epicurista"
L["EpicureanDescription"] = "Visite comerciantes de culinária\rem Dalaran e outras capitais\rpara comprar receitas especiais\rde culinária, condimentos e até\rmesmo um belo chapéu!"
L["NoEpicurean"] = "Disponível através de missões de culinária na antiga\rDalaran (Nortúndria) e nas cidades capitais."
--- Good Fortune, Elder Charm of
L["GFortuneLabel"] = "Boa Sorte: "
L["GFortuneTitle"] = "Antigo Amuleto de Boa Sorte"
L["GFortuneDescription"] = "Possuir o Antigo Amuleto de Boa\rSorte permite que o proprietário\rsortudo arrisque uma moeda para\rreceber uma recompensa-bônus\rem Galerias Mogu'shan, Coração\rdo Medo, Terraço da Primavera\rEterna, Sha da Raiva ou Bando\rGuerreiro de Salyis."
--- Ironpaw Token
L["IronpawLabel"] = "P. de Ferro: "
L["IronpawTitle"] = "Ficha da Pata de Ferro"
L["IronpawDescription"] = "Representa seu crédito com a família\rde cozinheiros Pata de Ferro. Pode\rser trocado por ingredientes de\rCulinária e outras coisas no Estoque\rdo Mercado de Meia Colina."
L["NoIronpaw"] = "Disponível através de missões de culinária em Pandaria."
--- Mark of the World Tree
L["WorldTreeLabel"] = "Marcas: "
L["WorldTreeTitle"] = "Marca da Árvore do Mundo"
L["WorldTreeDescription"] = "Concedida pelos Guardiões\rde Hyjal. Pode ser usada para\rcomprar reforços para a\rInvasão das Terras do Fogo."
L["NoWorldTree"] = "Disponível através de\rmissões diárias no Monte\rHyjal."
--- Mogu Rune of Fate
L["MRuneLabel"] = "Runa Mogu: "
L["MRuneTitle"] = "Runa Mogu do Destino"
L["MRuneDescription"] = "Possuir a Runa Mogu do Destino\rpermite que o proprietário sortudo\rarrisque uma moeda para receber\ruma recompensa bônus de Trono\rdo Trovão, Nalak ou Oondasta."
--- Timeless Coin
L["TimelessLabel"] = "Perene: "
L["TimelessTitle"] = "Moeda Perene"
L["TimelessDescription"] = "Você sente os dedos sombrios de\rantigos e futuros donos da moeda\rmexer na sua mão, como se o\rpróprio tempo fosse um borrão.\rGaste-a na Ilha Perene para receber\rrecompensas fluidas e\rpoderosas."
L["NoTimeless"] = "Disponível através da Ilha Perene."
--- Warforged Seal
L["WarforgedLabel"] = "Selo Forjado: "
L["WarforgedTitle"] = "Selo Forjado para a Guerra"
L["WarforgedDescription"] = "Possuir o Selo Forjado para a Guerra\rpermite que o proprietário sortudo\rarrisque um selo para receber uma\rrecompensa bônus pelo Cerco a\rOrgrimmar, pelas Provações\rCelestiais e por Ordos."
--- Lesser Charm of Good Fortune
L["LegacyC01Title"] = "Amuleto Menor de Boa Sorte"
L["LegacyC01Description"] = "Possuir o Amuleto Menor de Boa\rSorte resulta em grande\rfelicidade e na conversão do item\rem Selos Forjados para a Guerra,\rque permite que os jogadores\rarrisquem uma moeda para\rreceber uma recompensa extra\rpor encontros em raide."

------ Others pack
--- Brawler's Gold
L["BrawlerLabel"] = "O. Brigões: "
L["BrawlerTitle"] = "Ouro dos Brigões"
L["BrawlerDescription"] = "Dado aos vencedores da Guilda dos\rBrigões. Use-o para comprar\rCartões de Briga e outros itens\rque alteram o mundo no\rCâmbio de Ouro dos Brigões."
L["NoBrawler"] = "Disponível através de lutas na\rGuilda dos Brigões."
--- Gold
L["GoldTitle"] = "Ouro"
L["GoldPlayerTip"] = "|cFFB4EEB4Dica:|r |cFFFFFFFFClique para abrir a janela de\rmoedas de ${player}|cFFFFFFFF.|r"
L["GoldTotal"] = "Total:"
L["HigherOnly"] = "Exibir Apenas Maior Valor"
--- Shiny Pet Charm
L["PetLabel"] = "Patuá Brilhante: "
L["PetTitle"] = "Patuá de Mascote Brilhante"
L["PetDescription"] = "Aceito nos mestres das mascotes\rde batalha."
L["NoMaxPet"] = "Disponível através de batalhas de mascote\rem Warlords of Draenor e Legion."
--- Polished Pet Charm
L["PoliLabel"] = "Patuá Polido: "
L["PoliTitle"] = "Patuá de Mascote Polido"

------ PvE pack
--- Timewarped Badge
L["TimewarpedLabel"] = "Insígnia : "
L["TimewarpedTitle"] = "Insígnia Transtemporal"
L["TimewarpedDescription"] = "Obtidos em masmorras de\rCaminhada Temporal. Trocado por\rmercadorias de Comerciantes da\rCaminhada Temporal nas capitais."
L["NoBadge"] = "Entre em uma fila de masmorras\rquando o evento de Caminhada\rTemporal estiver ocorrendo."

------ PvP pack
--- Mark of Honor
L["MarkLabel"] = "M. Honra: "
L["MarkTitle"] = "Marca de Honra"
L["MarkDescription"] = "Moeda usada por comerciantes\rno mercado dos gladiadores."
L["NoMark"] = "Disponível através de PvP."
--- Tol Barad Commendation
L["TBLabel"] = "Comenda: "
L["TBTitle"] = "Comenda de Tol Barad"
L["TBDescription"] = "Concedida por atos de bravura\rem Tol Barad."
L["NoTB"] = "Disponível através de missões\rdiárias em Tol Barad."
--- Honor
L["PvPCurrency01Title"] = "Honra"
L["PvPCurrency01Description"] = "Serve para comprar equipamento\rde JxJ não ranqueado\rem Ventobravo e Orgrimmar."
--- Conquest
L["PvPCurrency02Title"] = "Dominação"
L["PvPCurrency02Description"] = "Ganha em atividades JxJ Ranqueadas."

------ Eventual pack (estará disponível apenas algumas vezes)
--- Lovely Charm
L["LovelyLabel"] = "Patuá A.: "
L["LovelyTitle"] = "Patuá Adorável"
L["LovelyDescription"] = "Use 10 para confeccionar uma Pulseira de Patuás Adoráveis.\r[Encontrado apenas no evento 'O amor está no ar'.]"

--- Shared
L["totalbag"] = "Total na Bolsa: "
L["totalbank"] = "Total no Banco: "
L["full"] = "Lotado!"
L["maximum"] = "Máx"
L["DraenorOnly"] = "Disponível em Draenor."
L["LegionOnly"] = "Disponível nas Ilhas Partidas."
L["PandariaOnly"] = "Disponível em Pandária."
L["BfAOnly"] = "Disponível em Battle for Azeroth."
L["VisionsOnly"] = "Disponível no conteúdo de Visões de N'Zoth."
L["SLOnly"] = "Disponível em Shadowlands."
L["session"] = "Saldo da sessão: "
L["showbb"] = "Exibir Saldo da Sessão na Barra"
L["mCata"] = "[|cFF198ae0Cata|r]"
L["mEvent"] = "[|cFF198ae0Evento|r]"
L["mLegion"] = "[|cFF198ae0Legion|r]"
L["mMoP"] = "[|cFF198ae0MoP|r]"
L["mPvP"] = "[|cFF198ae0PvP|r]"
L["mPvE"] = "[|cFF198ae0PvE|r]"
L["mWoD"] = "[|cFF198ae0WoD|r]"
L["mWotLK"] = "[|cFF198ae0WotLK|r]"
L["mOther"] = "[|cFF198ae0Outros|r]"
L["mBfA"] = "[|cFF198ae0BfA|r]"
L["info"] = "|cFFFFFFFF[Informações]|r"
L["totalAcquired"] = "Total adquirido: "
L["maxpermitted"] = "Máximo permitido: "
L["canGet"] = "Ainda pode pegar: "
L["maxBar"] = "Exibir Valor Máximo na Barra"
L["simpleText"] = "Exibir Texto Simples"
L["showAltText"] = "Mostrar Alts"
L["TotalAlt"] = "Total da Moeda:"
L["AltChars"] = "|cFFFFFFFF[Todos Personagens]|r"
L["buttonText"] = "Texto da Barra"
L["tooltip"] = "Texto de Ajuda"

--- Menus
L["bfa"] = "Moeda [BfA]"
L["legacy"] = "Moeda [Legado]"
L["misc"] = "Moeda [Outros]"
L["shadowl"] = "Moeda [Shadowlands]"
end
