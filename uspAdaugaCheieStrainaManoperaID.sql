CREATE PROCEDURE uspAdaugaCheieStrainaManoperaID
	
AS

IF  EXISTS
(
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

IF NOT EXISTS 
(
	SELECT * 
    FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS 
    WHERE CONSTRAINT_NAME='fk_MaoperaID'
)
  
 
BEGIN
	alter table Programare
	add constraint fk_ManoperaID foreign key (ManoperaID) references Manopere(ManoperaID);
	declare @vers int;

	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspStergeCheieStrainaManoperaID;');
	print 'Cheie adaugata!'
END
ELSE
	PRINT 'cheia exista'
ELSE
    PRINT 'Coloana ManoperaID nu exista in tabelul Programare'
ELSE
	PRINT 'Tabela Manopere nu exista'
GO