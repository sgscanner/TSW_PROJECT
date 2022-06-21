DROP DATABASE IF EXISTS gameshop;
CREATE DATABASE gameshop;
USE gameshop;


DROP USER IF EXISTS 'gameshop'@'localhost';
CREATE USER 'gameshop'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES on gameshop.* to 'gameshop'@'localhost';
DROP TABLE IF EXISTS Catalogo;
CREATE TABLE Catalogo (
	codice_catalogo int(15) not null primary key
);

DROP TABLE IF EXISTS Utente;
CREATE TABLE Utente (
	id_utente varchar(25) not null ,
  	email varchar(30) not null ,
  	password varchar(100) not null,
  	ruolo varchar(30 ) not null,
	
    primary key (id_utente) 
);

DROP TABLE IF EXISTS Città;
CREATE TABLE Città (
	id_città varchar(30) not null primary key,
	nome_città varchar(25) not null,
	cap varchar(25) not null
);

 CREATE TABLE Dati_anagrafici (
	id_utente varchar(25) NOT NULL,
	cap varchar(30) NOT NULL,
	nome varchar(25) NOT NULL,
	cognome varchar(25) NOT NULL,
	telefono varchar(15) DEFAULT NULL,
	data_nascita date NOT NULL,
	città varchar(30) not null,
	
	FOREIGN KEY (id_utente) REFERENCES Utente (id_utente)
); 

DROP TABLE IF EXISTS Rubrica_indirizzi;
CREATE TABLE Rubrica_indirizzi (
	id_indirizzo smallint not null,
	id_utente varchar(25) not null,
	id_citta varchar(30) not null,
	indirizzo varchar(50) not null,
	foreign key(id_utente) references Utente (id_utente),
	primary key (id_indirizzo)
);

DROP TABLE IF EXISTS Ordine;
CREATE TABLE Ordine (
	numero_ordine varchar(30) not null primary key,
	id_utente varchar(25) not null,
	importo_totale decimal(20,2) not null,
	data_ordine date not null,
	
	foreign key (id_utente) REFERENCES Utente (id_utente)
);

DROP TABLE IF EXISTS Fornitore;
CREATE TABLE Fornitore (
	partita_iva varchar(11) not  null primary key,
	nome		varchar(250) not null,
	indirizzo	varchar(250) not null
);

DROP TABLE IF EXISTS Articolo;
CREATE TABLE Articolo (
	codice_articoli varchar (30) not null ,
	codice_catalogo int (10) not null,
	descrizione varchar(250) not null,
	prezzo 		decimal(15,2) not null,
	nome 		varchar(250) not null,
	tipologia_articoli 	varchar(250) not null,
	offerta boolean not null,
	quantita int not null,
	
    primary key(codice_articoli),
	foreign key(codice_catalogo) REFERENCES Catalogo (codice_catalogo)
);

DROP TABLE IF EXISTS Compongono;
CREATE TABLE Compongono (
	codice_articoli varchar (30) not null,
	numero_ordine VARCHAR (30) not null,
	quantità varchar(30) not null,
	prezzo_storico decimal(15,2) not null,
	
	foreign key(codice_articoli) references Articolo(codice_articoli),
	foreign key(numero_ordine) REFERENCES Ordine(numero_ordine)
);

DROP TABLE IF EXISTS Sono_forniti_da;
CREATE TABLE Sono_forniti_da	(
	codice_articoli varchar(30) not null,
	partita_iva	varchar(11) not null,
	
    foreign key(codice_articoli) references Articolo(codice_articoli),
	foreign key(partita_iva) REFERENCES Fornitore(partita_iva)
);

DROP TABLE IF EXISTS Standard;
CREATE TABLE Standard(
	id_spedizione int (10) not null primary key auto_increment,
	numero_ordine varchar (30) not null,
	data_spedizione date,
	costo	decimal(10,2) not null,
	foreign key(numero_ordine) REFERENCES Ordine(numero_ordine)
);

DROP TABLE IF EXISTS Veloce;
CREATE TABLE Veloce (
	id_spedizione int (10) not null primary key,
	numero_ordine varchar (30) not null,
	data_spedizione date,
	costo decimal(10,2) not null,
	foreign key (numero_ordine) REFERENCES Ordine(numero_ordine)
);

DROP TABLE IF EXISTS Pagamento;
CREATE TABLE Pagamento (
	id_pagamento int(15) not null primary key,
	numero_ordine varchar (30) not null,
	importo_pagamento decimal (15,2) not null,
	foreign key(numero_ordine) REFERENCES Ordine (numero_ordine)
);

DROP TABLE IF EXISTS Carta;
CREATE TABLE Carta(
	numero_di_carta varchar(25) not null,
	id_pagamento int(10) not null,
	dati_intestatario varchar(25) not null,
	foreign key(id_pagamento) REFERENCES Pagamento(id_pagamento)
);

DROP TABLE IF EXISTS Contanti;
CREATE TABLE Contanti(
	id_pagamento int (10) not null,
	foreign key(id_pagamento) REFERENCES Pagamento(id_pagamento)
);

DROP TABLE IF EXISTS Bonifico;
CREATE TABLE Bonifico (
	iban varchar (27) not null ,
	id_pagamento int(10) not null,
	causale varchar(144) not null,
	dati_intestatario varchar(50) not null,
	foreign key(id_pagamento) REFERENCES Pagamento(id_pagamento)
);

DROP TABLE IF EXISTS Fattura;
CREATE TABLE Fattura (
	id_fattura int(15) not null primary key,
	id_pagamento int (10) not null,
	data	date,
	foreign key(id_pagamento) REFERENCES Pagamento(id_pagamento)
);

DROP TABLE IF EXISTS Recensione;
CREATE TABLE Recensione(
	numeroStelle int not null,
	id_utente varchar(250) not null,
	codice_articoli varchar(250) not null,
    titolo varchar(100) not null,
    descrizione varchar(250) not null,
	
    foreign key(codice_articoli) references Articolo(codice_articoli),
	foreign  key(id_utente) references Utente(id_utente)
);

insert into Fornitore values('01833690157','Sony','Via cantalupo in sabina 29');
insert into Fornitore values('08106710158','Microsoft','Viale Pasubio 21');
insert into Fornitore values('03359860966','Nintendo','Via Torri Bianche, 6');

insert into Catalogo values('1');
insert into Catalogo values('2');

#Giochi Ps1

