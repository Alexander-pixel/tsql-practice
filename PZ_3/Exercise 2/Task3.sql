if exists (select 1 from sys.procedures where name = N'get_all_sales')
drop proc get_all_sales;

go

create proc get_all_sales as
begin
	select * from Sales
end

exec get_all_sales