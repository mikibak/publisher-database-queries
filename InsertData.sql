USE Wydawnictwo;

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
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Katarzyna', 'Nowak');
SELECT @MY_ID = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID, 'knowak@pg.edu.pl');

DECLARE @MY_ID2 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Adam', 'Majewski');
SELECT @MY_ID2 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID2, 'amajewski@pg.edu.pl');

DECLARE @MY_ID3 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Anna', 'Kowalska');
SELECT @MY_ID3 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID3, 'akowalska@pg.edu.pl');

DECLARE @MY_ID4 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Piotr', 'Wojciechowski');
SELECT @MY_ID4 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID4, 'pwojciechowski@pg.edu.pl');

DECLARE @MY_ID5 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Fiodor', 'Dostojewski');
SELECT @MY_ID5 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID5, 'fdostojewski@pg.edu.pl');

DECLARE @MY_ID6 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Marek', 'Kubale');
SELECT @MY_ID6 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID6, 'kubale@pg.edu.pl');

DECLARE @MY_ID7 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Zbigniew', 'Stonoga');
SELECT @MY_ID7 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID7, 'jdaciuk@pg.edu.pl');

DECLARE @MY_ID8 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Magdalena', 'Mazur');
SELECT @MY_ID8 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID8, 'mmazur@pg.edu.pl');

DECLARE @MY_ID9 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Tomasz', 'Jankowski');
SELECT @MY_ID9 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID9, 'tjankowski@pg.edu.pl');

DECLARE @MY_ID10 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Agnieszka', 'Krawczyk');
SELECT @MY_ID10 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID10, 'akrawczyk@pg.edu.pl');

DECLARE @MY_ID11 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Dawid', 'Kaczmarek');
SELECT @MY_ID11 = SCOPE_IDENTITY();
INSERT INTO Autorzy(ID_pracownika, Email) VALUES (@MY_ID11, 'dkaczmarek@pg.edu.pl');





DECLARE @MY_ID20 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Jakub', 'B¹k');
SELECT @MY_ID20 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID20, 'Litografia');

DECLARE @MY_ID21 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Alicja', 'Czerwiñska');
SELECT @MY_ID21 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID21, 'Rysunek');

DECLARE @MY_ID22 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Szymon', 'Duda');
SELECT @MY_ID22 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID22, 'Malarstwo');

DECLARE @MY_ID23 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Agata', 'Ewert');
SELECT @MY_ID23 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID23, 'Malarstwo');

DECLARE @MY_ID24 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Kamil', 'Fujak');
SELECT @MY_ID24 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID24, 'Grafika komputerowa');

DECLARE @MY_ID25 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Marta', 'G³owacka');
SELECT @MY_ID25 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID25, 'Fotografia');

DECLARE @MY_ID26 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Pawe³', 'Hajduk');
SELECT @MY_ID26 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID26, 'Druk cyfrowy');

DECLARE @MY_ID27 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Dominika', 'Iwañska');
SELECT @MY_ID27 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID27, 'Rysunek');

DECLARE @MY_ID28 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Paulina', 'Jaworska');
SELECT @MY_ID28 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID28, 'Rysunek');

DECLARE @MY_ID29 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Krzysztof', 'Kalisz');
SELECT @MY_ID29 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID29, 'Monotypia');

DECLARE @MY_ID30 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Natalia', 'Lis');
SELECT @MY_ID30 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID30, 'Kola¿');

DECLARE @MY_ID31 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('£ukasz', 'Maj');
SELECT @MY_ID31 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID31, 'Litografia');

DECLARE @MY_ID32 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Monika', 'Nowakowska');
SELECT @MY_ID32 = SCOPE_IDENTITY();
INSERT INTO Graficy(ID_pracownika, TypGrafiki) VALUES (@MY_ID32, 'Rysunek');





DECLARE @MY_ID40 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Katarzyna', 'Pawlak');
SELECT @MY_ID40 = SCOPE_IDENTITY();
INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID40, 'Fantastyka naukowa');

DECLARE @MY_ID41 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Mateusz', 'Kowalczyk');
SELECT @MY_ID41 = SCOPE_IDENTITY();
INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID41, 'Horror');

DECLARE @MY_ID42 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Aleksandra', 'Maj');
SELECT @MY_ID42 = SCOPE_IDENTITY();
INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID42, 'Fantasy');

DECLARE @MY_ID43 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Grzegorz', 'Nowak');
SELECT @MY_ID43 = SCOPE_IDENTITY();
INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID43, 'Sensacja');

DECLARE @MY_ID44 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Agnieszka', 'Jankowska');
SELECT @MY_ID44 = SCOPE_IDENTITY();
INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID44, 'Romans');

DECLARE @MY_ID45 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Marcin', 'Witkowski');
SELECT @MY_ID45 = SCOPE_IDENTITY();
INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID45, 'Dramat');

