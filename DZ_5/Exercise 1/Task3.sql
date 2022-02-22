if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Client_Who_Visited_Most_Times')
drop function FN_Get_Client_Who_Visited_Most_Times;

go

create function FN_Get_Client_Who_Visited_Most_Times ()
returns table 
as
	return 
	(
		with clientVisitsNumber as 
		(
			select c.id, count(*) as [Visits Number] 
			from VisitsArchive as va
			join Client as c on c.id = va.clientId
			group by c.id
		)

		select c.f_name, c.m_name, c.l_name, c.sex, c.phone, c.email, c.birthDate, count(*) as [Clients Number] 
		from VisitsArchive as va
		join Client as c on c.id = va.clientId
		group by c.id, c.f_name, c.m_name, c.l_name, c.sex, c.phone, c.email, c.birthDate
		having count(*) = (select max([Visits Number]) from clientVisitsNumber)
	)

-- Usage

select * from FN_Get_Client_Who_Visited_Most_Times()