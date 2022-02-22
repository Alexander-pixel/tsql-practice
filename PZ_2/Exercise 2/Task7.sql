if exists (select 1 from sys.triggers where name = N'TG_Refuse_Insertion_By_Manufacturer')
drop trigger TG_Refuse_Insertion_By_Manufacturer;

go

create trigger TG_Refuse_Insertion_By_Manufacturer on Items
instead of insert
as
begin
	insert into Items (type, quantity, costPrice, manufacturer, salePrice, title)
	(select type, quantity, costPrice, manufacturer, salePrice, title from inserted				
	where title != N'Some title')
end

-- Test

insert into Items
values
('Shoes', 200, 1500, 'Manufacturer_8', 2900, 'Title'),
('Shoes', 120, 1650, 'Manufacturer_9', 3200, 'Some title'),
('Shoes', 190, 1950, 'Manufacturer_10', 3900, 'Title')