DECLARE @MY_ID46 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Monika', 'Kowalska');
SELECT @MY_ID46 = SCOPE_IDENTITY();
INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID46, 'Fantastyka naukowa');

DECLARE @MY_ID47 integer;
INSERT INTO Osoby(Imie, Nazwisko) VALUES ('Piotr', 'Mazur');
SELECT @MY_ID47 = SCOPE_IDENTITY();
INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID47, 'Horror');




INSERT INTO Teksty(ID_autora, Tytul, Gatunek, Jezyk, Dlugosc, DataPrzyjecia) VALUES
(7, 'WiedŸmin', 'Fantasy', 'polski', 46, '2022-07-02'),
(2, 'Mroczne materie', 'Fantasy', 'polski', 88, '2022-05-15'),
(3, 'Harry Potter', 'Fantasy', 'polski', 78, '2022-08-20'),
(4, 'Lœnienie', 'Horror', 'polski', 50, '2022-09-12'),
(5, 'Dziennik cwaniaczka', 'Komedia', 'polski', 30, '2022-03-06'),
(1, 'Gone with the Wind', 'Romans', 'polski', 76, '2022-01-11'),
(8, 'Niezgodna', 'Science fiction', 'polski', 55, '2022-02-28'),
(9, 'Z³odziejka ksi¹¿ek', 'Dramat', 'polski', 25, '2022-04-07'),
(10, 'Mistrz i Ma³gorzata', 'Fantasy', 'polski', 80, '2022-06-19'),
(11, 'Odyssey', 'Fantasy', 'polski', 96, '2022-10-31'),
(6,  '£agodne wprowadzenie do analizy algorytmów', 'Dramat', 'arabski', 96, '1991-12-26');


INSERT INTO Okladki(ID_grafika, Obraz, Rozmiar_x, Rozmiar_y, Czcionka) VALUES
(18, 37, 19, 32, 'Arial'),
(21, 88, 27, 25, 'Verdana'),
(12, 14, 21, 22, 'Helvetica'),
(20, 72, 15, 35, 'Times New Roman'),
(22, 50, 18, 28, 'Courier New'),
(13, 11, 25, 23, 'Tahoma'),
(19, 81, 16, 31, 'Georgia'),
(14, 25, 22, 21, 'Comic Sans MS'),
(15, 42, 30, 20, 'Trebuchet MS'),
(24, 99, 21, 30, 'Impact');

INSERT INTO Wydania(ISBN, Tytul, TytulTekstu, ID_autora, ID_okladki, NumerWydania, KosztRedakcji, KosztDrukuZaSztuke, Dlugosc, DataWydania, KolorOkladki) VALUES
('978-098765-43-21', 'WiedŸmin', 'WiedŸmin', 7, 2, 1, 877.00, 13.50, 46, '2022-08-02', 'czerwony'),
('978-098765-43-22', 'Mroczne materie', 'Mroczne materie', 2, 3, 1, 654.00, 16.50, 88, '2022-06-15', 'zielony'),
('978-098765-43-23', 'Harry Potter', 'Harry Potter', 3, 4, 1, 991.00, 22.50, 78, '2022-09-20', '¿ó³ty'),
('978-098765-43-24', 'Lœnienie', 'Lœnienie', 4, 5, 1, 782.00, 20.50, 50, '2022-10-12', 'niebieski'),
('978-098765-43-25', 'Dziennik cwaniaczka', 'Dziennik cwaniaczka', 5, 6, 1, 532.00, 19.50, 30, '2022-11-06', 'fioletowy'),
('978-098765-43-26', 'Gone with the Wind', 'Gone with the Wind', 1, 7, 1, 1032.00, 18.50, 76, '2022-12-11', 'br¹zowy'),
('978-098765-43-27', 'Niezgodna', 'Niezgodna', 8, 8, 1, 765.00, 16.50, 55, '2022-01-28', 'ró¿owy'),
('978-098765-43-28', 'Z³odziejka ksi¹¿ek', 'Z³odziejka ksi¹¿ek', 9, 9, 1, 599.00, 20.50, 25, '2022-02-07', 'szary'),
('978-098765-43-29', 'Mistrz i Ma³gorzata', 'Mistrz i Ma³gorzata', 10, 10, 1, 888.00, 21.50, 80, '2022-03-19', 'pomarañczowy'),
('978-098765-43-30', 'Odyssey', 'Odyssey', 11, 11, 1, 1011.00, 18.50, 96, '2022-03-19', 'z³oty'),
('978-098765-43-31', '£agodne wprowadzenie do analizy algorytmów', '£agodne wprowadzenie do analizy algorytmów', 6, 11, 1, 16500.00, 25.50, 96, '1992-05-26', 'niebieski'),
('978-098765-43-32', '£agodne wprowadzenie do analizy algorytmów', '£agodne wprowadzenie do analizy algorytmów', 6, 11, 2,  4200.00, 21.37, 96, '1992-05-26', 'zielony'),
('978-098765-43-33', '£agodne wprowadzenie do analizy algorytmów', '£agodne wprowadzenie do analizy algorytmów', 6, 11, 3,  1550.00, 25.50, 96, '1994-05-26', 'pomarañczowy'),
('978-098765-43-34', '£agodne wprowadzenie do analizy algorytmów', '£agodne wprowadzenie do analizy algorytmów', 6, 11, 4,  4523.00, 25.50, 96, '2019-05-26', 'czerwony'),
('978-098765-43-35', '£agodne wprowadzenie do analizy algorytmów', '£agodne wprowadzenie do analizy algorytmów', 6, 11, 5, 45624.00, 33.50, 96, '2020-05-26', 'ró¿owy'),
('978-098765-43-36', '£agodne wprowadzenie do analizy algorytmów', '£agodne wprowadzenie do analizy algorytmów', 6, 11, 6, 24356.00, 32.50, 96, '2021-05-26', '¿ó³ty'),
('978-098765-43-37', '£agodne wprowadzenie do analizy algorytmów', '£agodne wprowadzenie do analizy algorytmów', 6, 11, 7,  2465.00, 44.50, 96, '2022-05-26', 'bia³y');


