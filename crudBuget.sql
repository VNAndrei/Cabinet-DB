create procedure updAddBuget
    @cid int,
	@profit int,
	@cheltuieli int

AS
BEGIN
 
        IF(dbo.ufValidareIdCabinet(@cid)=1)
        begin
            IF(dbo.ufValidareNrNatural(@profit)=1)
            begin       
			IF(dbo.ufValidareNrNatural(@cheltuieli)=1)
            begin      
                        insert into Buget(CabinetID,Profit,Cheltuieli) Values (@cid,@profit,@cheltuieli)
						end
            else
                print ('Cheltuieli <0!')
            end
            else
                print ('Profit <0!')
    end
    else print ('Cabinet Inexistent')
end
go
 

 create procedure updDeleteBuget
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdBuget(@id)=1)
        begin
				
          delete from Buget where BugetID= @id;
 
          
    end
    else print ('Id invalid!')
end
go

create procedure updUpdateBuget
	@id int,
   @cid int,
	@profit int,
	@cheltuieli int

AS
BEGIN
 
        IF(dbo.ufValidareNrNatural(@profit)=1)
        begin
            IF(dbo.ufValidareNrNatural(@profit)=1)
            begin
				IF(dbo.ufValidareIdBuget(@id)=1)
				begin
				iF(dbo.ufValidareIdCabinet(@id)=1)
				begin
                      
                        update Buget set CabinetID = @cid where BugetID= @id;
						update Buget set Cheltuieli = @cheltuieli where BugetID= @id;
						update Buget set Profit = @profit where BugetID= @id;

				end
				else
					print ('Id cabinet invalid!')
            end
            else
                print ('Id buget invalid!')
				 end
            else
                print ('Profit <0!')
    end
    else print ('Cheltuieli<0!')
end
go

create procedure updFindBuget
    @id int
AS
BEGIN
 
        IF(dbo.ufValidareIdBuget(@id)=1)
        begin
				
          select * from Buget where BugetID= @id;
 
          
    end
    else print ('Id invalid!')
end
go