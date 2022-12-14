INSERT INTO Ksiegarnie(Nazwa, Miasto, Ulica, NumerDomu) VALUES 
	('Ksiegarnia PG', 'Gda�sk', 'Narutowicza', '17'),
	('Ksiegarnia PAN', 'Gda�sk', 'Wa�owa', '5'),
	('Papierownia', 'Gda�sk', 'Kartuska', '40'),
	('Pod molo', 'Sopot', 'Bohater�w Monte Cassino', '25'),
	('�ledziowa', 'Gdynia', 'Pucka', '4'),
	('Sk�ad opa�u', 'Rumia', 'Morska', '20'),
	('Ksiegarnia Wolno��', 'Szczecin', 'Gda�ska', '1'),
	('Apollo', 'Warszawa', 'Piastowska', '441'),
	('Wschodnia', 'Wroc�aw', 'Jagie��y', '26'),
	('Ksi�garnia Bliska', 'Pozna�', 'Warszawska', '17'),
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