use Sales

-- Exercise 3

select * from Sales

-- Task 1
--create table CustomersDuplicates
--(
--	id int primary key identity,
--	customerId int references Customers(id)
--)
--alter table CustomersDuplicates
--add l_name nvarchar(50) 

--create trigger TG_Insert_Customer_With_Same_Surname on Customers
--after insert
--as
--begin
--	insert into CustomersDuplicates (customerId, l_name)
--	(select inserted.id, inserted.l_name from inserted
--	join Customers on Customers.id = inserted.id
--	where inserted.l_name = Customers.l_name)
--end

--insert into Customers values
--('Name_7', 'Surname_2', 'address_7@gmail.com', '+380-050-666-99')

select * from CustomersDuplicates
select * from Customers

-- Task 2
--create table SalesHistory 
--(
--	id int primary key identity,
--	customerId int references Customers(id),
--	salesmanId int references Salesmen(id),
--	title nvarchar(50) not null,
--	price money not null, 
--	purchaseDate date not null,
--)

--create trigger TG_Delete_Sale on Sales
--after delete
--as
--begin
--	insert into SalesHistory (customerId, salesmanId, title, price, purchaseDate)
--	(select customerId, salesmanId, title, price, purchaseDate from deleted)
--end

--delete from Sales
--where id = 3;

select * from Sales
select * from SalesHistory

-- Task 3 - неправильно
--create trigger TG_Insert_Salesman on Salesmen
--instead of insert
--as
--begin
--	insert into Salesmen (f_name, l_name, address, phone)
--	(select f_name, l_name, address, phone from inserted
--	join Customers on Customers.f_name = inserted.f_name)
--end


select * from Customers

-- Task 5
--alter trigger TG_Insert_Sale on Sales
--instead of insert 
--as
--begin
--	insert into Sales (customerId, salesmanId, title, price, purchaseDate)
--	(select customerId, salesmanId, title, price, purchaseDate from inserted
--	where title != 'Apple'
--	and title != 'Pear'
--	and title != 'Plum'
--	and title != 'Cilantro')
--end

select * from Sales

--insert into Sales values
--(3, 4, 'Apple', 25, '2021-10-10'),
--(6, 1, 'Sale_7', 25, '2021-09-01')