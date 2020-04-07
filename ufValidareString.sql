create function ufValidareString(@string varchar(50))
returns int as
begin
declare @ret int;
set @ret = 0;
if ( len(@string) >= 3)
begin
set @ret = 1;
end
return @ret
end;
