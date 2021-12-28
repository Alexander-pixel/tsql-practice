--create database Sales

use Sales

--create table Customers
--(
--	id int primary key identity,
--	f_name nvarchar(30) not null,
--	l_name nvarchar(30) not null,
--	[address] nvarchar(30) not null,
--	phone nvarchar(30) not null,

--	constraint CK_FirstName_Not_Empty check (f_name != N''),
--	constraint CK_LastName_Not_Empty check (l_name != N''),
--	constraint CK_Address_Not_Empty check ([address] != N''),
--	constraint CK_Phone_Not_Empty check (phone != N''),
--)

--create table Salesmen
--(
--	id int primary key identity,
--	f_name nvarchar(30) not null,
--	l_name nvarchar(30) not null,
--	[address] nvarchar(30) not null,
--	phone nvarchar(30) not null,

--	constraint CK_Salesman_FirstName_Not_Empty check (f_name != N''),
--	constraint CK_Salesman_LastName_Not_Empty check (l_name != N''),
--	constraint CK_Salesman_Address_Not_Empty check ([address] != N''),
--	constraint CK_Salesman_Phone_Not_Empty check (phone != N''),
--)

--create table Sales 
--(
--	id int primary key identity,
--	customerId int,
--	salesmanId int, 
--	title nvarchar(50) not null,
--	price money not null,
--	purchaseDate date not null,

--	foreign key (customerId) references Customers(id),
--	foreign key (salesmanId) references Salesmen(id),
--	constraint CK_Sale_Title_Not_Empty check (title != N''),
--	constraint CK_Sale_Price_Value check (price > 0),
--)

select * from Customers

--insert into Customers values
--('Name_1', 'Surname_1', 'address_1@gmail.com', '+380-050-999-99'),
--('Name_2', 'Surname_2', 'address_2@gmail.com', '+380-050-777-77'),
--('Name_3', 'Surname_3', 'address_3@gmail.com', '+380-050-111-99'),
--('Name_4', 'Surname_4', 'address_4@gmail.com', '+380-050-222-99'),
--('Name_5', 'Surname_5', 'address_5@gmail.com', '+380-050-333-99'),
--('Name_6', 'Surname_6', 'address_6@gmail.com', '+380-050-444-99')

select * from Salesmen

--insert into Salesmen values
--('Name_1', 'Surname_1', 'address_1@gmail.com', '+380-050-999-99'),
--('Name_2', 'Surname_2', 'address_2@gmail.com', '+380-050-777-77'),
--('Name_3', 'Surname_3', 'address_3@gmail.com', '+380-050-111-99'),
--('Name_4', 'Surname_4', 'address_4@gmail.com', '+380-050-222-99'),
--('Name_5', 'Surname_5', 'address_5@gmail.com', '+380-050-333-99'),
--('Name_6', 'Surname_6', 'address_6@gmail.com', '+380-050-444-99')

--insert into Sales values
--(1, 6, 'Sale_1', 2300, '2021-10-11'),
--(2, 5, 'Sale_2', 1700, '2021-11-19'),
--(3, 4, 'Sale_3', 950, '2021-09-13'),
--(4, 3, 'Sale_4', 850, '2021-07-23'),
--(5, 2, 'Sale_5', 3800, '2021-03-29'),
--(6, 1, 'Sale_6', 6700, '2021-06-16')

select * from Sales
-- Task 1
create view VW_Salesmen as
select * from Salesmen

-- Task 2
create view VW_Customers as
select * from Customers

-- Task 3
create view VW_Sales_ParticularTitle as
select * from Sales
where title = 'Sale_1'

--insert into Sales values
--(2, 4, 'Sale_1', 1950, '2021-11-09')

-- Task 4
create view VW_Sales as
select * from Sales

-- Task 5
create view VW_Best_Salesman as
select top(1) Salesmen.f_name, Salesmen.l_name, sum(price) as [Sum of sales] from Sales
join Salesmen on Salesmen.id = Sales.salesmanId
group by Salesmen.f_name, Salesmen.l_name
order by sum(price) desc

-- Task 6
create view VW_Best_Customer as
select top(1) f_name, l_name, [address], phone, sum(price) as [Sum of purchuases] from Sales
join Customers on Customers.id = Sales.customerId
group by f_name, l_name, [address], phone
order by sum(price) desc