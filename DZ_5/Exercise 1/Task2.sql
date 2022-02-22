if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Barber_Who_Had_Max_Number_Of_Clients_In_Range')
drop function FN_Get_Barber_Who_Had_Max_Number_Of_Clients_In_Range;

go

create function FN_Get_Barber_Who_Had_Max_Number_Of_Clients_In_Range (@start date, @end date)
returns table 
as
	return 
	(
			with barberClientNumber as 
			(
				select b.id, count(*) as [Clients Number] 
				from VisitsArchive as va
				join Barber as b on b.id = va.barberId
				where position = 'Barber'
				group by b.id
			)

			select b.f_name, b.m_name, b.l_name, b.sex, b.phone, b.email, b.birthDate, b.employmentDate, count(*) as [Clients Number] 
			from VisitsArchive
			join Barber as b on b.id = VisitsArchive.barberId
			where position = 'Barber'
			and date between @start and @end
			group by b.id, b.f_name, b.m_name, b.l_name, b.sex, b.phone, b.email, b.birthDate, b.employmentDate
			having count(*) = (select max([Clients Number]) from barberClientNumber)
	)

-- Usage

select * from FN_Get_Barber_Who_Had_Max_Number_Of_Clients_In_Range('2019-01-01', '2020-01-01')