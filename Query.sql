USE Wydawnictwo1;

--ZADANIA ROBERTA

--Podaj wszystkie tytu³y i ISBN wydañ dostêpne 
--w ksiêgarniach pod adresem Gdañsk, 
--ul. Narutowicza 17, wydane po 2010 roku.

SELECT Wydania.Tytul, Wydania.ISBN
FROM Wydania, Sprzeda¿, Ksiegarnie
WHERE Ksiegarnie.Miasto = 'Gdañsk'
	AND Ksiegarnie.Ulica = 'Narutowicza'
	AND Ksiegarnie.NumerDomu = 17
	AND Wydania.ISBN = Sprzeda¿.ISBN
	AND NazwaKsiegarni = Nazwa;

--Wypisz œredni¹ wysokoœæ i szerokoœæ ok³adek 
--dla wydañ z kosztem druku za sztukê poni¿ej 20 z³.

SELECT AVG(Rozmiar_x) AS SredniRozmiarX, AVG(Rozmiar_y) AS SredniRozmiarY
FROM Okladki, Wydania
WHERE KosztDrukuZaSztuke < 20
	AND Wydania.ID_okladki = Okladki.ID_okladki;

--Wypisz adresy mailowe autorów, którzy napisali 
--teksty po niemiecku o d³ugoœci wiêkszej ni¿ 30 
--arkuszy wydawniczych.
SELECT Email
FROM Autorzy, Teksty
WHERE Autorzy.ID_pracownika = Teksty.ID_autora 
	AND Jezyk = 'niemiecki'
	AND Dlugosc > 30


--ZADANIA KACPRA

--Wypisz ID ok³adki z najlepiej sprzedaj¹cych siê 
--wydañ dla ka¿dego grafika i podaj liczbê 
--sprzedanych kopii.
SELECT ID_grafika, Wydania.ID_okladki, Wydania.ISBN, LiczbaEgzemplarzy
INTO OkladkiGraficy
FROM Okladki, Wydania, Sprzeda¿
WHERE Wydania.ID_okladki = Okladki.ID_okladki
	AND Sprzeda¿.ISBN = Wydania.ISBN
ORDER BY ID_grafika;

SELECT ID_grafika, ID_okladki, SUM(LiczbaEgzemplarzy) AS LiczbaEgzemplarzy
FROM OkladkiGraficy
GROUP BY ID_grafika, ID_okladki
ORDER BY ID_grafika;

DROP TABLE OkladkiGraficy;


--Dla ka¿dego autora wypisz jego ID
--oraz wypisz ID redaktora, 
--który najczêœciej poprawia³ jego teksty
--(oraz ile razy je poprawia³).

SELECT ID_autora, ID_redaktora
INTO AutorzyRedaktorzy
FROM Wydania, Poprawianie
WHERE Wydania.ISBN = Poprawianie.ISBN;

SELECT ID_autora, ID_redaktora, COUNT(ID_redaktora)  AS "LiczbaPoprawionych"
INTO AutorzyRedaktorzyLiczbaPoprawionych
FROM AutorzyRedaktorzy
GROUP BY ID_autora, ID_redaktora
ORDER BY ID_autora;

SELECT ID_autora, ID_redaktora, LiczbaPoprawionych
FROM AutorzyRedaktorzyLiczbaPoprawionych ARL1
WHERE LiczbaPoprawionych =
	(SELECT MAX(ARL2.LiczbaPoprawionych) 
	FROM AutorzyRedaktorzyLiczbaPoprawionych ARL2
	WHERE ARL1.ID_autora = ARL2.ID_autora )
ORDER BY ID_autora;

DROP TABLE AutorzyRedaktorzy;
DROP TABLE AutorzyRedaktorzyLiczbaPoprawionych;


--Wypisz ID wszystkich autorów, których suma 
--sprzeda¿y wydañ o tekstach z gatunku fantasy 
--by³a wiêksza od 300, ale mniejsza od 500.

SELECT Wydania.ID_autora, TytulTekstu, LiczbaEgzemplarzy
INTO WydaniaSprzedaz
FROM Wydania, Sprzeda¿, Teksty
WHERE Wydania.ISBN = Sprzeda¿.ISBN
	AND Teksty.ID_autora = Wydania.ID_autora
	AND Teksty.Tytul = Wydania.TytulTekstu
	AND Gatunek='Fantasy';

SELECT ID_autora, SUM(LiczbaEgzemplarzy) AS LiczbaEgzemplarzy
INTO SumaSprzedazy
FROM WydaniaSprzedaz
GROUP BY ID_autora
ORDER BY SUM(LiczbaEgzemplarzy) DESC;

SELECT ID_autora
FROM SumaSprzedazy
WHERE LiczbaEgzemplarzy > 300 AND LiczbaEgzemplarzy < 500;

DROP TABLE WydaniaSprzedaz;
DROP TABLE SumaSprzedazy;


--ZADANIA MOJE

--Wydania na podstawie którego tekstu sprzeda³y
--siê najlepiej w Ksiêgarni PG?

--Wszystkie teksty sprzedane Ksiêgarni PG
SELECT ID, TytulTekstu, LiczbaEgzemplarzy
INTO ID_Teksty
FROM Osoby, Teksty, Wydania, Sprzeda¿
WHERE Osoby.ID = Teksty.ID_autora
	AND Wydania.TytulTekstu = Teksty.Tytul
	AND Sprzeda¿.ISBN = Wydania.ISBN
	AND Sprzeda¿.NazwaKsiegarni = 'Ksiegarnia PG';

--Tekst z najwiêksz¹ liczb¹ sprzedanych kopii
SELECT TOP 1 ID, TytulTekstu, LiczbaEgzemplarzy
INTO Teksty_Egzemplarze
FROM ID_Teksty IT1
WHERE LiczbaEgzemplarzy =
	(SELECT MAX(IT2.LiczbaEgzemplarzy) 
	FROM ID_Teksty IT2
	WHERE IT1.ID = IT2.ID )
ORDER BY LiczbaEgzemplarzy DESC;

--Imiê i nazwisko zamiast ID
SELECT Imie, Nazwisko, LiczbaEgzemplarzy
FROM Teksty_Egzemplarze, Osoby
WHERE Teksty_Egzemplarze.ID = Osoby.ID

DROP TABLE Teksty_Egzemplarze
DROP TABLE ID_Teksty;



--Wypisz emaile autorów, którzy przys³ali
--do redakcji w 2022 roku teksty, na
--podstawie których nie powsta³o ¿adne
--wydanie (oraz tytu³y tych tekstów).

--najpierw autorzy, którzy maj¹ wydania z tego roku
SELECT Email, TytulTekstu
INTO AutorzyWydania
FROM Autorzy, Teksty, Wydania
WHERE Autorzy.ID_pracownika = Teksty.ID_autora
	AND Autorzy.ID_pracownika = Wydania.ID_autora
	AND Teksty.Tytul = Wydania.Tytul
	AND YEAR(DataPrzyjecia) = 2022
GROUP BY Email, TytulTekstu;

--teraz autorzy, którzy przys³ali teksty
SELECT Email, Tytul
INTO AutorzyTeksty
FROM Autorzy, Teksty
WHERE Autorzy.ID_pracownika = Teksty.ID_autora
	AND YEAR(DataPrzyjecia) = 2022
GROUP BY Email, Tytul;

SELECT Email, Tytul
FROM AutorzyTeksty
WHERE Tytul NOT IN (
	SELECT TytulTekstu FROM AutorzyWydania);

DROP TABLE AutorzyWydania;
DROP TABLE AutorzyTeksty;