insert into Articolo values('1','1','Boxing è un gioco per PlayStation di genere picchiaduro, sportivo sviluppato da A1 Games e.','10.00','Boxing Ps1','gioco',true,'15');
insert into Articolo values('2','1','Fifa 2004 è un videogioco di calcio prodotto da Electronic Arts. Il gioco è l undicesimo capitolo della popolare serie Fifa ed è uscito nel 2003 per Ps1','15.00','Fifa 2004 Ps1','gioco',false,'5');
insert into Articolo values('3','1','Madden NFL 2005 è un videogioco sportivo sviluppato e pubblicato dall Electronic Arts nel 2004 per Ps1. Il gioco fa parte della serie Madden NFL. Per la prima volta nel franchise e nel mondo dei videogiochi è possibile controllare un intero reparto.','15.00','Madden NFL 2005 Ps1','gioco',false,'10');
insert into Articolo values('4','1','Metal Slug X è un videogioco sparatutto "corri e spara" per Ps1. È uscito nel 1999 per PS1 come una versione aggiornata e mixata di Metal Slug 2 che utilizza il motore grafico di Metal Slug 3. È lo pseudo terzo capitolo della serie di Metal Slug.','5.00','Meta Slug X Ps1','gioco',false,'5');
insert into Articolo values('5','1','Il passatempo nazionale torna a casa su PlayStation con MLB 2004 di 989 Sports. Pubblicato nel 2003 per Ps1 il gioco è basato sulla simulazione del baseball.','15.00','MLB 2004 Ps1','gioco',true,'10');
insert into Articolo values('6','1','NASCAR Thunder 2004 è un simulatore di corse di EA Sports, pubblicato nel 2003 per Ps1. Presenta il campione del 2002 Tony Stewart in copertina con uno sguardo accigliato per rappresentare la nuova funzione Grudges and Alliances.','15.00','Nascar Thunder 2004 Ps1','gioco',true,'5');
insert into Articolo values('7','1','NBA Shootout 2004 ti consente di giocare un intera stagione o partite di esibizione di basket NBA con licenza completa con le tue squadre e giocatori preferiti.','20.00','NBA Shootout 2004 Ps1','gioco',false,'15');
insert into Articolo values('8','1','Tutto comincia con la nostra amica, la Pantera Rosa per l appunto, che riceve un fantomatico testamento da uno zio che le lascia in eredità un incommensurabile tesoro. L unico problema è che questo è nascosto nella soffitta della sua casa.','5.00','Pink Panther Ps1','gioco',false,'5');
insert into Articolo values('9','1','Tom Clancy s Rainbow Six: Lone Wolf è un videogioco sparatutto in prima persona tattico sviluppato dalla Red Storm Entertainment e pubblicato dalla Ubisoft, il gioco fa parte della serie Rainbow Six.','15.00','Rainbow Six Lone Wolf Ps1','gioco',true,'10');

#Giochi Ps2

insert into Articolo values('10','1','Con "Area 51" potrai essere il primo videogiocatore ad entrare nella riservatissima e inviolabile sede militare statunitense chiamata Area 51.Improvvisamente le comunicazioni dall’interno dell’area si interrompono e tu dovrai scoprire cosa succede.','20.00','Area 51 Ps2','gioco',false,'10');
insert into Articolo values('11','1','Burnout 3: Takedown è il terzo gioco della serie di videogiochi Burnout. Rilasciato il 7 settembre 2004, sviluppato da Criterion Games e pubblicato da Electronic Arts (primo gioco Burnout pubblicato da EA).','15.00','Burnout 3 Takedown Ps2','gioco',false,'10');
insert into Articolo values('12','1','Crime Life: Gang Wars è un ruvido gioco di azione in terza persona che permette al giocatore di scorrazzare liberamente in un ambiente urbano corrotto e insidioso. Laction game di Konami presenta una storia epica e appassionante.','10.00','Crime Life Gang Wars Ps2','gioco',false,'5');
insert into Articolo values('13','1','Destroy All Humans! è un videogioco sviluppato da Pandemic Studios e prodotto da THQ nel 2005 per PlayStation 2.In questo titolo, il giocatore deve vestire i panni del diabolico alieno Cryptosporidium.','20.00','Destroy all humans Ps2','gioco',false,'10');
insert into Articolo values('14','1','Dragon Ball Z Budokai 3 è un videogioco picchiaduro a incontri basato sulla serie Dragon Ball, pubblicato da Bandai e Atari per PlayStation 2 nel 2004','25.00','Dragon Ball Z Budokai 3 Ps2','gioco',true,'15');
insert into Articolo values('15','1','Medal of Honor: Rising Sun è il quinto titolo della serie di videogiochi Medal of Honor, pubblicato da Electronic Arts nel novembre 2003, ed il primo della serie dove si combatte contro l Impero giapponese anziché il Terzo Reich.','10.00','Medal of Honor - Rising Sun Ps2','gioco',false,'5');
insert into Articolo values('16','1','MotoGP 4 è un videogioco per PlayStation 2, sviluppato e pubblicato dalla Namco. Il gioco è basato sulla stagione 2004 del motomondiale. Sono presenti tutti e 16 i circuiti. Il gioco è composto da 125 Sfide.','20.00','MotoGP 4 Ps2','gioco',true,'15');
insert into Articolo values('17','1','Sonic Gems Collection è un videogioco compilation sviluppato da Sonic Team e pubblicato da SEGA per le console GameCube e PlayStation 2 nel 2005. ','10.00','Sonic Gems Collection Ps2','gioco',false,'5');
insert into Articolo values('18','1','TOCA Race Driver 2 è un videogioco di guida, quinto titolo della serie TOCA, sviluppato e pubblicato da Codemasters nel 2004 per PlayStation 2.','10.00','Toca Race Driver 2 Ps2','gioco',false,'20');
insert into Articolo values('19','1','True Crime: New York City è un videogioco d azione 3D sviluppato da Luxoflux e pubblicato da Activision nel 2005 per Playstation 2.Secondo capitolo della serie True Crime, è il seguito di True Crime: Streets of LA','15.00','True Crime New York City Ps2','gioco',false,'10');

#Giochi Ps3

