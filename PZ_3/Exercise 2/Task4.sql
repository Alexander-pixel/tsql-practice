if exists (select 1 from sys.procedures where name = N'get_sales_by_date')
drop proc get_sales_by_date;

go

create proc get_sales_by_date @date date
as
begin
	select * from Sales
	where purchaseDate = @date
end

exec get_sales_by_date '2021-10-11'