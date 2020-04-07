CREATE PROCEDURE uspCreareManopere 
	
AS
IF NOT EXISTS(SELECT * FROM sys.tables
WHERE name='Manopere')
BEGIN
	CREATE TABLE Manopere(
	ManoperaID int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nume varchar(50),
	Dificultate varchar(20),
	Durata int
	)
	declare @vers int;
	set @vers =(SELECT MAX(versiune) 
	FROM Versiune);
	
	insert into Versiune(versiune,ComandaSql)
	values (@vers+1,'uspStergeManopere;');
	update Versiune set VersiuneCurenta = @vers+1 where versiune=0
	update Versiune set VersiuneCurenta = @vers+1 where versiune=0
	print 'Tabela creata!'
END
ELSE
-- sa mearga in ambele parti si undo si redo 
	PRINT 'Exista Tabela'

GO
