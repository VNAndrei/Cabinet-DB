CREATE PROCEDURE uspStergeCheieStrainaManoperaID
	
AS

IF  EXISTS(
SELECT * FROM sys.tables
WHERE name='Manopere'
)

IF EXISTS 
(
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE table_name = 'Programare'
    AND column_name = 'ManoperaID'
)

IF EXISTS 
(
	SELECT * 
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME='fk_MaoperaID'
)

BEGIN
	alter table Programare
	drop constraint fk_ManoperaID;
	declare @vers int;

	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspAdaugaCheieStrainaManoperaID;');
	print 'Cheie stearsa!'
END

ELSE
	PRINT 'cheia nu exista'
ELSE
    PRINT 'Coloana ManoperaID nu exista in tabelul Programare'
ELSE
	PRINT 'Tabela Manopere nu exista'
GO
