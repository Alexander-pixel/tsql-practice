if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Client_Who_Spent_The_Most')
drop function FN_Get_Client_Who_Spent_The_Most;

go

create function FN_Get_Client_Who_Spent_The_Most ()
returns table 
as
	return 
	(
		with clientTotalSum as 
		(
			select c.id, sum(va.totalValue) as [Total Sum] 
			from VisitsArchive as va
			join Client as c on c.id = va.clientId
			group by c.id
		)

		select c.f_name, c.m_name, c.l_name, c.sex, c.phone, c.email, c.birthDate, sum(va.totalValue) as [Total Sum] 
		from VisitsArchive as va
		join Client as c on c.id = va.clientId
		group by c.id, c.f_name, c.m_name, c.l_name, c.sex, c.phone, c.email, c.birthDate
		having sum(va.totalValue) = (select max([Total Sum]) from clientTotalSum)
	)

-- Usage

select * from FN_Get_Client_Who_Spent_The_Most()