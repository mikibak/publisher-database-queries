CREATE DATABASE Wydawnictwo;

--zwiazki 1-1 ustawiamy unique na klucz obcy

USE Wydawnictwo;

CREATE TABLE Osoby (
	ID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	Imie varchar(255),
	Nazwisko varchar(255)
);


--DROP TABLE Osoby;
--DROP TABLE Redaktorzy;
--DROP TABLE Graficy;
--DROP TABLE Autorzy;
--DROP TABLE Teksty;
--DROP DATABASE Wydawnictwo;

CREATE TABLE Redaktorzy (
	ID_pracownika int,
	Specjalizacja varchar(255),
	FOREIGN KEY (ID_pracownika) REFERENCES Osoby(ID),
	PRIMARY KEY (ID_pracownika)
);

CREATE TABLE Graficy (
	ID_pracownika int,
	TypGrafiki varchar(255),
	FOREIGN KEY (ID_pracownika) REFERENCES Osoby(ID),
	PRIMARY KEY (ID_pracownika)
);

CREATE TABLE Autorzy (
	ID_pracownika int,
	Email varchar(320),
	FOREIGN KEY (ID_pracownika) REFERENCES Osoby(ID),
	PRIMARY KEY (ID_pracownika)
);

CREATE TABLE Teksty (
	ID_autora int NOT NULL,
	Tytul varchar(255) NOT NULL,
	Gatunek varchar(255),
	Jezyk varchar(255),
	Dlugosc int,
	DataPrzyjecia DATE,
	FOREIGN KEY (ID_autora) REFERENCES Autorzy(ID_pracownika),
	PRIMARY KEY (ID_autora, Tytul)
);

CREATE TABLE Okladki (
	ID_okladki int IDENTITY(1,1) NOT NULL,
	ID_grafika int NOT NULL,
	Obraz int,
	Rozmiar_x int, 
	Rozmiar_y int, 
	Czcionka varchar(255),
	FOREIGN KEY (ID_grafika) REFERENCES Graficy(ID_pracownika),
	PRIMARY KEY (ID_okladki)
);

CREATE TABLE Wydania (
	ISBN varchar(17),
	Tytul varchar(255),
	TytulTekstu varchar(255),
	ID_autora int,
	ID_okladki int,
	NumerWydania int,
	KosztRedakcji DECIMAL(7,2),
	KosztDrukuZaSztuke DECIMAL(5,2),
	Dlugosc int,
	DataWydania DATE,
	KolorOkladki varchar(255),
	PRIMARY KEY (ISBN),
	FOREIGN KEY (ID_autora, TytulTekstu) REFERENCES Teksty(ID_autora, Tytul),
	FOREIGN KEY (ID_okladki) REFERENCES Okladki(ID_okladki)
);


--ALTER TABLE Wydania ALTER COLUMN KosztRedakcji DECIMAL(7,2);


CREATE TABLE Ksiegarnie (
	Nazwa varchar(255) NOT NULL PRIMARY KEY,
	Miasto varchar(255),
	Ulica varchar(255),
	NumerDomu int
);

CREATE TABLE Sprzeda¿ (
	ID_sprzedazy int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ISBN varchar(17),
	NazwaKsiegarni varchar(255),
	DataTransakcji DATE,
	LiczbaEgzemplarzy int,
	CenaZaEgzemplarz DECIMAL(5,2),
	CzyElektroniczne BIT
	FOREIGN KEY (ISBN) REFERENCES Wydania(ISBN),
	FOREIGN KEY (NazwaKsiegarni) REFERENCES Ksiegarnie(Nazwa)
);

CREATE TABLE Poprawianie (
	DataRozpoczeciaPrac DATE,
	DataZakonczeniaPrac DATE,
	ISBN varchar(17),
	ID_redaktora int,
	FOREIGN KEY (ISBN) REFERENCES Wydania(ISBN),
	FOREIGN KEY (ID_redaktora) REFERENCES Redaktorzy(ID_pracownika),
	PRIMARY KEY (ISBN, ID_redaktora)
);