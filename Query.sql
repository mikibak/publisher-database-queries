USE Wydawnictwo1;

--ZADANIA ROBERTA

--Podaj wszystkie tytu³y i ISBN wydañ dostêpne 
--w ksiêgarniach pod adresem Gdañsk, 
--ul. Narutowicza 17, wydane po 2010 roku.

	SELECT Wydania.Tytul, Wydania.ISBN, Wydania.DataWydania
	FROM Wydania, Sprzeda¿, Ksiegarnie
	WHERE Ksiegarnie.Miasto = 'Gdañsk'
		AND Ksiegarnie.Ulica = 'Narutowicza'
		AND Ksiegarnie.NumerDomu = 17
		AND Wydania.ISBN = Sprzeda¿.ISBN
		AND NazwaKsiegarni = Nazwa
		AND YEAR(DataWydania) >= 2010;

--Wypisz œredni¹ wysokoœæ i szerokoœæ ok³adek 
--dla wydañ z kosztem druku za sztukê poni¿ej 20 z³.

	SELECT AVG(Rozmiar_x) AS SredniRozmiarX, AVG(Rozmiar_y) AS SredniRozmiarY
	FROM Okladki INNER JOIN Wydania 
		ON Wydania.ID_okladki = Okladki.ID_okladki
		AND KosztDrukuZaSztuke < 20;


--Wypisz adresy mailowe autorów, którzy napisali 
--teksty po niemiecku o d³ugoœci wiêkszej ni¿ 30 
--arkuszy wydawniczych.
	SELECT Email
	FROM Autorzy INNER JOIN Teksty ON
	Autorzy.ID_pracownika = Teksty.ID_autora 
		AND Jezyk = 'niemiecki'
		AND Dlugosc > 30


--ZADANIA KACPRA

--Wypisz ID ok³adki z najlepiej sprzedaj¹cych siê 
--wydañ dla ka¿dego grafika i podaj liczbê 
--sprzedanych kopii.


	GO  
	CREATE VIEW OkladkiGraficy
	AS  
	SELECT ID_grafika, Wydania.ID_okladki, Wydania.ISBN
	FROM Okladki INNER JOIN Wydania
	ON Wydania.ID_okladki = Okladki.ID_okladki
	GO  

	SELECT ID_grafika, ID_okladki, SUM(LiczbaEgzemplarzy) AS LiczbaEgzemplarzy
	FROM OkladkiGraficy INNER JOIN Sprzeda¿
	ON Sprzeda¿.ISBN = OkladkiGraficy.ISBN
	GROUP BY ID_grafika, ID_okladki
	ORDER BY ID_grafika;

	DROP VIEW OkladkiGraficy;

	-- podzapytanie lub widok, u¿ywaæ join zamiast where


--Dla ka¿dego autora wypisz jego ID
--oraz wypisz ID redaktora, 
--który najczêœciej poprawia³ jego teksty
--(oraz ile razy je poprawia³).

	GO  
	CREATE VIEW AutorzyRedaktorzy
	AS  
	SELECT ID_autora, ID_redaktora
	FROM Wydania, Poprawianie
	WHERE Wydania.ISBN = Poprawianie.ISBN; 
	GO  

	GO  
	CREATE VIEW AutorzyRedaktorzyLiczbaPoprawionych
	AS  
	SELECT ID_autora, ID_redaktora, COUNT(ID_redaktora)  AS "LiczbaPoprawionych"
	FROM AutorzyRedaktorzy
	GROUP BY ID_autora, ID_redaktora
	GO  

	--select * from AutorzyRedaktorzyLiczbaPoprawionych

	SELECT ID_autora, ID_redaktora, LiczbaPoprawionych
	FROM AutorzyRedaktorzyLiczbaPoprawionych ARL1
	WHERE LiczbaPoprawionych =
		(SELECT MAX(ARL2.LiczbaPoprawionych) 
		FROM AutorzyRedaktorzyLiczbaPoprawionych ARL2
		WHERE ARL1.ID_autora = ARL2.ID_autora )
	ORDER BY ID_autora;

	DROP VIEW AutorzyRedaktorzy;
	DROP VIEW AutorzyRedaktorzyLiczbaPoprawionych;


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
	SELECT ID, Imie, Nazwisko, TytulTekstu, LiczbaEgzemplarzy
	INTO ID_Teksty
	FROM Osoby, Teksty, Wydania, Sprzeda¿
	WHERE Osoby.ID = Teksty.ID_autora
		AND Wydania.TytulTekstu = Teksty.Tytul
		AND Sprzeda¿.ISBN = Wydania.ISBN
		AND Sprzeda¿.NazwaKsiegarni = 'Ksiegarnia PG';

	--Tekst z najwiêksz¹ liczb¹ sprzedanych kopii
	SELECT TOP 1 ID, Imie, Nazwisko, TytulTekstu, LiczbaEgzemplarzy
	--INTO Teksty_Egzemplarze
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


--Wypisz redaktorów, którzy poprawiali teksty 
--spoza swojej specjalizacji (wraz z ich 
--specjalizacj¹ i gatunkami tych tekstów)

	SELECT ID_pracownika, Specjalizacja, Gatunek
	FROM Redaktorzy, Poprawianie, Wydania, Teksty
	WHERE ID_pracownika = ID_redaktora
		AND Poprawianie.ISBN = Wydania.ISBN
		AND Wydania.TytulTekstu = Teksty.Tytul
		AND Redaktorzy.Specjalizacja != Teksty.Gatunek
	GROUP BY ID_pracownika, Specjalizacja, Gatunek
	ORDER BY ID_pracownika;
