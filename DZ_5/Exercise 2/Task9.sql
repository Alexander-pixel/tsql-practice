if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Clients_Without_Feedback')
drop function FN_Get_Clients_Without_Feedback;

go

create function FN_Get_Clients_Without_Feedback ()
returns table 
as
	return 
	(
		select c.id, c.f_name, c.m_name, c.l_name, c.sex, c.phone, c.email, c.birthDate from Client as c
		join BarberFeedback as bf on bf.clientId = c.id
		where c.id not in (select clientId from BarberFeedback)
	)

-- Usage

select * from FN_Get_Clients_Without_Feedback()