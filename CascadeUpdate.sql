USE Wydawnictwo1;

DELETE FROM Osoby where ID = 27;


SELECT TOP (1000) [ID_pracownika]
      ,[Specjalizacja]
  FROM [Wydawnictwo1].[dbo].[Redaktorzy]

SELECT TOP (1000) [DataRozpoczeciaPrac]
      ,[DataZakonczeniaPrac]
      ,[ISBN]
      ,[ID_redaktora]
  FROM [Wydawnictwo1].[dbo].[Poprawianie]

SELECT TOP (1000) [ID]
      ,[Imie]
      ,[Nazwisko]
  FROM [Wydawnictwo1].[dbo].[Osoby]

--dodanie z powrotem redaktora 27
SET IDENTITY_INSERT [Wydawnictwo1].[dbo].[Osoby] ON
	DECLARE @MY_ID integer = 27;
	INSERT INTO Osoby(ID, Imie, Nazwisko) VALUES (@MY_ID, 'Dominika', 'Iwañska');
	INSERT INTO Redaktorzy(ID_pracownika, Specjalizacja) VALUES (@MY_ID, 'Rysunek');
	INSERT INTO Poprawianie(DataRozpoczeciaPrac, DataZakonczeniaPrac, ISBN, ID_redaktora) VALUES
	('2022-06-19', '2022-09-10', '978-098765-43-28', 27);
SET IDENTITY_INSERT [Wydawnictwo1].[dbo].[Osoby] OFF


--cascade update
UPDATE Wydania
SET ISBN = '978-098765-43-00'
WHERE ISBN = '978-098765-43-20'; 

SELECT TOP (1000) [ISBN]
      ,[Tytul]
      ,[TytulTekstu]
      ,[ID_autora]
      ,[ID_okladki]
      ,[NumerWydania]
      ,[KosztRedakcji]
      ,[KosztDrukuZaSztuke]
      ,[Dlugosc]
      ,[DataWydania]
      ,[KolorOkladki]
  FROM [Wydawnictwo1].[dbo].[Wydania]

SELECT TOP (1000) [ID_sprzedazy]
      ,[ISBN]
      ,[NazwaKsiegarni]
      ,[DataTransakcji]
      ,[LiczbaEgzemplarzy]
      ,[CenaZaEgzemplarz]
      ,[CzyElektroniczne]
  FROM [Wydawnictwo1].[dbo].[Sprzeda¿]

SELECT TOP (1000) [DataRozpoczeciaPrac]
      ,[DataZakonczeniaPrac]
      ,[ISBN]
      ,[ID_redaktora]
  FROM [Wydawnictwo1].[dbo].[Poprawianie]