insert into Articolo values('20','1','Entra la psiche danneggiata d Bruce Wayne e scopri le forti e gravi conseguenze delle tue scelte da Dark Knight. In una nuova cruda e violenta storia,farai scoperte e distruggerai il mondo di Bruce Wayne.','25.00','Batman the Teltate series Ps3','gioco',true,'5');
insert into Articolo values('21','1','Vivi l’immaginario di polizia e criminali in Battlefield™ Hardline. Una storia ricca di emozioni e un ambientazione che ricorda le moderne serie televisive crime.','20.00','Battlefield Hardline Ps3','gioco',false,'10');
insert into Articolo values('22','1','Sviluppato da from software, Dark Souls II è l’attesissimo seguito dell’implacabile successo del 2011.L’action-rpg originale ha attirato l’immaginazione dei giocatori di tutto il mondo con una sfida incredibile.','25.00','Dark Souls 2 Scholar of the first sin Ps3','gioco',false,'5');
insert into Articolo values('23','1','Le più dure battaglie di Goku e dei GUERRIERI stanno tornando! Per la prima volta in assolto, l universo di DRAGON BALL sarà ricreato sulle console di nuova generazione e beneficerà delle caratteristiche delle più potenti console mai create.','30.00','Dragon Ball Xenoverse Ps3','gioco',true,'15');
insert into Articolo values('24','1','Sei pronto per la più grande stagione di sempre? Grazie al motore Frostbite™, FIFA 18 attenua il confine tra il mondo reale e quello virtuale dando vita a eroi, squadre e atmosfere del gioco più bello del mondo.','15.00','Fifa 18 Ps3','gioco',false,'5');
insert into Articolo values('25','1','Cinque anni fa Carl Johnson è fuggito dalla vita stressante di Los Santos, una città straziata da bande, droga e corruzione dove stelle del cinema e milionari facevano del loro meglio per evitare spacciatori e membri delle gang.','20.00','GTA San Andreas Ps3','gioco',false,'15');
insert into Articolo values('26','1','Il celebre sviluppatore Kojima Productions conclude la "METAL GEAR SOLID V Experience" con il suo ultimo capitolo, METAL GEAR SOLID V: The Phantom Pain','30.00','Metal Gear Solid V The Phantom Pain Ps3','gioco',true,'10');
insert into Articolo values('27','1','One Piece: Pirate Warriors 3, è un videogioco per PlayStation 3,sviluppato dall Omega Force e pubblicato da Namco Bandai Games.','20.00','One Piece Pirate Warriors 3 Ps3','gioco',false,'10');
insert into Articolo values('28','1','Se il mondo che conoscevi venisse spazzato via, se il confine tra giusto e sbagliato tendesse a confondersi e se le scelte che determinano la vita o la morte si susseguissero ogni giorno, fino a che punto ti spingeresti per sopravvivere?','25.00','The Last of Us Ps3','gioco',false,'5');
insert into Articolo values('29','1','WRC 5: la migliore simulazione di rally.Ritrova le auto, i piloti e i rally ufficiali di FIA World Rally Championship 2015 nel gioco di simulazione di rally di riferimento','25.00','WRC 5 Ps3','gioco',true,'5');

#Giochi Ps4

insert into Articolo values('30','1','Battlefield™ 2042 è uno sparatutto in prima persona che segna il ritorno dell iconica guerra totale della serie. In un futuro prossimo in cui il mondo è stato trasformato dal caos, adattati per vincere in campi di battaglia dinamici.','40.00','Battlefiel 2042 Ps4','gioco',false,'10');
insert into Articolo values('31','1','Preparati a dare il meglio di te nel nuovo capitolo della pluripremiata serie COD. In Call of Duty Vanguard per PlayStation 4 ti servirà tanto coraggio per cambiare la storia.','50.00','Call of Duty Vanguard Ps4','gioco',true,'5');
insert into Articolo values('32','1','Ti diamo il benvenuto a Yara, un paradiso tropicale congelato nel tempo. Antón Castillo, dittatore di Yara, vuole riportare la sua nazione alla gloria di un tempo. Per farlo è pronto a tutto, insieme al figlio Diego.','45.00','Far Cry 6 Ps4','gioco',false,'10');
insert into Articolo values('33','1','Non vedi l’ora di provare la migliore esperienza di calcio? Con FIFA 22 per PlayStation 4, realizzare i tuoi sogni di gloria è ancora più entusiasmante. Prendi per mano la tua squadra del cuore e portala sul tetto del mondo!','30.00','Fifa 22 Ps4','gioco',true,'15');
insert into Articolo values('34','1','Piloti competitivi, collezionisti, amanti della messa a punto, progettisti di livree, fotografi e appassionati di corse arcade: le funzionalità ispirate dal passato, presente e futuro di Gran Turismo.','50.00',"Gran Turimso 7 Ps4",'gioco',true,'10');
insert into Articolo values('35','1',' In Horizon: Forbidden West per PlayStation 4 ti muoverai in una frontiera maestosa e pericolosa, che nasconde nuove e misteriose minacce, con l’obiettivo di salvare quel che resta dell’umanità.','70.00','Horizon Forbidden West Ps4','gioco',false,'15');
insert into Articolo values('36','1','NBA 2K22 hai l’intero universo del basket nelle tue mani. GIOCA ORA nell’ambiente realistico delle leghe NBA e WNBA e sfida le squadre e i giocatori originali.','45.00','Nba 2K22 Ps4','gioco',false,'10');
insert into Articolo values('37','1','Tom Clancy s Rainbow Six® Extraction è uno sparatutto tattico cooperativo in prima persona per uno-tre giocatori. Forma la tua squadra d élite di operatori Rainbow Six.','30.00','Rainbow Six Extraction Ps4','gioco',false,'10');
insert into Articolo values('38','1','Nell ultima avventura dell universo di Marvel s Spider-Man, l adolescente Miles Morales affronta il trasloco nella sua nuova casa mentre segue le orme del suo mentore, Peter Parker, per diventare il nuovo Spider-Man.','30.00','Spider Man Miles Morales Ps4','gioco',false,'10');
insert into Articolo values('39','1','Marvel s Spider-Man contiene tutte le acrobazie, le improvvisazioni e le ragnatele che hanno reso celebre l arrampicamuri, uno dei supereroi più famosi al mondo,','20.00','Spider-Man Ps4','gioco',false,'10');

#Giochi Ps5

insert into Articolo (codice_articoli, codice_catalogo, descrizione, prezzo, nome, tipologia_articoli, offerta, quantita) values 
	('40','1','Call of Duty®: Modern Warfare® II è il seguito del popolare Modern Warfare® del 2019.i giocatori potranno scoprire cosa ha reso la Task Force 141 la squadra leggendaria che è oggi.','60.00','Call of Duty Modern Warfare II Ps5','gioco',false,'0'),
    ('41','1','Batman è morto e i criminali hanno invaso le strade di Gotham City. Proteggere la città, dare speranza ai suoi cittadini, mettere in riga le forze dell’ordine e incutere timore nei criminali è ora compito della Bat-famiglia.','60.00','Gotham Knights Ps5','gioco',false,'0'),
    ('42','1','HITMAN 3 è la drammatica conclusione della trilogia del mondo degli assassini e porta i giocatori in giro per il mondo in un’avventura attraverso vaste locations sandbox.','25.00','Hitman 3 Ps5','gioco',false,'10'),
    ('43','1','Riunisci la squadra degli eroi piú potenti della Terra, scatena i tuoi poteri e vivi il tuo sogno di supereroe.','25.00','Marvel Avengers Ps5','gioco',false,'10'),
    ('44','1','Metro Exodus è uno sparatutto narrativo in prima persona firmato 4A Games. Il gioco combina combattimenti letali e furtività con esplorazione e survival horror in uno dei mondi più immersivi mai creati.','30.00','Metro Exodus Ps5','gioco',false,'10'),
    ('45','1','La celeberrima saga di Mortal Kombat è tornata con un nuovo capitolo ed è più entusiasmante che mai. Le innovative varianti di personalizzazione dei personaggi ti forniscono un inedita libertà d azione.','15.00','Mortal Kombat 11 Ultimate Ps5','gioco',false,'10'),
    ('46','1','Scopri i roster e i circuiti ufficiali e vivi le emozioni della stagione 2021. E se vuoi fare un tuffo nel passato, puoi rivivere la storia della MotoGP™ con più di 40 piloti e le loro moto iconiche!','20.00','MotoGP 21 Ps5','gioco',false,'10'),
    ('47','1','Mettiti alla prova con Returnal per PlayStation 5 e aiuta Selena a sopravvivere in un pianeta alieno in continua trasformazione. Per sconfiggere le possenti creature che troverai sul cammino.','50.00','Returnal Ps5','gioco',true,'10'),
    ('48','1','È il momento di riprendersi Londra e chiunque tu veda in questa iconica città può essere reclutato nella tua resistenza.','35.00','Watch Dogs Legion Ps5','gioco',false,'10'),
    ('49','1','Per celebrare i 50 anni del campionato, WRC 10 offre una nuovissima edizione Anniversario traboccante di contenuti ed emozioni. Raccogli la sfida dei momenti più intensi dal 1973 a oggi!','35.00','WRC 10 Ps5','gioco',false,'10');

