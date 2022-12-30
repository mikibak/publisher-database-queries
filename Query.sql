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
