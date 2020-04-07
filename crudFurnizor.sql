create procedure updAddFurnizor
    @Nume varchar(50),
    @NumarTelefon varchar(10)
AS
BEGIN
 
        IF(dbo.ufValidareString(@Nume)=1)
        begin
            IF(dbo.ufValidareTelefon(@NumarTelefon)=1)
            begin
                      
                        insert into Furnizor(Nume,NumarTelefon) Values (@Nume,@NumarTelefon)

            end
            else
                print ('NumarTelefon invalid!')
    end
    else print ('Numele persoanei este invalid!')
end
go
 

 alter procedure updDeleteFurnizor
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdFurnizor(@id)=1)
        begin
		delete from Material where FurnizorID= @id;
          delete from Furnizor where FurnizorID= @id;
 
          
    end
    else print ('Id invalid!')
end
go

create procedure updUpdateFurnizor
	@id int,
    @Nume varchar(50),
    @NumarTelefon varchar(10)

AS
BEGIN
 
        IF(dbo.ufValidareString(@Nume)=1)
        begin
            IF(dbo.ufValidareTelefon(@NumarTelefon)=1)
            begin
				IF(dbo.ufValidareIdFurnizor(@id)=1)
				begin
                      
                        update Furnizor set Nume = @Nume
                        where FurnizorID=@id;
						update Furnizor set NumarTelefon = @NumarTelefon
                        where FurnizorID=@id;
				end
				else
					print ('Id invalid!')
            end
            else
                print ('NumarTelefon invalid!')
    end
    else print ('Numele persoanei este invalid!')
end
go

create procedure updFindFurnizor
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdFurnizor(@id)=1)
        begin
				
          select * from Furnizor where FurnizorID= @id;
 
          
    end
    else print ('Id invalid!')
end
go