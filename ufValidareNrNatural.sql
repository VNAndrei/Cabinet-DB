create function ufValidareNrNatural(@nr int)
returns int as 
begin
declare @ret int;
set @ret = 0;
if (@nr>=0)
begin
set @ret = 1;
end
return @ret
end;