#Giochi PsVita

insert into Articolo (codice_articoli, codice_catalogo, descrizione, prezzo, nome, tipologia_articoli, offerta, quantita) values
	('50','1','Angry Birds Star Wars è l ennesimo episodio della serie Rovio che per l occasione si ispira alla saga di Star Wars.','20.00','Angry Birds Star Wars PsVita','gioco',false,'10'),
    ('51','1','Ambientato prima della rivolta dei più pericolosi criminali di Gotham City, il gioco presenta un giovane e rozzo Batman che affronta un momento chiave nei primi passi della sua carriera.','15.00','Batman Arkham Origins Blackgate PsVita','gioco',false,'10'),
    ('52','1','Nei panni di un intraprendente eroina di nome Kat, si verrà proiettati tra i grattacieli e le nuvole di una misteriosa città.','10.00','Gravity Rush PsVita','gioco',false,'10'),
    ('53','1','Dating simulator con protagonisti dei piccioni.','15.00','Hatoful Boyfriend PsVita','gioco',true,'10'),
    ('54','1','Una spirale psichedelica di violenza e dolore. Di teste spaccate contro il muro da un calcio preciso, di bpm che salgono, di colori acidi e suoni acidissimi e fucilate al petto, di gente che rantola. Gole tagliate, pixel, maschere, audiocassette.','20.00','Hotline Miami PsVita','gioco',false,'10'),
    ('55','1','Sei pronto a salvare il Mondo del fai da te dalla sua più grande minaccia? Ho sentito gridare un bel "sì", molto bene! E allora imbarcati nella sfida più impegnativa e sensorialmente stimolante di Sackboy.','30.00','LittleBigPlanet PsVita','gioco',false,'10'),
    ('56','1','MotorStorm RC rappresenta una variazione sul tema per la serie sviluppata da Evolution Studios, una sorta di simpatico spin-off in cui i motori protagonisti sono quelli di automobiline radiocomandate','15.00','Motorsport RC PsVita','gioco',false,'10'),
    ('57','1','Lo strepitoso platform di Ubisoft approda anche su PlayStation Vita: scopriamo se è la versione migliore','25.00','Rayman Legends PsVita','gioco',true,'10'),
    ('58','1','Polli e pinguini. Armi e jetpack. E una discreta dose di piattaforme. Non serve molto altro per descrivere in breve quello che ha da offrire Rocketbirds: Hardboiled Chicken, vulcanico platform a scorrimento con elementi shooter','20.00','Rocketbirds Hardboiled Chicken PsVita','gioco',false,'10'),
    ('59','1','Stick It To The Man è il nuovo platform adventure per PlayStation Vita sviluppato da Zoink! e prodotto da Ripstone.','15.00','Stick it to the man PsVita','gioco',false,'10');

#Giochi digitali

insert into Articolo (codice_articoli, codice_catalogo, descrizione, prezzo, nome, tipologia_articoli, offerta, quantita) values
	('60','1','Immergiti in una visione inquieta della Detroit del futuro, dove umani e androidi conducono una fragile convivenza e le tue decisioni costruiscono la storia che ti circonda.','30.00','Detroit Become Human DG Ps4','gioco',true,'10'),
    ('61','1','Entra nella nuova era della Formula 1® in EA SPORTS™ F1® 22, il videogioco ufficiale del FIA Formula One World Championship™ 2022.','60.00','F1 22 DG Xbox One','gioco',false,'0'),
    ('62','1','Entra nella storia della Formula 1 con il gioco su licenza ufficiale F1 Manager 2022. Diventa il team principale della tua squadra preferita, poi scegli i piloti e il personale per la stagione 2022.','60.00','F1 22 Manager DG Ps5','gioco',false,'0'),
    ('63','1','Impersona un vero allenatore nel mondo del calcio. Il destino del tuo club dipende da te.','40.00','Football Manager 22 DG Ps4','gioco',false,'10'),
    ('64','1','A seguito di un enorme cataclisma, tre delle più feroci fazioni di guerrieri mai esistite nella storia si scontrano in un epica battaglia per la sopravvivenza.','50.00','For Honor DG Ps4','gioco',true,'10'),
    ('65','1','GREEN HELL è un gioco di sopravvivenza in un mondo aperto ambientato nella foresta pluviale amazzonica','25.00','Green Hell DG Xbox One','gioco',false,'10'),
    ('66','1','PAYDAY è uno sparatutto co-op per 4 giocatori, pieno d azione, in cui rapini banche e ottieni guadagni.','20.00','Payday 2 DG Ps4','gioco',false,'10'),
    ('67','1','The Sims 4 è un videogioco di simulazione di vita della serie The Sims, sviluppato da Maxis e pubblicato da Electronic Arts.','15.00','Sims 4 DG Xbox One','gioco',false,'10'),
    ('68','1','Stray è un action adventure in terza persona in cui vestiremo i panni di un gatto e ambientato tra le strade al neon di una cybercittà decadente.','40.00','Stray DG Ps5','gioco',false,'0'),
    ('69','1','Uncharted: Legacy of Thieves Collection è la versione rimasterizzata e aggiornata per PS5 di Uncharted 4 e del suo DLC The Lost Legacy.','30.00','Uncharted Legacy of Thieves DG Ps5','gioco',true,'10');

#Giochi Xbox 360

