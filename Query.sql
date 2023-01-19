USE Wydawnictwo1;

--ZADANIA ROBERTA

--Podaj wszystkie tytu�y i ISBN wyda� dost�pne 
--w ksi�garniach pod adresem Gda�sk, 
--ul. Narutowicza 17, wydane po 2010 roku.

--	SELECT Wydania.Tytul, Wydania.ISBN, Wydania.DataWydania
--	FROM Wydania, Sprzeda�, Ksiegarnie
--	WHERE Ksiegarnie.Miasto = 'Gda�sk'
--		AND Ksiegarnie.Ulica = 'Narutowicza'
--		AND Ksiegarnie.NumerDomu = 17
--		AND Wydania.ISBN = Sprzeda�.ISBN
--		AND NazwaKsiegarni = Nazwa
--		AND YEAR(DataWydania) >= 2010;

	GO  
	CREATE VIEW WydaniaSprzeda�
	AS  
	SELECT Wydania.Tytul, Wydania.ISBN, Wydania.DataWydania, Sprzeda�.NazwaKsiegarni
	FROM Wydania INNER JOIN Sprzeda�
	ON Wydania.ISBN = Sprzeda�.ISBN
		AND YEAR(DataWydania) >= 2010;
	GO  

	SELECT WydaniaSprzeda�.Tytul, WydaniaSprzeda�.ISBN, WydaniaSprzeda�.DataWydania
	FROM WydaniaSprzeda� JOIN Ksiegarnie
	ON Ksiegarnie.Miasto = 'Gda�sk'
		AND Ksiegarnie.Ulica = 'Narutowicza'
		AND Ksiegarnie.NumerDomu = 17
		AND NazwaKsiegarni = Nazwa

	DROP VIEW WydaniaSprzeda�

--Wypisz �redni� wysoko�� i szeroko�� ok�adek 
--dla wyda� z kosztem druku za sztuk� poni�ej 20 z�.

	SELECT AVG(Rozmiar_x) AS SredniRozmiarX, AVG(Rozmiar_y) AS SredniRozmiarY
	FROM Okladki INNER JOIN Wydania 
		ON Wydania.ID_okladki = Okladki.ID_okladki
		AND KosztDrukuZaSztuke < 20;


--Wypisz adresy mailowe autor�w, kt�rzy napisali 
--teksty po niemiecku o d�ugo�ci wi�kszej ni� 30 
--arkuszy wydawniczych.
	SELECT Email
	FROM Autorzy INNER JOIN Teksty ON
	Autorzy.ID_pracownika = Teksty.ID_autora 
		AND Jezyk = 'niemiecki'
		AND Dlugosc > 30


--ZADANIA KACPRA

--Wypisz ID ok�adki z najlepiej sprzedaj�cych si� 
--wyda� dla ka�dego grafika i podaj liczb� 
--sprzedanych kopii.


	GO  
	CREATE VIEW OkladkiGraficy
	AS  
	SELECT ID_grafika, Wydania.ID_okladki, Wydania.ISBN
	FROM Okladki INNER JOIN Wydania
	ON Wydania.ID_okladki = Okladki.ID_okladki
	GO  

	SELECT ID_grafika, ID_okladki, SUM(LiczbaEgzemplarzy) AS LiczbaEgzemplarzy
	FROM OkladkiGraficy INNER JOIN Sprzeda�
	ON Sprzeda�.ISBN = OkladkiGraficy.ISBN
	GROUP BY ID_grafika, ID_okladki
	ORDER BY ID_grafika;

	DROP VIEW OkladkiGraficy;

	-- podzapytanie lub widok, u�ywa� join zamiast where


--Dla ka�dego autora wypisz jego ID
--oraz wypisz ID redaktora, 
--kt�ry najcz�ciej poprawia� jego teksty
--(oraz ile razy je poprawia�).

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


--Wypisz ID wszystkich autor�w, kt�rych suma 
--sprzeda�y wyda� o tekstach z gatunku fantasy 
--by�a wi�ksza od 300, ale mniejsza od 500.

