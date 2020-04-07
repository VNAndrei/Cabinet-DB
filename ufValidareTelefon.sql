create function ufValidareTelefon(@telefon nvarchar(10))
returns int as
begin
declare @ret int;
set @ret = 0;
if ( len(@telefon) = 10)
begin
set @ret = 1;
end
return @ret
end;
