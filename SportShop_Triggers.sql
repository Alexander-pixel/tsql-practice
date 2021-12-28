use SportsShop

-- Exercise 1

select * from Items

-- Task 1
--alter trigger TF_Insert_Item on Items
--instead of insert
--as
--begin 
--	if ((select count(*) from inserted
--	join Items as i 
--	on i.title = inserted.title
--	where (i.type = inserted.type 
--	and i.costPrice = inserted.costPrice
--	and i.manufacturer = inserted.manufacturer
--	and i.salePrice = inserted.salePrice)) > 0)
--		begin
--			declare @quantity int = (select inserted.quantity from inserted
--									join Items as i 
--									on i.title = inserted.title
--									where (i.type = inserted.type 
--									and i.costPrice = inserted.costPrice
--									and i.manufacturer = inserted.manufacturer
--									and i.salePrice = i.salePrice))
--		declare @id int = (select i.id from inserted
--									join Items as i 
--									on i.title = inserted.title
--									where (i.type = inserted.type 
--									and i.costPrice = inserted.costPrice
--									and i.manufacturer = inserted.manufacturer
--									and i.salePrice = i.salePrice))
--			update Items
--			set quantity = @quantity
--			where Items.id = @id
--		end
--end

--insert into Items values
--('Shoes', 250, 1900, 'Manufacturer_1', 2500, 'Title')
select * from Items

-- Task 2
select * from Workers
--create table Archive_Workers
--(
--	id int primary key identity,
--	l_name nvarchar(50) not null, 
--	position nvarchar(50) not null,
--	employmentDate date not null,
--	salary money not null,
--)

--create trigger TG_Delete_Worker on Workers
--after delete
--as
--begin 
--	insert into Archive_Workers (l_name, position, employmentDate, salary) 
--	(select l_name, position, employmentDate, salary from deleted)
--end

--delete from Workers
--where id = 5

--alter table Sales
--add foreign key (sellerId) references Workers(id) on delete cascade
select * from Archive_Workers

-- Task 3
--alter trigger TG_Insert_Worker_More_Than_6 on Workers
--instead of insert
--as
--begin
--	if ((select count(*) from Workers) < 6)
--		begin
--			insert into Workers (f_name, l_name, position, employmentDate, sex, salary) 
--			(select f_name, l_name, position, employmentDate, sex, salary from inserted)
--		end
--end

--insert into Workers values
--('Name_7', 'Surname_7', 'Salesman', '2018-08-09', 'Female', 17000)
select * from Workers