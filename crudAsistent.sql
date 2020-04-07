create procedure updAddAsistent
    @Nume varchar(50),
	@Prenume varchar(50),
    @NumarTelefon varchar(10)
AS
BEGIN
  IF(dbo.ufValidareString(@Nume)=1)
        begin
        IF(dbo.ufValidareString(@Prenume)=1)
        begin
            IF(dbo.ufValidareTelefon(@NumarTelefon)=1)
            begin
                      
                        insert into Asistent(Nume,Prenume,NumarTelefon) Values (@Nume,@Prenume,@NumarTelefon)
			end
            else
                print ('NumarTelefon invalid!')

            end
            else
                print ('Prenumele persoanei invalid!')
    end
    else print ('Numele persoanei este invalid!')
end
go
 

alter procedure updDeleteAsistent
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdAsistent(@id)=1)
        begin
			
			delete from Medici_Asistenti where AsistentID =@id;	
          delete from Asistent where AsistentID= @id;
		  
 
          
    end
    else print ('Id invalid!')
end
go

alter procedure updUpdateAsistent
	@id int,
    @Nume varchar(50),
	@Prenume varchar(50),
    @NumarTelefon varchar(10)

AS
BEGIN
 IF(dbo.ufValidareString(@Prenume)=1)
        begin
        IF(dbo.ufValidareString(@Nume)=1)
        begin
            IF(dbo.ufValidareTelefon(@NumarTelefon)=1)
            begin
				IF(dbo.ufValidareIdAsistent(@id)=1)
				begin
                      
                        update Asistent set Nume = @Nume
                        where AsistentID=@id;
						update Asistent set Prenume = @Prenume
                        where AsistentID=@id;
						update Asistent set NumarTelefon = @NumarTelefon
                        where AsistentID=@id;
				end
				else
					print ('Id invalid!')
				end
				else
					 print ('NumarTelefon invalid!')
            end
            else
                print ('Nume invalid!')
    end
    else print ('Prenumele persoanei este invalid!')
end
go

create procedure updFindAsistent
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdAsistent(@id)=1)
        begin
				
          select * from Asistent where AsistentID= @id;
 
          
    end
    else print ('Id invalid!')
end
go

