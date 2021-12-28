-- Task 1
--create proc sp_get_all_items
--as
--begin
--	select * from Items
--end

exec sp_get_all_items

-- Task 2
--create proc sp_get_items_by_type @type nvarchar(50)
--as
--begin
--	select * from Items
--	where type = @type
--end

exec sp_get_items_by_type 'Shoes'

-- Task 3
--create proc sp_get_top3_clients
--as
--begin 
--	select top(3) * from Clients
--	order by registrationDate
--end

exec sp_get_top3_clients

-- Task 4
--create proc sp_get_best_worker
--as
--begin
--	select top(1) f_name, l_name, position, employmentDate, sex, salary from Workers
--	join Sales on Sales.sellerId = Workers.id
--	join Items on Sales.itemId = Items.id
--	order by Sales.quantity * Items.salePrice desc
--end

exec sp_get_best_worker

-- Task 5
--create proc sp_get_by_manufacturer @macufacturer nvarchar(50), @res nvarchar(10) out
--as
--begin
--	if((select count(*) from Items
--		where Items.manufacturer = @macufacturer) > 0)
--		set @res = 'yes'
--	else
--		set @res = 'no'
--end

declare @res nvarchar(10)
exec sp_get_by_manufacturer 'Manufacturer_1', @res out
print(@res)

-- Task 6
--create proc sp_get_most_popular_manufacturer
--as
--begin
--	select Items.id, Items.type, Items.quantity, Items.costPrice, Items.manufacturer, Items.salePrice, Items.title from Items
--	join Sales on Sales.itemId = Items.id
--	group by Items.id, Items.type, Items.quantity, Items.costPrice, Items.manufacturer, Items.salePrice, Items.title
--	order by sum(Sales.quantity * Items.salePrice)
--end

exec sp_get_most_popular_manufacturer

-- Task 7
create proc sp_delete_clients_after_date @date date, @res int out
as
begin
	declare @before_delete int
	set @before_delete = (select count(*) from Clients)
	
	delete cascade from Clients
	where Clients.registrationDate >= @date

	declare @after_delete int
	set @after_delete = (select count(*) from Clients)

	set @res = @before_delete - @after_delete
end

--alter table Sales
--add foreign key(clientId) references Clients(id) on delete cascade  

declare @res int
exec sp_delete_clients_after_date '2019-05-01', @res out
print(@res)