insert into Articolo (codice_articoli, codice_catalogo, descrizione, prezzo, nome, tipologia_articoli, offerta, quantita) values
	('70','1','Assassin s Creed: Rogue è un videogioco sviluppato da Ubisoft Sofia e pubblicato da Ubisoft. Settimo capitolo principale della serie di Assassin s Creed e sequel di Assassin s Creed IV: Black Flag','20.00','Assasin s Creed Rogue Xbox 360','gioco',false,'10'),
    ('71','1','La trama segue gli eventi di Call of Duty: Black Ops II nel 2065, 40 anni dopo, in un mondo di fronte a sconvolgimenti a causa dei conflitti, cambiamenti climatici e nuove tecnologie.','30.00','Call of Duty Black Ops 3 Xbox 360','gioco',false,'10'),
    ('72','1','Destiny è un videogioco sviluppato da Bungie ed ambientato in un mondo, a detta degli sviluppatori, connesso e condiviso,il quale fa del gioco uno sparatutto in prima persona fantascientifico','15.00','Destiny Xbox 360','gioco',true,'10'),
    ('73','1','Con una grafica e un motore fisico nuovi di zecca, Farming Simulator 15 offre un immenso mondo ricco di dettagli ed effetti visivi, in grado di trasportare il franchise Farming Simulator in una nuova era','20.00','Farming Simulator 2015 Xbox 360','gioco',false,'10'),
    ('74','1','FIFA 19 ti permette di giocare ai più importanti tornei per club, grazie a una serie di modalità su licenza che comprendono la UEFA Champions League, la UEFA Europa League e la UEFA Super Cup','15.00','Fifa 19 Xbox 360','gioco',true,'10'),
    ('75','1','MotoGP 15 è un videogioco sviluppato da Milestone, basato sul Motomondiale 2015 di MotoGP.','20.00','MotoGP 15 Xbox 360','gioco',false,'10'),
    ('76','1','Rambo: The Videogame è uno sparatutto in prima persona basato sui personaggi e le storie dei primi tre film della saga di Rambo. ','30.00','Rambo The videogame Xbox 360','gioco',true,'10'),
    ('77','1','Rise of the Tomb Raider è un videogioco avventura dinamica del 2015 sviluppato dalla Crystal Dynamics, seguito di Tomb Raider del 2013.','30.00','Rise of the Tomb Raider Xbox 360','gioco',true,'10'),
    ('78','1','The Amazing Spider-Man 2 è il tie-in dell omonimo film prodotto da Sony con protagonista Spider-Man.','25.00','The Amazing Spider-Man 2 Xbox 360','gioco',true,'10'),
    ('79','1','The Crew è un rivoluzionario gioco di azione e guida sviluppato in esclusiva per console di nuova generazione. Con i tuoi amici, parteciperai a una folle corsa in un enorme ricreazione degli Stati Uniti liberamente esplorabile.','15.00','The Crew Xbox 360','gioco',false,'10');

#Giochi Xbox One

insert into Articolo (codice_articoli, codice_catalogo, descrizione, prezzo, nome, tipologia_articoli, offerta, quantita) values
	('80','1','Batman: Arkham Collection è la versione definitiva della trilogia Arkham di Rocksteady ed è una collezione completa che include tutti i contenuti rilasciati dopo l uscita del gioco.','25.00','Batman Arkham Collection Xbox One','gioco',true,'10'),
    ('81','1','Vivi una Campagna avvincente o crea una squadra e affronta le sfide delle Operazioni Speciali, un mix di mappe e modalità del Multigiocatore e prova il sistema Battle Pass, incluso per tutti i giocatori online.','50.00','Call Of Duty Moder Warfare Xbox One','gioco',true,'10'),
    ('82','1','Car Mechanic Simulator 2021 è una nuova produzione con un folto gruppo di giocatori. Inizia la tua avventura come nuovo proprietario di un autofficina e fatti strada nel settore.','20.00','Car Mechanic Simulator Xbox One','gioco',false,'10'),
    ('83','1','Control è un videogioco di genere sparatutto in terza persona, in stile avventura dinamica, sviluppato da Remedy Entertainment e pubblicato da 505 Games.','20.00','Control Xbox One','gioco',false,'10'),
    ('84','1','It s About Time - il nuovissimo gioco di Crash Bandicoot™! Parti per un avventura oltre i confini del tempo in compagnia dei tuoi marsupiali preferiti.','40.00','Crash Bandicoot 4 It s About Time Xbox One','gioco',false,'10'),
    ('85','1','Cyberpunk 2077 è un GDR a mondo aperto a tema azione e avventura ambientato nella megalopoli di Night City, in cui giochi nei panni di un mercenario cyberpunk coinvolto in una lotta per la sopravvivenza.','25.00','Cyberpunk 2077 Xbox One','gioco',true,'10'),
    ('86','1',' DOOM Eternal ti fa vestire i panni dell inarrestabile DOOM Slayer mentre fai a pezzi demoni classici e nuovi con armi potentissime in mondi incredibili e mai visti prima.','30.00','Doom Eternal Xbox One','gioco',false,'10'),
    ('87','1','Ogni storia ha il suo inizio in F1 2021, il gioco ufficiale del 2021 FIA FORMULA ONE WORLD CHAMPIONSHIP.','30.00','F1 2021 Xbox One','gioco',true,'10'),
    ('88','1','Fallout 76 è ambientato in una storia alternativa e si svolge nel 2102, venticinque anni dopo una guerra nucleare che ha devastato la Terra. Il personaggio del giocatore è un residente del Vault 76.','25.00','Fallout 76 Wastelanders Xbox One','gioco',false,'10'),
    ('89','1',' Diciassette anni dopo una catastrofe nucleare, la civiltà riemerge dal caos per trovare un mondo drasticamente cambiato. Ad Hope County, in Montana, la popolazione sopravvissuta si è riunita in due gruppi diversi.','25.00','Far Cry New Dawn Xbox One','gioco',false,'10'),
    ('90','1','FIFA 22 è un videogioco di calcio sviluppato da EA Sports e pubblicato per PlayStation 4, PlayStation 5, Xbox One, Xbox Series X e Series S, Microsoft Windows.','30.00','Fifa 22 Xbox One','gioco',true,'10'),
    ('91','1','Forza Horizon 5 è un videogioco open world di guida, sviluppato da Playground Games e pubblicato il 9 novembre 2021 da Xbox Game Studios in esclusiva per Xbox One, Xbox Series X/S.','40.00','Forza Horizon 5 Xbox One','gioco',true,'10'),
    ('92','1',' Friday the 13th: The Game è un survival horror in terza persona in cui i giocatori impersoneranno un giovane assistente o, per la prima volta in assoluto, Jason Voorhees.','20.00','Friday The 13Th Xbox One','gioco',false,'10'),
    ('93','1','GRID Legends è un racing game arcade, una babilonia d adrenaliniche corse per piloti solitari e pirati delle strade online.','30.00','Grid Legends Xbox One','gioco',false,'10'),
    ('94','1','Halo Infinite è ambientato su Zeta Halo, un misterioso pianeta artificiale a forma di anello pensato per distruggere la vita della Galassia.','50.00','Halo Infinite Xbox One','gioco',true,'10'),
    ('95','1','John Wick Hex è un videogioco che mette insieme combattimenti coreografati e meccaniche degli scacchi.','10.00','John Wick Hex Xbox One','gioco',false,'10'),
    ('96','1','Tuffati tra avventura e risate nell avventuroso gioco di Jumanji, la sfida definitiva che sa trasportar chi questo mondo vuol lasciar.','25.00','Jumanji Xbox One','gioco',false,'10'),
    ('97','1','Just Dance® 2021 è il gioco di ballo definitivo, con 40 nuovi brani di successo tra cui "Don t Start Now" di Dua Lipa, "Feel Special" di TWICE, "Señorita" di Shawn Mendes e Camila Cabello e altri ancora!','30.00','Just Dance 2021 Xbox One','gioco',false,'10'),
    ('98','1','Haven Springs è una piccola cittadina mineraria piena di bellezze e misteri nascosta tra le montagne del Colorado. Nei panni di Alex, scoprirai i segreti scioccanti dietro la morte di tuo fratello ','25.00','Life is Strange True Colors Xbox One','gioco',true,'10'),
    ('99','1','MXGP 2019  è un titolo solido come il motore di una moto che lotta nel fango. Il gameplay divertente rende tutto molto piacevole, nonostante qualche piccola sbavatura che non rovina però l esperienza nella sua interezza','15.00','MXGP 2019 Xbox One','gioco',false,'10'),
    ('100','1','Soddisfa il tuo bisogno di velocità sia come poliziotto che come fuorilegge mettendoti alla guida dei bolidi ad alte prestazioni più potenti del mondo. È ora di scaldare i motori.','20.00','Need for Speed Hot Pursuit Remastered Xbox One','gioco',false,'10'),
    ('101','1','OUTRIDERS è uno shooter GdR cooperativo da 1 a 3 giocatori ambientato in un universo fantascientifico oscuro e spietato.','20.00','Outriders Xbox One','gioco',true,'10'),
    ('102','1','America, 1899. Dopo un colpo andato storto nella città di Blackwater, Arthur Morgan e la banda di Van der Linde sono costretti alla fuga.','25.00','Red Dead Redemption II Xbox One','gioco',true,'10'),
    ('103','1','Rust è, fondamentalmente, un survival game, cioè un gioco il cui obiettivo è sopravvivere.','30.00','Rust Xbox One','gioco',false,'0'),
    ('104','1','SGW Contracts 2 è uno sparatutto tattico, ambientato in Medio Oriente. Vesti i panni di Raven, un cecchino mercenario ed elimina una serie di bersagli ','30.00','Sniper Ghost Warrior Contracts 2 Xbox One','gioco',true,'10'),
    ('105','1','Cinque anni dopo l Epurazione e l ascesa dell Impero Galattico, l ex-Padawan Jedi Cal Kestis si nasconde sul pianeta Bracca, dove lavora come rottamatore smontando navi delle Guerre dei cloni e nascondendo le sue abilità nella Forza.','15.00','Star Wars Jedi Fallen Order Xbox One','gioco',false,'10'),
    ('106','1','ambientata dopo la battaglia di Endor e la risultante distruzione della seconda Morte Nera, la storia segue le vicende alternate di Rao Highmoon','20.00','Star Wars Squadrons Xbox One','gioco',false,'10'),
    ('107','1','The Elder Scrolls V: Skyrim è un videogioco GdR d azione a mondo aperto sviluppato da Bethesda Game Studios. Skyrim è il quinto capitolo della saga The Elder Scrolls, seguito di The Elder Scrolls IV: Oblivion.','25.00','The elder scrolls V Skyrim Xbox One','gioco',false,'10'),
    ('108','1','Risvegliatosi dall ibernazione per mano di uno scienziato impazzito di nome Phineas Welles, questi inizia un viaggio esplorativo della colonia e dei suoi pericoli nascosti. ','20.00','The Outer Worlds Xbox One','gioco',false,'10'),
    ('109','1','In UFC 4, troverai due scenari nuovi di zecca: preparati a menare le mani nel cortile o immergiti nella leggendaria tradizione del Kumite. ','30.00','UFC 4 Xbox One','gioco',true,'10');

