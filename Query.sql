USE Wydawnictwo;

--Dla ka¿dego autora wypisz jego ID
--oraz wypisz ID redaktora, 
--który najczêœciej poprawia³ jego teksty
--(oraz ile razy je poprawia³)

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
--by³a wiêksza od 300, ale mniejsza od 500

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

--SELECT Imie, Nazwisko--FROM SumaSprzedazy, Osoby--WHERE ID = ID_autora AND LiczbaEgzemplarzy > 300 AND LiczbaEgzemplarzy < 500;

SELECT ID_autora
FROM SumaSprzedazy
WHERE LiczbaEgzemplarzy > 300 AND LiczbaEgzemplarzy < 500;

DROP TABLE WydaniaSprzedaz;
DROP TABLE SumaSprzedazy;


--Wypisz ID ok³adki z najlepiej sprzedaj¹cych siê 
--ksi¹¿ek dla ka¿dego grafika i podaj liczbê 
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


--ZADANIA ROBERTA

--Podaj wszystkie tytu³y i ISBN wydañ dostêpne 
--w ksiêgarniach pod adresem Gdañsk, 
--ul. Narutowicza 17, wydane po 2010 roku

SELECT Wydania.Tytul, Wydania.ISBN
FROM Wydania, Sprzeda¿, Ksiegarnie
WHERE Ksiegarnie.Miasto = 'Gdañsk'
	AND Ksiegarnie.Ulica = 'Narutowicza'
	AND Ksiegarnie.NumerDomu = 17
	AND Wydania.ISBN = Sprzeda¿.ISBN
	AND NazwaKsiegarni = Nazwa;

--Wypisz œredni¹ wysokoœæ i szerokoœæ ok³adek 
--dla wydañ z kosztem druku za sztukê poni¿ej 20 z³

SELECT AVG(Rozmiar_x), AVG(Rozmiar_y)
FROM Okladki, Wydania
WHERE KosztDrukuZaSztuke < 20
	AND Wydania.ID_okladki = Okladki.ID_okladki;