CREATE PROCEDURE uspModificareDurataItoT
	
AS
IF  EXISTS(SELECT * FROM sys.tables
WHERE name='Manopere')
BEGIN
	alter table Manopere
	alter column Durata tinyint;
	declare @vers int;

	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspModificareDurataTtoI;');
	print 'Modificare efectuata!'

END
ELSE
PRINT 'Tabela Manopere nu exista'
GO
