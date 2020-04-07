create procedure updAddCabinet
    @Nume varchar(50),
    @NumarTelefon varchar(10)
AS
BEGIN
 
        IF(dbo.ufValidareString(@Nume)=1)
        begin
            IF(dbo.ufValidareTelefon(@NumarTelefon)=1)
            begin
                      
                        insert into Cabinet(Nume,NumarTelefon) Values (@Nume,@NumarTelefon)

            end
            else
                print ('NumarTelefon invalid!')
    end
    else print ('Numele cabinetului este invalid!')
end
go
 

alter procedure updDeleteCabinet
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdCabinet(@id)=1)
        begin
		delete from Buget where CabinetID=@id
          delete from Material where CabientID= @id;
			delete from Cabinet where CabinetID= @id;
          
    end
    else print ('Id invalid!')
end
go

create procedure updUpdateCabinet
	@id int,
    @Nume varchar(50),
    @NumarTelefon varchar(10)

AS
BEGIN
 
        IF(dbo.ufValidareString(@Nume)=1)
        begin
            IF(dbo.ufValidareTelefon(@NumarTelefon)=1)
            begin
				IF(dbo.ufValidareIdCabinet(@id)=1)
				begin
                      
                        update Cabinet set Nume = @Nume
                        where CabinetID=@id;
						update Cabinet set NumarTelefon = @NumarTelefon
                        where CabinetID=@id;
				end
				else
					print ('Id invalid!')
            end
            else
                print ('NumarTelefon invalid!')
    end
    else print ('Numele cabinetului este invalid!')
end
go

create procedure updFindCabinet
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdCabinet(@id)=1)
        begin
				
          select * from Cabinet where CabinetID= @id;
 
          
    end
    else print ('Id invalid!')
end
go