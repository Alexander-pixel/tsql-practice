if exists (select 1 from sys.procedures where name = N'get_sales_by_salesmen_surname')
drop proc get_sales_by_salesmen_surname;

go

create proc get_sales_by_salesmen_surname @surname nvarchar(max)
as
begin 
	select Sales.id, customerId, salesmanId, title, price, purchaseDate from Sales
	join Salesmen on Sales.salesmanId = Salesmen.id
	where Salesmen.l_name = @surname;
end

exec get_sales_by_salesmen_surname 'Surname_2'