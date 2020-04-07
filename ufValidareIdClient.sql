create function ufValidareIdCabinet(@id int)
returns int as
begin
declare @ret int;
set @ret = 0;
if exists (select * from Cabinet where CabinetID = @id)
begin
set @ret = 1;
end
return @ret
end;
