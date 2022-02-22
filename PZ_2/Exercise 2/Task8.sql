if exists (select 1 from sys.triggers where name = N'TG_Last_Item')
drop trigger TG_Last_Item;

go

create trigger TG_Last_Item on Sales
after insert 
as
begin
	update Items
	set [status] = 'Last item'
	where Items.id in (select inserted.itemId from inserted
	join Sales on inserted.itemId = Sales.id
	where Items.quantity - inserted.quantity = 1)
end