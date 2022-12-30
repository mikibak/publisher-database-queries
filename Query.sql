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

--Wypisz wszystkich autorów, których suma 
--sprzeda¿y wydañ o tekstach z gatunku fantasy 
--by³a wiêksza od 300, ale mniejsza od 500

