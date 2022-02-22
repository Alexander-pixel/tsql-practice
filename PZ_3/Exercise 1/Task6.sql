if exists (select 1 from sys.procedures where name = N'sp_get_max')
drop proc sp_get_max;

go

create proc sp_get_max @num1 int, @num2 int, @num3 int
as
begin
	select max(num)  
       from (values  
              (@num1), (@num2), (@num3)) as numbers(num);
end

exec sp_get_max @num1 = 5, @num2 = 10, @num3 = 15