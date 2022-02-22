if exists (select 1 from sys.procedures where name = N'sp_get_factorial')
drop proc sp_get_factorial;

go

create proc sp_get_factorial @num int
as
begin
	if (@num = 0 or @num = 1)
		return 1;
	else
	begin
		declare @res int = 1;
		declare @val int = @num - 1;
		exec @res = sp_get_factorial @val;
		return @num * @res;
	end
end

declare @res1 int = 1;
exec @res1 = sp_get_factorial 5;
print (@res1);