/*
	SELECT Wydania.ID_autora, TytulTekstu, LiczbaEgzemplarzy
	INTO WydaniaSprzedaz
	FROM Wydania, Sprzeda�, Teksty
	WHERE Wydania.ISBN = Sprzeda�.ISBN
		AND Teksty.ID_autora = Wydania.ID_autora
		AND Teksty.Tytul = Wydania.TytulTekstu
		AND Gatunek='Fantasy';

	--SELECT * FROM WydaniaSprzedaz

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
*/

	GO  
	CREATE VIEW WydaniaSprzedaz
	AS  
		SELECT Sprzeda�Wydania.ID_autora, TytulTekstu, LiczbaEgzemplarzy
		FROM Teksty INNER JOIN 
			(SELECT Wydania.ID_autora, TytulTekstu, LiczbaEgzemplarzy
				FROM Sprzeda� INNER JOIN Wydania
				ON Wydania.ISBN = Sprzeda�.ISBN) AS Sprzeda�Wydania
		ON Teksty.Tytul = Sprzeda�Wydania.TytulTekstu
		AND Gatunek='Fantasy'
		AND Teksty.ID_autora = Sprzeda�Wydania.ID_autora;
	GO  

	--SELECT * FROM WydaniaSprzedaz

	SELECT ID_autora
	FROM ( 
		SELECT ID_autora, SUM(LiczbaEgzemplarzy) AS LiczbaEgzemplarzy
		FROM WydaniaSprzedaz
		GROUP BY ID_autora
		) AS SumaSprzedazy
	WHERE LiczbaEgzemplarzy > 300 AND LiczbaEgzemplarzy < 500
	--ORDER BY SUM(LiczbaEgzemplarzy) DESC;

	DROP VIEW WydaniaSprzedaz

--ZADANIA MOJE

--Wydania na podstawie kt�rego tekstu sprzeda�y
--si� najlepiej w Ksi�garni PG? Ile egzemplarzy sprzedano

/*
	--Wszystkie teksty sprzedane Ksi�garni PG
	SELECT ID, Imie, Nazwisko, TytulTekstu, LiczbaEgzemplarzy
	INTO ID_Teksty
	FROM Osoby, Teksty, Wydania, Sprzeda�
	WHERE Osoby.ID = Teksty.ID_autora
		AND Wydania.TytulTekstu = Teksty.Tytul
		AND Sprzeda�.ISBN = Wydania.ISBN
		AND Sprzeda�.NazwaKsiegarni = 'Ksiegarnia PG';

	--Tekst z najwi�ksz� liczb� sprzedanych kopii
	SELECT TOP 1 ID, Imie, Nazwisko, TytulTekstu, LiczbaEgzemplarzy
	INTO Teksty_Egzemplarze
	FROM ID_Teksty IT1
	WHERE LiczbaEgzemplarzy =
		(SELECT MAX(IT2.LiczbaEgzemplarzy) 
		FROM ID_Teksty IT2
		WHERE IT1.ID = IT2.ID )
	ORDER BY LiczbaEgzemplarzy DESC;

	--Imi� i nazwisko zamiast ID
	SELECT Osoby.Imie, Osoby.Nazwisko, LiczbaEgzemplarzy
	FROM Teksty_Egzemplarze, Osoby
	WHERE Teksty_Egzemplarze.ID = Osoby.ID

	DROP TABLE Teksty_Egzemplarze
	DROP TABLE ID_Teksty;
*/

	GO  
	CREATE VIEW ID_Teksty
	AS  
		SELECT  ID, Imie, Nazwisko, TytulTekstu, LiczbaEgzemplarzy
		FROM 
			(SELECT ID, Imie, Nazwisko, Tytul
			FROM Osoby INNER JOIN Teksty
			ON Osoby.ID = Teksty.ID_autora
			)
		AS OsobyTeksty INNER JOIN 
			(SELECT TytulTekstu, LiczbaEgzemplarzy
			FROM Wydania INNER JOIN Sprzeda�
			ON  Sprzeda�.ISBN = Wydania.ISBN
			AND Sprzeda�.NazwaKsiegarni = 'Ksiegarnia PG'
			)
		AS WydaniaSprzeda�
		ON WydaniaSprzeda�.TytulTekstu = OsobyTeksty.Tytul
	GO  

	SELECT TOP 1 ID, Imie, Nazwisko, TytulTekstu, LiczbaEgzemplarzy
	FROM ID_Teksty IT1
	WHERE LiczbaEgzemplarzy =
		(SELECT MAX(IT2.LiczbaEgzemplarzy) 
		FROM ID_Teksty IT2
		WHERE IT1.ID = IT2.ID )
	ORDER BY LiczbaEgzemplarzy DESC;

	DROP VIEW ID_Teksty

