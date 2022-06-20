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
  	password varchar(32) not null,
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
	id_città varchar(30) not null,
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
	quantità int not null,
	
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
	
    foreign key(codice_articoli) references Articolo(codice_articoli),
	foreign  key(id_utente) references Utente(id_utente)
);

insert into Fornitore values('01833690157','Sony','Via cantalupo in sabina 29');
insert into Fornitore values('08106710158','Microsoft','Viale Pasubio 21');
insert into Fornitore values('03359860966','Nintendo','Via Torri Bianche, 6');

insert into Catalogo values('1');

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
insert into Articolo values('34','1','Piloti competitivi, collezionisti, amanti della messa a punto, progettisti di livree, fotografi e appassionati di corse arcade: le funzionalità ispirate dal passato, presente e futuro di Gran Turismo.','50.00','Gran Turimso 7 Ps4','gioco',true,'10');
insert into Articolo values('35','1',' In Horizon: Forbidden West per PlayStation 4 ti muoverai in una frontiera maestosa e pericolosa, che nasconde nuove e misteriose minacce, con l’obiettivo di salvare quel che resta dell’umanità.','70.00','Horizon Forbidden West Ps4','gioco',false,'15');
insert into Articolo values('36','1','NBA 2K22 hai l’intero universo del basket nelle tue mani. GIOCA ORA nell’ambiente realistico delle leghe NBA e WNBA e sfida le squadre e i giocatori originali.','45.00','Nba 2K22 Ps4','gioco',false,'10');
insert into Articolo values('37','1','Tom Clancy s Rainbow Six® Extraction è uno sparatutto tattico cooperativo in prima persona per uno-tre giocatori. Forma la tua squadra d élite di operatori Rainbow Six.','30.00','Rainbow Six Extraction Ps4','gioco',false,'10');
insert into Articolo values('38','1','Nell ultima avventura dell universo di Marvel s Spider-Man, l adolescente Miles Morales affronta il trasloco nella sua nuova casa mentre segue le orme del suo mentore, Peter Parker, per diventare il nuovo Spider-Man.','30.00','Spider Man Miles Morales Ps4','gioco',false,'10');
insert into Articolo values('39','1','Marvel s Spider-Man contiene tutte le acrobazie, le improvvisazioni e le ragnatele che hanno reso celebre l arrampicamuri, uno dei supereroi più famosi al mondo,','20.00','Spider-Man Ps4','gioco',false,'10');
