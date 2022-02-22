if exists (select 1 from sys.triggers where name = N'TG_Refuse_Clients_Removal')
drop trigger TG_Refuse_Clients_Removal;

go

create trigger TG_Refuse_Clients_Removal on Clients
instead of delete
as
begin
	if ((select count(*) from deleted
	join Clients on Clients.id = deleted.id) != 0)
	begin
		print ('Client removal refused.')
	end
end

-- Test

delete from Clients
where id = 3