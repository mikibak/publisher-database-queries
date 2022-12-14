INSERT INTO Ksiegarnie(Nazwa, Miasto, Ulica, NumerDomu) VALUES 
	('Ksiegarnia PG', 'Gdañsk', 'Narutowicza', '17'),
	('Ksiegarnia PAN', 'Gdañsk', 'Wa³owa', '5'),
	('Papierownia', 'Gdañsk', 'Kartuska', '40'),
	('Pod molo', 'Sopot', 'Bohaterów Monte Cassino', '25'),
	('Œledziowa', 'Gdynia', 'Pucka', '4'),
	('Sk³ad opa³u', 'Rumia', 'Morska', '20'),
	('Ksiegarnia Wolnoœæ', 'Szczecin', 'Gdañska', '1'),
	('Apollo', 'Warszawa', 'Piastowska', '441'),
	('Wschodnia', 'Wroc³aw', 'Jagie³³y', '26'),
	('Ksiêgarnia Bliska', 'Poznañ', 'Warszawska', '17'),
	('Ksiegarnia WUM', 'Warszawa', 'Zielona', '2');

DECLARE @MY_ID integer;
INSERT INTO Osoby(Imie, Nazwisko) 
	VALUES ('Jan', 'Daciuk');

SELECT @MY_ID = SCOPE_IDENTITY();

INSERT INTO Autorzy(ID_pracownika, Email)
    VALUES (@MY_ID, 'jdaciuk@pg.edu.pl');




DECLARE @MY_ID2 integer;
INSERT INTO Osoby(Imie, Nazwisko) 
	VALUES ('Tomasz', 'Goluch');

SELECT @MY_ID2 = SCOPE_IDENTITY();

INSERT INTO Graficy(ID_pracownika, TypGrafiki)
    VALUES (@MY_ID2, 'grafika wektorowa');