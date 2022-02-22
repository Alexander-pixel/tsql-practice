if exists (select 1 from sys.procedures where name = N'get_all_customers')
drop proc get_all_customers;

go

create proc get_all_customers as
begin
	select * from Customers
end

exec get_all_customers