#Giochi Nintendo 3DS e Nintendo Switch

insert into Articolo (codice_articoli, codice_catalogo, descrizione, prezzo, nome, tipologia_articoli, offerta, quantita) values
	('110','1','Si tratta di un gioco di corse dal carattere spiccatamente arcade e dal gameplay "turbocentrico", caratterizzato dalla presenza di numerose vetture realmente esistenti così come di una grande quantità di modalità.','10.00','Asphalt 3D 3DS','gioco',false,'10'),
    ('111','1','Benjamin Kirby "Ben" Tennyson, anche conosciuto come Ben 10, è il protagonista della serie','15.00','Ben 10 3DS','gioco',false,'10'),
    ('112','1','Esso consiste in un insieme di giochi ed attività che mirano ad allenare, potenziare e stimolare le differenti capacità cognitive collocate nelle diverse aree del nostro cervello,','20.00','Brain Training Infernale 3DS','gioco',false,'10'),
    ('113','1','Cooking Mama: Sweet Shop propone circa 60 differenti ricette, in mini-giochi tutti diversi l uno con l altro','20.00','Cooking Mama Sweet Shop 3DS','gioco',false,'10'),
    ('114','1','In Disney Art Academy, i personaggi Disney e Pixar possono essere disegnati o dipinti in vari modi. ','15.00','Disney Art Academy 3DS','gioco',false,'10'),
    ('115','1','Dragon Ball Fusions è l ultimissima esperienza di Dragon Ball per Nintendo 3DS! è un RPG Action che combina la lotta, le personalizzazioni, e il collezionamento degli elementi','10.00','Dragon Ball Fusions 3DS','gioco',true,'10'),
    ('116','1','Driver Renegade ti consente di provare tutta l intensità e la durezza dei veri inseguimenti urbani in 3D.','15.00','Driver Renegade 3D 3DS','gioco',false,'10'),
    ('117','1','Il professor Layton e l eredità degli Aslant è l ultimo gioco uscito della serie del Professor Layton.','15.00','Il Professor Layton e l eredita degli Aslant 3DS','gioco',false,'0'),
    ('118','1','Preparati ad andare a tutto vapore per Sodor con Thomas e amici! In questa avventura piena di giochi e divertenti rompicapi devi aiutare le locomotive a preparare l isola all arrivo di alcuni importanti ospiti!','20.00','Il Trenino Thomas A tutto vapore per Soder 3DS','gioco',true,'10'),
    ('119','1','Mario Sports Superstars per console della famiglia Nintendo 3DS è una compilation che comprende cinque sport: calcio, baseball, tennis, golf ed equitazione','20.00','Mario Sports Superstars 3DS','gioco',false,'10'),
    ('120','1','Nintendogs sfrutta la telecamera e la tecnologia di riconoscimento facciale integrate nella console Nintendo 3DS per consentire ai cagnolini e ai gattini di reagire ai movimenti','20.00','Nintendogs 3DS','gioco',true,'10'),
    ('121','1','Dopo essere stato recapitato a casa tua, insieme a una chiave misteriosa, Orsetto prende vita e inizia a parlare','10.00','Orsetto Amichetto 3DS','gioco',true,'10'),
    ('122','1','Pilotwings Resort è un videogioco di simulazione, sviluppato dalla Monster Games e pubblicato per la console Nintendo 3DS.','15.00','Pilotwings Resort 3DS','gioco',false,'10'),
    ('123','1','A causa di tutte le chiamate di emergenza, questo lavoro è troppo impegnativo per essere gestito da un solo membro dell equipaggio e dovrete lavorare insieme come una squadra per mantenere il parco sicuro','20.00','Planes 2 Missione Antincendio 3DS','gioco',false,'10'),
    ('124','1','Il nuovo titolo Pokémon, Pokémon Ultraluna per la console della famiglia Nintendo 3DS, ti catapulta in una nuova emozionante avventura con una storia tutta nuova.','30.00','Pokemon Ultraluna 3DS','gioco',false,'0'),
    ('125','1','Poochy & Yoshi s Woolly World per console della famiglia Nintendo 3DS è un avventura ambientata in un mondo morbidissimo','15.00','Poochy & Yoshi s Woolly World 3DS','gioco',false,'10'),
    ('126','1','Rabbids Rumble è un altro capitolo nella serie di videogiochi con protagonisti i folli conigli di Ubisoft.','15.00','Rabbids Rumble 3DS','gioco',false,'10'),
    ('127','1','Ridge Racer 3D è uno dei giochi di lancio che meglio sfruttano l effetto tridimensionale della console','15.00','Ridge Racer 3DS','gioco',false,'10'),
    ('128','1',' Yu-Gi-Oh! Zexal: World Duel Carnival cerca di ricreare su Nintendo 3DS quel feeling, fallendo però miseramente.','20.00','Yu-Gi-Oh! Zexal Clash Duel Carnival 3DS','gioco',true,'10'),
    ('129','1','Animal Crossing è un gioco di simulazione di vita dove,ci troveremo su un isola con tanti amici animali parlanti','20.00','Animal Crossing New Horizons Nintendo Switch','gioco',false,'10'),
    ('130','1','Cuphead è un classico gioco d azione "run and gun" incentrato sui combattimenti con i boss.','25.00','Cuphead Nintendo Switch','gioco',true,'10'),
    ('131','1','Dragon Ball Z: Kakarot è un videogioco che, rispetto ai due capitoli di Dragon Ball: Xenoverse ed a Dragon Ball: FighterZ, ripercorre fedelmente la storia ideata da Akira Toriyama.','25.00','Dragon Ball Z Kakarot Nintendo Switch','gioco',true,'10'),
    ('132','1','FIFA 22 è un videogioco di calcio sviluppato da EA Sports e pubblicato per PlayStation 4, PlayStation 5, Xbox One, Xbox Series X e Series S, Microsoft Windows.','25.00','Fifa 22 Nintendo Switch','gioco',true,'10'),
    ('133','1','Ladri ed esploratori si avventurano sotto la superficie in cerca di gloria, tesori e antichi segreti.','20.00','Hollow Knight Nintendo Switch','gioco',false,'0'),
    ('134','1','Detective Pikachu è un videogioco d avventura in cui il giocatore controlla Tim Goodman','20.00','Detective Pikachu 3DS','gioco',false,'10'),
    ('135','1','Kirby ha un talento per inalare l aria e dovrà darsi da fare quando, arriva in una terra sconosciuta.','15.00','Kirby e la Terra Perduta Nintendo Switch','gioco',false,'10'),
    ('136','1','La vacanza da sogno di Luigi si trasforma in un incubo a base di fantasmi in Luigi s Mansion 3 per Nintendo Switch!','20.00','Luigi s Mansion 3 Nintendo Switch','gioco',false,'10'),
    ('137','1','Mario Kart 8 Deluxe ha tutti i tracciati base di Mario Kart 8 per Wii U, a cui si aggiungono tutti i tracciati dei contenuti scaricabili, per un totale di 48 piste','20.00','Mario Kart 8 Deluxe Nintendo Switch','gioco',false,'10'),
    ('138','1','Super Mario Odyssey è un gioco di piattaforme open world, pubblicato il 27 ottobre 2017 per Nintendo Switch. È il settimo Mario 3D della serie','20.00','Super Mario Odyssey Nintendo Switch','gioco',false,'10'),
    ('139','1','Dimentica tutto quello che sai sui giochi di The Legend of Zelda e immergiti in un mondo di scoperte, esplorazione e avventura in The Legend of Zelda: Breath of the Wild, il nuovo capitolo di questa amatissima serie.','30.00','The Legend of Zelda Breath of the Wild Nintendo Switch','gioco',false,'10');
    
