CREATE PROCEDURE uspStergeDefaultDurata
	
AS

IF  EXISTS
(
SELECT * FROM sys.tables
WHERE name='Manopere'
)
IF EXISTS
(
SELECT * FROM SYS.OBJECTS 
WHERE TYPE_DESC =  'DEFAULT_CONSTRAINT' 
AND NAME = 'durata_default'
)

BEGIN
	alter table Manopere
	drop constraint durata_default;
	declare @vers int;
	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspCreareDefaultDurata;');
	print 'Constrangere stearsa!'
END

ELSE
    PRINT 'Constrangerea nu exista'
ELSE
PRINT 'Tabela Manopere nu exista'
GO
