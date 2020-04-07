CREATE PROCEDURE uspStergeManoperaID
AS

IF EXISTS 
(
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE table_name = 'Programare'
    AND column_name = 'ManoperaID'
)
  
BEGIN
	alter table Programare
	drop column ManoperaID;

	declare @vers int;
	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspAdaugaManoperaID;');
END
ELSE
    PRINT 'Coloana ManoperaID nu exista in tabelul Programare'
GO