#Console

insert into Articolo (codice_articoli, codice_catalogo, descrizione, prezzo, nome, tipologia_articoli, offerta, quantita) values
	('140','2','La Console Sony PlayStation 1, completa di tutta la cavetteria originale sony, e di controller anch esso originale dual shock, ovviamente tutto testato e funzionante.','100.00','PlayStation 1','console',false,'2'),
    ('141','2','La PlayStation 2 è la seconda console da tavolo per videogiochi prodotta da Sony Interactive Entertainment, presentata il 1º marzo 1999 e commercializzata il 4 marzo 2000 in Giappone','150.00','PlayStation 2','console',false,'5'),
    ('142','2','La PlayStation 3 è una console per videogiochi prodotta da Sony Computer Entertainment, dotata di varie funzioni multimediali oltre a quelle di intrattenimento videoludico.','200.00','Playstation 3','console',false,'7'),
    ('143','2','La PlayStation 4 è una console per videogiochi prodotta da Sony Interactive Entertainment, dotata di varie funzioni multimediali oltre a quelle di intrattenimento videoludico.','300.00','Playstation 4','console',true,'10'),
    ('144','2','La PlayStation 5 è una console per videogiochi prodotta da Sony Interactive Entertainment','500.00','Playstation 5','console',true,'5'),
    ('145','2','La PlayStation Vita , è una console portatile per videogiochi prodotta da Sony Interactive Entertainment, ','75.00','PsVita','console',false,'10'),
    ('146','2','La Xbox 360 è una console per videogiochi prodotta da Microsoft con la collaborazione di IBM, ATI Technologies e Samsung ed è succeduta alla prima Xbox.','230.00','Xbox 360','console',false,'10'),
    ('147','2','La Xbox One è una console per videogiochi prodotta da Microsoft. La macchina dispone di varie funzioni multimediali oltre a quelle di intrattenimento videoludico e fa parte dell ottava generazione di console, ','300.00','Xbox One','console',false,'10'),
    ('148','2','La Xbox Serie S è una console per videogiochi prodotta da Microsoft.La console fa parte della quarta generazione della famiglia Xbox','350.00','Xbox Serie S','console',false,'10'),
    ('149','2','La Xbox Serie X è una console per videogiochi prodotta da Microsoft.La console fa parte della quarta generazione della famiglia Xbox','500.00','Xbox Serie X','console',true,'5'),
    ('150','2','Il Nintendo 2DS è una console portatile per videogiochi prodotta da Nintendo. È il secondo restyling di Nintendo 3DS ed appartiene all ottava generazione delle console.','100.00','Nintendo 2DS','console',false,'10'),
    ('151','2','Il Nintendo 3DS è una console portatile per videogiochi prodotta da Nintendo e la prima ad appartenere all ottava generazione di console videoludiche. ','150.00','Nintendo 3DS','console',false,'10'),
    ('152','2','Il Nintendo Switch, inizialmente conosciuto con il nome in codice di NX, è una console a 64 bit di natura ibrida sviluppata da Nintendo ','250.00','Nintendo Switch','console',true,'10');

