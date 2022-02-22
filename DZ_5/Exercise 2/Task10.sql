if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Clients_Without_Visits_For_More_Than_1_Year')
drop function FN_Get_Clients_Without_Visits_For_More_Than_1_Year;

go

create function FN_Get_Clients_Without_Visits_For_More_Than_1_Year ()
returns table 
as
	return 
	(
		select distinct c.id, c.f_name, c.m_name, c.l_name, c.sex, c.phone, c.email, c.birthDate from VisitsArchive as va
		join Client as c on c.id = va.clientId
		where datediff(year, va.date, getdate()) >= 1 
	)

-- Usage

select * from FN_Get_Clients_Without_Visits_For_More_Than_1_Year()