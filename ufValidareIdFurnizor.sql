create function ufValidareIdFurnizor(@id int)
returns int as
begin
declare @ret int;
set @ret = 0;
if exists (select * from Furnizor where FurnizorID = @id)
begin
set @ret = 1;
end
return @ret
end;