insert into Utente(id_utente,email,password,ruolo) values
	('Christian','c.mascolo21@studenti.unisa.it','YBskI5eXlup7vN4R7N+QZg==:dioDBxFWC3NisY+M4i4tUw==','admin'),
    ('AnnaLinda','a.brenga@studenti.unisa.it','uXnGxSffO+6UP3JE7bLBzA==:9MOByiJsC3yiN8S2bViDzg==','admin'),
    ('Jess','j.zampetti@studenti.unisa.it','yhfzaHmxfMqvz1yemXV39A==:tLBOcrM0M4lD4vvqa7eZvw==','admin'),
    ('Paolo','p.vitolo8@studenti.unisa.it','jAiG9ITZ+lASFBfmsUxJkQ==:+RsOccRtl/x+K1sBR1oeFQ==','admin');

insert into Dati_anagrafici(id_utente,cap,nome,cognome,telefono,data_nascita,città) values
	('Christian','80045','Christian','Mascolo','3883909116','2001-09-24','Pompei'),
    ('AnnaLinda','84047','Anna Linda','Brenga','3662174424','1999-03-28','Gromola'),
    ('Jess','82018','Jessica','Zampetti','3402760091','2002-04-24','Calvi'),
    ('Paolo','84047','Paolo','Vitolo','3393826684','2002-02-02','Capaccio Paestum');
    
#Articoli Sony
    
insert into Sono_forniti_da(codice_articoli,partita_iva) values
	('1','01833690157'),
    ('2','01833690157'),
    ('3','01833690157'),
    ('4','01833690157'),
    ('5','01833690157'),
    ('6','01833690157'),
    ('7','01833690157'),
    ('8','01833690157'),
    ('9','01833690157'),
    ('10','01833690157'),
    ('11','01833690157'),
    ('12','01833690157'),
    ('13','01833690157'),
    ('14','01833690157'),
    ('15','01833690157'),
    ('16','01833690157'),
    ('17','01833690157'),
    ('18','01833690157'),
    ('19','01833690157'),
    ('20','01833690157'),
    ('21','01833690157'),
    ('22','01833690157'),
    ('23','01833690157'),
    ('24','01833690157'),
    ('25','01833690157'),
    ('26','01833690157'),
    ('27','01833690157'),
    ('28','01833690157'),
    ('29','01833690157'),
    ('30','01833690157'),
    ('31','01833690157'),
    ('32','01833690157'),
    ('33','01833690157'),
    ('34','01833690157'),
    ('35','01833690157'),
    ('36','01833690157'),
    ('37','01833690157'),
    ('38','01833690157'),
    ('39','01833690157'),
    ('40','01833690157'),
    ('41','01833690157'),
    ('42','01833690157'),
    ('43','01833690157'),
    ('44','01833690157'),
    ('45','01833690157'),
    ('46','01833690157'),
    ('47','01833690157'),
    ('48','01833690157'),
    ('49','01833690157'),
    ('50','01833690157'),
    ('51','01833690157'),
    ('52','01833690157'),
    ('53','01833690157'),
    ('54','01833690157'),
    ('55','01833690157'),
    ('56','01833690157'),
    ('57','01833690157'),
    ('58','01833690157'),
    ('59','01833690157'),
    ('60','01833690157'),
    ('62','01833690157'),
    ('63','01833690157'),
    ('64','01833690157'),
    ('66','01833690157'),
    ('68','01833690157'),
    ('69','01833690157'),
    ('140','01833690157'),
    ('141','01833690157'),
    ('142','01833690157'),
    ('143','01833690157'),
    ('144','01833690157'),
    ('145','01833690157');
    
#Articoli Microsoft

insert into Sono_forniti_da(codice_articoli,partita_iva) values
	('61','08106710158'),
    ('65','08106710158'),
    ('67','08106710158'),
	('70','08106710158'),
    ('71','08106710158'),
    ('72','08106710158'),
    ('73','08106710158'),
    ('74','08106710158'),
    ('75','08106710158'),
    ('76','08106710158'),
    ('77','08106710158'),
    ('78','08106710158'),
    ('79','08106710158'),
    ('80','08106710158'),
    ('81','08106710158'),
    ('82','08106710158'),
    ('83','08106710158'),
    ('84','08106710158'),
    ('85','08106710158'),
    ('86','08106710158'),
    ('87','08106710158'),
    ('88','08106710158'),
    ('89','08106710158'),
    ('90','08106710158'),
    ('91','08106710158'),
	('92','08106710158'),
    ('93','08106710158'),
    ('94','08106710158'),
    ('95','08106710158'),
    ('96','08106710158'),
    ('97','08106710158'),
    ('98','08106710158'),
    ('99','08106710158'),
    ('100','08106710158'),
    ('101','08106710158'),
    ('102','08106710158'),
    ('103','08106710158'),
    ('104','08106710158'),
    ('105','08106710158'),
    ('106','08106710158'),
    ('107','08106710158'),
    ('108','08106710158'),
    ('109','08106710158'),
    ('146','08106710158'),
    ('147','08106710158'),
	('148','08106710158'),
    ('149','08106710158');

#Articoli Nintendo

insert into Sono_forniti_da(codice_articoli,partita_iva) values
	('110','03359860966'),
    ('111','03359860966'),
    ('112','03359860966'),
    ('113','03359860966'),
    ('114','03359860966'),
    ('115','03359860966'),
    ('116','03359860966'),
    ('117','03359860966'),
    ('118','03359860966'),
    ('119','03359860966'),
    ('120','03359860966'),
    ('121','03359860966'),
    ('122','03359860966'),
    ('123','03359860966'),
    ('124','03359860966'),
    ('125','03359860966'),
    ('126','03359860966'),
    ('127','03359860966'),
    ('128','03359860966'),
    ('129','03359860966'),
    ('130','03359860966'),
    ('131','03359860966'),
    ('132','03359860966'),
    ('133','03359860966'),
    ('134','03359860966'),
    ('135','03359860966'),
    ('136','03359860966'),
    ('137','03359860966'),
    ('138','03359860966'),
    ('139','03359860966'),
    ('150','03359860966'),
    ('151','03359860966'),
    ('152','03359860966');