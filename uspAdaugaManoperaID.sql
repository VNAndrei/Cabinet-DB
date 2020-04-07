CREATE PROCEDURE uspAdaugaManoperaID
AS
IF NOT EXISTS 
(
    SELECT * 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE table_name = 'Programare'
    AND column_name = 'ManoperaID'
)
BEGIN
	alter table Programare
	add ManoperaID int;
	declare @vers int;
	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspStergeManoperaId;');
END
ELSE
    PRINT 'Coloana ManoperaID exista in tabelul Programare'
GO
