if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Top_3_All_Time_Barbers_With_30_Visits_By_Average_Rating')
drop function FN_Get_Top_3_All_Time_Barbers_With_30_Visits_By_Average_Rating;

go

create function FN_Get_Top_3_All_Time_Barbers_With_30_Visits_By_Average_Rating ()
returns table 
as
	return 
	(
		select top 3 b.id, b.f_name, b.m_name, b.l_name, b.sex, b.phone, b.email, b.employmentDate, avg(bf.rating) as [Average Rating]
		from VisitsArchive as va
		join Barber as b on b.id = va.barberId 
		join BarberFeedback as bf on bf.barberId = b.id
		group by b.id, b.f_name, b.m_name, b.l_name, b.sex, b.phone, b.email, b.employmentDate
		having count(va.clientId) >= 30
		order by avg(bf.rating) desc
	)

-- Usage

select * from FN_Get_Top_3_All_Time_Barbers_With_30_Visits_By_Average_Rating()