--Wypisz emaile autor�w, kt�rzy przys�ali
--do redakcji w 2022 roku teksty, na
--podstawie kt�rych nie powsta�o �adne
--wydanie (oraz tytu�y tych tekst�w).


	--najpierw autorzy, kt�rzy maj� wydania z tego roku
	--SELECT Email, TytulTekstu
	--INTO AutorzyWydania
	--FROM Autorzy, Teksty, Wydania
	--WHERE Autorzy.ID_pracownika = Teksty.ID_autora
	--	AND Autorzy.ID_pracownika = Wydania.ID_autora
	--	AND Teksty.Tytul = Wydania.Tytul
	--	AND YEAR(DataPrzyjecia) = 2022
	--GROUP BY Email, TytulTekstu;

	--teraz autorzy, kt�rzy przys�ali teksty
	--SELECT Email, Tytul
	--INTO AutorzyTeksty
	--FROM Autorzy, Teksty
	--WHERE Autorzy.ID_pracownika = Teksty.ID_autora
	--	AND YEAR(DataPrzyjecia) = 2022
	--GROUP BY Email, Tytul;

	--SELECT Email, Tytul
	--FROM AutorzyTeksty
	--WHERE Tytul NOT IN (
	--	SELECT TytulTekstu FROM AutorzyWydania);

	--DROP TABLE AutorzyWydania;
	--DROP TABLE AutorzyTeksty;

	SELECT Email, Tytul 
	FROM (
		SELECT T.ID_autora, T.Tytul
		FROM Teksty T LEFT JOIN Wydania W
		ON T.Tytul = W.TytulTekstu
		WHERE W.TytulTekstu IS NULL
			AND YEAR(T.DataPrzyjecia) = 2022)
	AS TekstyWydania 
	INNER JOIN Autorzy
	ON TekstyWydania.ID_autora = Autorzy.ID_pracownika
		


--Wypisz redaktor�w, kt�rzy poprawiali teksty 
--spoza swojej specjalizacji (wraz z ich 
--specjalizacj� i gatunkami tych tekst�w)


	/*
	SELECT ID_pracownika, Specjalizacja, Gatunek
	FROM Redaktorzy, Poprawianie, Wydania, Teksty
	WHERE ID_pracownika = ID_redaktora
		AND Poprawianie.ISBN = Wydania.ISBN
		AND Wydania.TytulTekstu = Teksty.Tytul
		AND Redaktorzy.Specjalizacja != Teksty.Gatunek
	GROUP BY ID_pracownika, Specjalizacja, Gatunek
	ORDER BY ID_pracownika;
	*/

	SELECT ID_pracownika, Specjalizacja, Gatunek
	FROM 
		(SELECT ISBN, ID_pracownika, Specjalizacja
		FROM Redaktorzy INNER JOIN Poprawianie
		ON ID_pracownika = ID_redaktora
		)
	AS RedaktorzyPoprawianie INNER JOIN 
		(SELECT ISBN, Gatunek
		FROM Wydania INNER JOIN Teksty
		ON Wydania.TytulTekstu = Teksty.Tytul
		) AS WydaniaTeksty
	ON Specjalizacja != Gatunek
	AND RedaktorzyPoprawianie.ISBN = WydaniaTeksty.ISBN
	GROUP BY ID_pracownika, Specjalizacja, Gatunek
	ORDER BY ID_pracownika;
