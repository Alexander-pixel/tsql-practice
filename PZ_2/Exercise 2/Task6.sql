-- Not working correctly

if exists (select 1 from sys.triggers where name = N'TG_Order_Summary_More_Than_50000')
drop trigger TG_Order_Summary_More_Than_50000;

go

create trigger TG_Order_Summary_More_Than_50000 on Sales
after insert
as
begin 
	update Clients
	set discount = 15
	where Clients.id in (select inserted.clientId from inserted
	join Clients on Clients.id = inserted.clientId
	join Items on Items.id = inserted.itemId
	group by inserted.clientId
	having sum(Items.salePrice) >= 50000)
end