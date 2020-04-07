
CREATE PROCEDURE uspRestoreDB (@version int)
AS
IF @version <= (SELECT MAX(versiune) FROM Versiune)
BEGIN
	declare @comanda varchar(256);
	declare @versiuneCurenta int;
	set @versiuneCurenta = (SELECT Versiune.VersiuneCurenta FROM Versiune where versiune=0);
	print @versiuneCurenta
	while @version < @versiuneCurenta
		begin
			set @comanda= (select Versiune.ComandaSql from Versiune where versiune=@versiuneCurenta);
			exec(@comanda);
			delete from Versiune where versiune=(SELECT MAX(versiune) FROM Versiune);
			set @versiuneCurenta =@versiuneCurenta-1
		
		end
	while @version >= @versiuneCurenta
		begin
			set @comanda= (select Versiune.ComandaDo from Versiune where versiune=@versiuneCurenta);
			exec(@comanda);
			
			set @versiuneCurenta =@versiuneCurenta+1
		
		end
		update Versiune set VersiuneCurenta = @version where versiune=0
	
END
ELSE
	PRINT 'Versiune Inexistenta!'
GO
