if exists (select 1 from sys.triggers where name = N'TG_Reject_Adding_Junior_Barber_If_There_Already_5')
drop trigger TG_Reject_Adding_Junior_Barber_If_There_Already_5;

go

create trigger TG_Reject_Adding_Junior_Barber_If_There_Already_5 on Barber
instead of insert
as
begin 
	insert into Barber (f_name, m_name, l_name, sex, phone, email, birthDate, employmentDate, position)
	(select f_name, m_name, l_name, sex, phone, email, birthDate, employmentDate, position 
	from inserted
	where position != 'Barber')

	declare @barberNumber int = (select count(*) from Barber
		where position = 'Barber')

	if (@barberNumber < 5)
	begin
		declare @insertCount int = 5 - @barberNumber								

		insert into Barber (f_name, m_name, l_name, sex, phone, email, birthDate, employmentDate, position)
		(select top (@insertCount) f_name, m_name, l_name, sex, phone, email, birthDate, employmentDate, position 
		from inserted
		where position = 'Barber')
	end
end