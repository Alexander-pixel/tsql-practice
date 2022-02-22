if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Barber_Who_Has_Most_Clients')
drop function FN_Get_Barber_Who_Has_Most_Clients;

go

create function FN_Get_Barber_Who_Has_Most_Clients ()
returns table 
as
	return 
	(
		with barberClientsNumber
		as
		(
			select b.id, count(clientId) as [Clients Number]
			from VisitsArchive as va
			join Barber as b on b.id = va.barberId
			group by b.id
		)

		select b.id, b.f_name, b.m_name, b.l_name, b.sex, b.phone, b.email, b.employmentDate 
		from VisitsArchive as va
		join Barber as b on b.id = va.barberId
		group by b.id, b.f_name, b.m_name, b.l_name, b.sex, b.phone, b.email, b.employmentDate
		having count(clientId) = (select max([Clients Number]) from barberClientsNumber)
	)

-- Usage

select * from FN_Get_Barber_Who_Has_Most_Clients()