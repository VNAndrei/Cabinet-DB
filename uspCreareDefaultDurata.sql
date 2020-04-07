
CREATE PROCEDURE uspCreareDefaultDurata
	
AS

IF  EXISTS
(
SELECT * FROM sys.tables
WHERE name='Manopere'
)
IF NOT EXISTS
(
SELECT * FROM SYS.OBJECTS 
WHERE TYPE_DESC =  'DEFAULT_CONSTRAINT' 
AND NAME = 'durata_default'
)

BEGIN
	alter table Manopere
	add constraint durata_default
	default 1 for Durata;
	declare @vers int;

	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspStergeDefaultDurata;');
	print 'Constrangere adaugata!'
END
ELSE
    PRINT 'Constrangerea exista'
ELSE
	PRINT 'Tabela Manopere nu exista'
GO

