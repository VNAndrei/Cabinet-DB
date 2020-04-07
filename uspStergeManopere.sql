CREATE PROCEDURE uspStergeManopere
	
AS

IF EXISTS
(
SELECT * FROM sys.tables
WHERE name='Manopere'
)
  
BEGIN
	drop table Manopere;

	declare @vers int;
	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspCreareManopere;');
	print 'Tabela stearsa!'
END

ELSE
PRINT 'Tabela Manopere nu exista'
GO
