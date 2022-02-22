if exists (select 1 from sys.procedures where name = N'get_average_sale_price_by_year')
drop proc get_average_sale_price_by_year;

go

create proc get_average_sale_price_by_year @year int
as
begin 
	select avg(price) from Sales
	where datepart(year, purchaseDate) = @year
end

exec get_average_sale_price_by_year 2021