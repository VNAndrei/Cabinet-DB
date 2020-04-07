CREATE PROCEDURE uspModificareDurataTtoI
	
AS

IF  EXISTS
(
SELECT * FROM sys.tables
WHERE name='Manopere'
)

BEGIN
	alter table Manopere
	alter column Durata int;
	declare @vers int;

	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspModificareDurataItoT;');
	print 'Modificare efectuata!'
END
ELSE
	PRINT 'Tabela Manopere nu exista'
GO
