--create database SportsShop

use SportsShop

--create table Workers
--(
--	id int primary key identity,
--	f_name nvarchar(30) not null,
--	l_name nvarchar(30) not null,
--	position nvarchar(30) not null, 
--	employmentDate date not null,
--	sex nvarchar(10) not null,
--	salary money not null,

--	constraint CK_Workers_FirstName_Not_Empty check (f_name != N''),
--	constraint CK_Workers_LastName_Not_Empty check (l_name != N''),
--	constraint CK_Workers_Position_Not_Empty check (position != N''),
--	constraint CK_Workers_Sex_Not_Empty check (sex != N''),
--	constraint CK_Workers_Salary check (salary > 0),
--)

--insert into Workers values
--('Name_1', 'Surname_1', 'Salesman', '2009-09-17', 'Male', 25000),
--('Name_2', 'Surname_2', 'CEO', '2011-10-23', 'Male', 100000),
--('Name_3', 'Surname_3', 'CTO', '2003-11-17', 'Female', 75000),
--('Name_4', 'Surname_4', 'Admin', '2019-09-19', 'Female', 15000),
--('Name_5', 'Surname_5', 'Loader', '2021-01-03', 'Male', 10000),
--('Name_6', 'Surname_6', 'Loader', '2020-05-06', 'Male', 10000)

--create table Clients
--(
--	id int primary key identity,
--	f_name nvarchar(30) not null,
--	l_name nvarchar(30) not null,
--	[address] nvarchar(30) not null,
--	phone nvarchar(30) not null,
--	sex nvarchar(10) not null,
--	isSubscibed bit not null,
--	discount int not null,

--	constraint CK_Clients_FirstName_Not_Empty check (f_name != N''),
--	constraint CK_Clients_LastName_Not_Empty check (l_name != N''),
--	constraint CK_Clients_Address_Not_Empty check ([address] != N''),
--	constraint CK_Clients_Sex_Not_Empty check (sex != N''),
--	constraint CK_Clients_Phone_Not_Empty check (phone != N''),
--	constraint CK_Clients_Discount_Value check (discount >= 0),
--)

--create table Items
--(
--	id int primary key identity,
--	[type] nvarchar(20) not null,
--	quantity int not null,
--	costPrice int not null,
--	manufacturer nvarchar(30) not null,
--	salePrice int not null,

--	constraint CK_Items_FirstName_Not_Empty check ([type] != N''),
--	constraint CK_Items_Quantity_Value check (quantity >= 0),
--	constraint CK_Items_CostPrice_Value check (costPrice >= 0),
--	constraint CK_Items_Manufacturer_Not_Empty check (manufacturer != N''),
--	constraint CK_Items_SalePrice_Value check (salePrice >= 0),
--)

--insert into Items values
--('Shoes', 200, 1900, 'Manufacturer_1', 2500),
--('Clothes', 100, 1600, 'Manufacturer_2', 2100),
--('Shoes', 150, 1450, 'Manufacturer_3', 2350),
--('Clothes', 30, 2900, 'Manufacturer_4', 4900),
--('Shoes', 15, 1300, 'Manufacturer_5', 2500),
--('Clothes', 90, 17200, 'Manufacturer_6', 27900),
--('Shoes', 145, 9500, 'Manufacturer_7', 11200)

--create table Sales
--(
--	id int primary key identity,
--	itemId int,
--	quantity int not null,
--	clientId int,
--	sellerId int,

--	foreign key (itemId) references Items (id),
--	foreign key (sellerId) references Workers (id),
--	foreign key (clientId) references Clients (id),
--)

--insert into Clients values
--('Name_1', 'Surname_1', 'address_1@gmail.com', '+380-50-999-99', 'Male', 1, 12),
--('Name_2', 'Surname_2', 'address_2@gmail.com', '+380-50-999-77', 'Male', 1, 0),
--('Name_3', 'Surname_3', 'address_3@gmail.com', '+380-50-777-99', 'Female', 0, 7),
--('Name_4', 'Surname_4', 'address_4@gmail.com', '+380-50-999-33', 'Male', 1, 9),
--('Name_5', 'Surname_5', 'address_5@gmail.com', '+380-50-999-55', 'Female', 0, 0)

