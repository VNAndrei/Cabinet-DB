create procedure updAddMaterial
    @idCabinet int,
	@idFurnizor int,
	@Nume varchar(50),
	@pret int,
	@canitate int
AS
BEGIN
 
        IF(dbo.ufValidareString(@Nume)=1)
        begin
            IF(dbo.ufValidareNrNatural(@pret)=1)
            begin
			IF(dbo.ufValidareNrNatural(@canitate)=1)
            begin
                      
			IF(dbo.ufValidareIdFurnizor(@idFurnizor)=1)
            begin
                      
			IF(dbo.ufValidareIdCabinet(@idCabinet)=1)
            begin
                      
                      
                        insert into Material(CabientID,FurnizorID,Nume,Pret,Cantitate) Values (@idCabinet, @idFurnizor,@Nume,@pret,@canitate)
			end
            else
                print ('Cabinet inexistent!')
				end
            else
                print ('Furnizor inexistent!')
				end
            else
                print ('Cantitate <0!')

            end
            else
                print ('Pret <0!')
    end
    else print ('Numele persoanei este invalid!')
end
go
 

 create procedure updDeleteMaterial
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdMaterial(@id)=1)
        begin
				
          delete from Material where MaterialID= @id;
 
          
    end
    else print ('Id invalid!')
end
go

create procedure updUpdateMaterial
	@id int,
     @idCabinet int,
	@idFurnizor int,
	@Nume varchar(50),
	@pret int,
	@canitate int
AS
BEGIN
 
           IF(dbo.ufValidareString(@Nume)=1)
        begin
            IF(dbo.ufValidareNrNatural(@pret)=1)
            begin
			IF(dbo.ufValidareNrNatural(@canitate)=1)
            begin
                      
			IF(dbo.ufValidareIdFurnizor(@idFurnizor)=1)
            begin
                      
			IF(dbo.ufValidareIdCabinet(@idCabinet)=1)
            begin
			IF(dbo.ufValidareIdMaterial(@id)=1)
            begin
                      
                      
                        update Material set CabientID=@idCabinet where MaterialID=@id;
						update Material set FurnizorID=@idFurnizor where MaterialID=@id;
						update Material set Nume=@Nume where MaterialID=@id;
						update Material set Pret=@pret where MaterialID=@id;

						update Material set Cantitate=@canitate where MaterialID=@id;
			end
            else
                print ('Material inexistent!')
			end
            else
                print ('Cabinet inexistent!')
				end
            else
                print ('Furnizor inexistent!')
				end
            else
                print ('Cantitate <0!')

            end
            else
                print ('Pret <0!')
    end
    else print ('Numele este invalid!')
end
go

create procedure updFindMaterial
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdMaterial(@id)=1)
        begin
				
          select * from Material where MaterialID= @id;
 
          
    end
    else print ('Id invalid!')
end
go