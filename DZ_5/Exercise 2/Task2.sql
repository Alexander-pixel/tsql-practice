if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Top_3_Barbers_Whose_Clients_Spent_The_Most')
drop function FN_Get_Top_3_Barbers_Whose_Clients_Spent_The_Most;

go

create function FN_Get_Top_3_Barbers_Whose_Clients_Spent_The_Most ()
returns table 
as
	return 
	(
		select top 3 b.id, b.f_name, b.m_name, b.l_name, b.sex, b.phone, b.email, b.employmentDate, sum(totalValue) as [Total Sum]
		from VisitsArchive as va
		join Barber as b on b.id = va.barberId
		group by b.id, b.f_name, b.m_name, b.l_name, b.sex, b.phone, b.email, b.employmentDate
		order by sum(totalValue) desc
	)

-- Usage

select * from FN_Get_Top_3_Barbers_Whose_Clients_Spent_The_Most()