--insert into Sales values
--(1, 2, 5, 6),
--(2, 1, 4, 3),
--(3, 1, 3, 5),
--(4, 4, 2, 4),
--(5, 3, 1, 3),
--(6, 1, 4, 2),
--(7, 1, 3, 1)

--create table History 
--(
--	id int primary key identity,
--	itemTitle nvarchar(30) not null,
--	buyPrice int not null,
--	quantity int not null,
--	purchuaseDate date not null,
--	sellerSurname nvarchar(30) not null,
--	clientSurname nvarchar(30) not null,

--	constraint CK_History_Title_Not_Empty check (itemTitle != N''),
--	constraint CK_History_ClientSurname_Not_Empty check (clientSurname != N''),
--	constraint CK_History_SellerSurname_Not_Empty check (sellerSurname != N''),
--	constraint CK_History_BuyPrice_Value check (buyPrice > 0),
--	constraint CK_History_Quantity_Value check (quantity > 0),
--)

--alter table Sales
--add purchuaseDate date 

--create table Archive 
--(
--	id int primary key identity,
--	title nvarchar(30) not null, 
--	[type] nvarchar(20) not null,
--	manufacturer nvarchar(30) not null,
--	sellPrice money not null,
--	costPrice money not null,
--	quantity int not null,

--	constraint CK_Archive_Title_Not_Empty check (title != N''),
--	constraint CK_Archive_SellPrice_Value check (sellPrice > 0),
--	constraint CK_Archive_CostPrice_Value check (costPrice > 0),
--	constraint CK_Archive_Quantity_Value check (quantity > 0),
--	constraint CK_Archive_Type_Not_Empty check ([type] != N''),
--	constraint CK_Archive_Manufacturer_Not_Empty check (manufacturer != N''),
--)

select * from Items 
select * from Workers 
select * from Clients 
select * from Sales 

go

-- Task 1
alter trigger TG_Sell_Item on Sales
after insert
as
begin 
	insert into History (itemTitle, buyPrice, quantity, purchuaseDate, sellerSurname, clientSurname) 
	(select Items.title, Items.salePrice, inserted.quantity, inserted.purchuaseDate, Workers.l_name, Clients.l_name from inserted
		join Items on inserted.itemId = Items.id
		join Workers on inserted.sellerId = Workers.id
		join Clients on inserted.clientId = Clients.id
	)
	declare @quan int
	set @quan = (select quantity from inserted)
	
	update Items
	set quantity = quantity - @quan
	where Items.id = (select itemId from inserted)
end

select * from History
select * from Sales
select * from Items

insert into Sales values
(3, 5, 4, 3, '2021-01-06')

-- Task 2

-- Task 2 не совсем работает, знаю почему
alter trigger TG_Sell_All_Items on Sales
after insert
as
begin
	if((select Items.quantity - inserted.quantity from inserted
								join Items on inserted.itemId = Items.id) <= 0)
	begin
		insert into Archive (title, type, manufacturer, sellPrice, costPrice, quantity)
		(select Items.title, Items.[type], Items.manufacturer, Items.salePrice, Items.costPrice, Items.quantity from inserted
								join Items on inserted.itemId = Items.id
								where Items.quantity - inserted.quantity <= 0)
	end
end

select * from Archive
select * from Sales
select * from Items

--insert into Sales values
--(1, 198, 3, 4, '2021-11-24')

-- Task 3
alter trigger TG_Client_Exists on Clients
instead of insert
as
begin
	if ((select count(*) from inserted
		join Clients on inserted.f_name = Clients.f_name 
		and inserted.l_name = Clients.l_name
		and inserted.[address] = Clients.address) < 1)
	begin
		insert into Clients (f_name, l_name, [address], phone, sex, isSubscibed, discount) 
		(select f_name, l_name, [address], phone, sex, isSubscibed, discount from inserted)
	end
end

select * from Clients

insert into Clients values
('Name_1', 'Surname_1', 'address_6@gmail.com', '+380-50-999-66', 'Male', 1, 10)

if(SELECT * FROM Clients
WHERE EXISTS
(SELECT Clients.f_name FROM Clients WHERE))
	print ('Hello')
