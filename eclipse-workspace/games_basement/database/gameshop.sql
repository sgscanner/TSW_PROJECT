DROP DATABASE IF EXISTS gameshop;
CREATE DATABASE gameshop;
USE gameshop;

CREATE USER 'gameshop'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILIGES on gameshop.* to 'gameshop'@'localhost';

DROP TABLE IF EXISTS Catalogo;
CREATE TABLE Catalogo (
	codice_catalogo int(15) not null primary key
);

DROP TABLE IF EXISTS Utente;
CREATE TABLE Utente (
	id_utente varchar(25) not null primary key,
  	email varchar(30) not null ,
  	password varchar(32) not null,
  	ruolo varchar(30 ) not null	
);

DROP TABLE IF EXISTS Città;
CREATE TABLE Città (
	id_città varchar(30) not null primary key,
	nome_città varchar(25) not null,
	cap varchar(25) not null,
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
) 

DROP TABLE IF EXISTS Rubrica_indirizzi;
CREATE TABLE Rubrica_indirizzi (
	id_indirizzo smallint not null,
	id_utente varchar(25) not null,
	id_città varchar(30) not null,
	indirizzo varchar(50) not null,
	foreign key(id_utente) references utente (id_utente)
	primary key id_indirizzo
);

DROP TABLE IF EXISTS Ordine;
CREATE TABLE Ordine (
	numero_ordine varchar(30) not null primary key,
	id_utente varchar(25) not null,
	importo_totale decimal(20,2) not null,

	foreign key (id_utente) REFERENCES utente (id_utente)
);

DROP TABLE IF EXISTS Fornitore;
CREATE TABLE Fornitore (
	partita_iva varchar(11) not  null primary key,
	nome		varchar(250) not null,
	indirizzo	varchar(250) not null
);

DROP TABLE IF EXISTS Articoli;
CREATE TABLE Articoli (
	codice_articoli varchar (30) not null primary key,
	codice_catalogo int (10) not null,
	descrizione varchar(250) not null,
	prezzo 		decimal(15,2) not null,
	nomi 		varchar(250) not null,
	tipologia_articoli 	varchar(250) not null,
	offerta boolean not null,
	quantità int not null,
	
	foreign key(codice_catalogo) REFERENCES Catalogo (codice_catalogo)
);

DROP TABLE IF EXISTS Compongono;
CREATE TABLE Compongono (
	codice_articoli varchar (30) not null,
	numero_ordine VARCHAR (30) not null,
	quantità varchar(30) not null,
	foreign key(codice_articoli) REFERENCES ARTICOLI(codice_articoli),
	foreign key(numero_ordine) REFERENCES ORDINE(numero_ordine)
);

DROP TABLE IF EXISTS Sono_forniti_da;
CREATE TABLE Sono_forniti_da	(
	codice_articoli varchar(30) not null,
	partita_iva	varchar(11) not null,
	foreign key(codice_articoli) REFERENCES articoli (codice_articoli),
	foreign key(partita_iva) REFERENCES fornitore(partita_iva)
);

DROP TABLE IF EXISTS Standard;
CREATE TABLE Standard(
	id_spedizione int (10) not null primary key auto_increment,
	numero_ordine varchar (30) not null,
	data_spedizione date,
	costo	decimal(10,2) not null,
	foreign key(numero_ordine) REFERENCES ORDINE(numero_ordine)
);

DROP TABLE IF EXISTS Veloce;
CREATE TABLE Veloce (
	id_spedizione int (10) not null primary key,
	numero_ordine varchar (30) not null,
	data_spedizione date,
	costo decimal(10,2) not null,
	foreign key (numero_ordine) REFERENCES ORDINE(numero_ordine)
);

DROP TABLE IF EXISTS Pagamento;
CREATE TABLE Pagamento (
	id_pagamento int(15) not null primary key,
	numero_ordine varchar (30) not null,
	importo_pagamento decimal (15,2) not null,
	foreign key(numero_ordine) REFERENCES ORDINE (numero_ordine)
);

DROP TABLE IF EXISTS Carta;
CREATE TABLE Carta(
	numero_di_carta varchar(25) not null,
	id_pagamento int(10) not null,
	dati_intestatario varchar(25) not null,
	foreign key(id_pagamento) REFERENCES PAGAMENTO(id_pagamento)
);

DROP TABLE IF EXISTS Contanti;
CREATE TABLE Contanti(
	id_pagamento int (10) not null,
	foreign key(id_pagamento) REFERENCES PAGAMENTO(id_pagamento)
);

DROP TABLE IF EXISTS Bonifico;
CREATE TABLE Bonifico (
	iban varchar (27) not null ,
	id_pagamento int(10) not null,
	causale varchar(144) not null,
	dati_intestatario varchar(50) not null,
	foreign key(id_pagamento) REFERENCES PAGAMENTO(id_pagamento)
);

DROP TABLE IF EXISTS Fattura;
CREATE TABLE Fattura (
	id_fattura int(15) not null primary key,
	id_pagamento int (10) not null,
	data	date,
	foreign key(id_pagamento) REFERENCES PAGAMENTO(id_pagamento)
);

DROP TABLE IF EXISTS Recensione;
CREATE TABLE Recensione(
	numeroStelle int not null,
	id_utente varchar(250) not null,
	codice_articoli varchar(250) not null,
	
	foreign  key(id_utente) references Utente(id_utente),
	foreign  key(codice_articoli) references Articolo(codice_articoli)
);

insert into Fornitore values('01833690157','Sony','Via cantalupo in sabina 29');
insert into Fornitore values('08106710158','Microsoft','Viale Pasubio 21');
insert into Fornitore values('03359860966','Nintendo','Via Torri Bianche, 6');