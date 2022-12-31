USE Wydawnictwo;

--Dla ka�dego autora wypisz jego ID
--oraz wypisz ID redaktora, 
--kt�ry najcz�ciej poprawia� jego teksty
--(oraz ile razy je poprawia�)

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



--Wypisz ID wszystkich autor�w, kt�rych suma 
--sprzeda�y wyda� o tekstach z gatunku fantasy 
--by�a wi�ksza od 300, ale mniejsza od 500

SELECT Wydania.ID_autora, TytulTekstu, LiczbaEgzemplarzy
INTO WydaniaSprzedaz
FROM Wydania, Sprzeda�, Teksty
WHERE Wydania.ISBN = Sprzeda�.ISBN
	AND Teksty.ID_autora = Wydania.ID_autora
	AND Teksty.Tytul = Wydania.TytulTekstu
	AND Gatunek='Fantasy';

SELECT ID_autora, SUM(LiczbaEgzemplarzy) AS LiczbaEgzemplarzy
INTO SumaSprzedazy
FROM WydaniaSprzedaz
GROUP BY ID_autora
ORDER BY SUM(LiczbaEgzemplarzy) DESC;

--SELECT Imie, Nazwisko--FROM SumaSprzedazy, Osoby--WHERE ID = ID_autora AND LiczbaEgzemplarzy > 300 AND LiczbaEgzemplarzy < 500;

SELECT ID_autora
FROM SumaSprzedazy
WHERE LiczbaEgzemplarzy > 300 AND LiczbaEgzemplarzy < 500;

DROP TABLE WydaniaSprzedaz;
DROP TABLE SumaSprzedazy;


--Wypisz ID ok�adki z najlepiej sprzedaj�cych si� 
--ksi��ek dla ka�dego grafika i podaj liczb� 
--sprzedanych kopii.
SELECT ID_grafika, Wydania.ID_okladki, Wydania.ISBN, LiczbaEgzemplarzy
INTO OkladkiGraficy
FROM Okladki, Wydania, Sprzeda�
WHERE Wydania.ID_okladki = Okladki.ID_okladki
	AND Sprzeda�.ISBN = Wydania.ISBN
ORDER BY ID_grafika;

SELECT ID_grafika, ID_okladki, SUM(LiczbaEgzemplarzy) AS LiczbaEgzemplarzy
FROM OkladkiGraficy
GROUP BY ID_grafika, ID_okladki
ORDER BY ID_grafika;

DROP TABLE OkladkiGraficy;


--ZADANIA ROBERTA

--Podaj wszystkie tytu�y i ISBN wyda� dost�pne 
--w ksi�garniach pod adresem Gda�sk, 
--ul. Narutowicza 17, wydane po 2010 roku

SELECT Wydania.Tytul, Wydania.ISBN
FROM Wydania, Sprzeda�, Ksiegarnie
WHERE Ksiegarnie.Miasto = 'Gda�sk'
	AND Ksiegarnie.Ulica = 'Narutowicza'
	AND Ksiegarnie.NumerDomu = 17
	AND Wydania.ISBN = Sprzeda�.ISBN
	AND NazwaKsiegarni = Nazwa;

--Wypisz �redni� wysoko�� i szeroko�� ok�adek 
--dla wyda� z kosztem druku za sztuk� poni�ej 20 z�

SELECT AVG(Rozmiar_x), AVG(Rozmiar_y)
FROM Okladki, Wydania
WHERE KosztDrukuZaSztuke < 20
	AND Wydania.ID_okladki = Okladki.ID_okladki;