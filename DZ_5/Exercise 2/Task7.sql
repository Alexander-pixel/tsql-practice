if exists (select 1 from sys.triggers where name = N'TG_Reject_Visit_To_Barber_On_Booked_Time')
drop trigger TG_Reject_Visit_To_Barber_On_Booked_Time;

go

create trigger TG_Reject_Visit_To_Barber_On_Booked_Time on Schedule
instead of insert
as
begin 
	insert into Schedule (barberId, clientId, date, description, duration)
	(select i.barberId, i.clientId, i.date, i.description, i.duration 
			from inserted as i
			where i.barberId in (select barberId from Schedule
								where date != i.date))
end