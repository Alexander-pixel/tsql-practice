if exists (select 1 from sys.procedures where name = N'sp_print_symbol')
drop proc sp_print_symbol;

go

create proc sp_print_symbol @counter int, @symbol nchar
as
begin
	declare @str as nvarchar(max) = N'';
	while (@counter >= 0) 
	begin
		set @str += @symbol; 
		set @counter = @counter - 1;
	end
	print (@str);
end

exec sp_print_symbol @counter = 5, @symbol = N'#'