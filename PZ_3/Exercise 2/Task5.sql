if exists (select 1 from sys.procedures where name = N'get_sales_by_date_range')
drop proc get_sales_by_date_range;

go

create proc get_sales_by_date_range @startDate date, @endDate date
as
begin
	select * from Sales
	where purchaseDate >= @startDate
	and purchaseDate <= @endDate
end

exec get_sales_by_date_range '2021-03-29', '2021-07-22'