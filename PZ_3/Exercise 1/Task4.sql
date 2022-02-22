if exists (select 1 from sys.procedures where name = N'sp_get_sum')
drop proc sp_get_sum;

go

create proc sp_get_sum @num1 int, @num2 int, @num3 int
as
begin
	select @num1 + @num2 + @num3 as [Sum];
end

exec sp_get_sum @num1 = 5, @num2 = 10, @num3 = 15