INSERT INTO Sprzeda¿(ISBN, NazwaKsiegarni, DataTransakcji, LiczbaEgzemplarzy, CenaZaEgzemplarz, CzyElektroniczne) VALUES
('978-098765-43-21', 'Ksiegarnia PG', '2022-07-02', 50, 15.50, 0),
('978-098765-43-22', 'Ksiegarnia PAN', '2022-05-15', 200, 23.50, 0),
('978-098765-43-23', 'Papierownia', '2022-08-20', 70, 12.50, 0),
('978-098765-43-24', 'Pod molo', '2022-09-12', 30, 20.50, 0),
('978-098765-43-25', 'Œledziowa', '2022-03-06', 60, 18.50, 0),
('978-098765-43-26', 'Sk³ad opa³u', '2022-01-11', 224, 22.50, 0),
('978-098765-43-27', 'Ksiegarnia Wolnoœæ', '2022-02-28', 860, 11.50, 0),
('978-098765-43-28', 'Apollo', '2022-04-07', 100, 14.50, 0),
('978-098765-43-29', 'Wschodnia', '2022-06-19', 12, 17.50, 0),
('978-098765-43-30', 'Ksiêgarnia Bliska', '2022-10-31', 9, 16.50, 0),
('978-098765-43-31', 'Ksiegarnia WUM', '2022-11-30', 15, 13.50, 0),
('978-098765-43-32', 'Ksiegarnia PG', '2022-12-29', 18, 21.50, 0),
('978-098765-43-33', 'Ksiegarnia PAN', '2023-01-28', 22, 24.50, 0),
('978-098765-43-34', 'Papierownia', '2023-02-27', 25, 19.50, 0),
('978-098765-43-35', 'Pod molo', '2023-03-28', 28, 23.50, 0),
('978-098765-43-31', 'Ksiegarnia PG', '2010-07-02', 115, 15.50, 0),
('978-098765-43-32', 'Ksiegarnia PG', '2010-07-02', 25, 15.50, 0),
('978-098765-43-33', 'Ksiegarnia PG', '2010-07-02', 335, 15.50, 0),
('978-098765-43-34', 'Ksiegarnia PG', '2010-07-02', 445, 15.50, 0);


INSERT INTO Poprawianie(DataRozpoczeciaPrac, DataZakonczeniaPrac, ISBN, ID_redaktora) VALUES
('2022-05-02', '2022-06-05', '978-098765-43-21', 28),
('2022-06-15', '2022-08-25', '978-098765-43-22', 29),
('2022-07-20', '2022-09-12', '978-098765-43-23', 30),
('2022-03-06', '2022-05-20', '978-098765-43-24', 31),
('2022-01-11', '2022-03-01', '978-098765-43-25', 32),
('2022-02-28', '2022-04-14', '978-098765-43-26', 25),
('2022-04-07', '2022-06-19', '978-098765-43-27', 26),
('2022-06-19', '2022-09-10', '978-098765-43-28', 27),
('2022-10-31', '2022-12-15', '978-098765-43-29', 28),
('2022-09-12', '2022-11-03', '978-098765-43-30', 29),
('2022-08-20', '2022-10-05', '978-098765-43-31', 30),
('2022-07-02', '2022-08-15', '978-098765-43-32', 31),
('2022-05-15', '2022-07-01', '978-098765-43-33', 32),
('2022-07-01', '2022-07-20', '978-098765-43-22', 32),
('2022-07-25', '2022-09-01', '978-098765-43-23', 32),
('2022-09-15', '2022-11-02', '978-098765-43-24', 32),
('2022-05-02', '2022-06-05', '978-098765-43-34', 28),
('2022-06-15', '2022-08-25', '978-098765-43-35', 28),
('2022-07-20', '2022-09-12', '978-098765-43-36', 28),
('2022-03-06', '2022-05-20', '978-098765-43-37', 28);
