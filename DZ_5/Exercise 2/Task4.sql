if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Schedule_For_Barber_By_Id_And_Date')
drop function FN_Get_Schedule_For_Barber_By_Id_And_Date;

go

create function FN_Get_Schedule_For_Barber_By_Id_And_Date (@barberId int, @date date)
returns table 
as
	return 
	(
		select * from Schedule
		where barberId = @barberId
		and date = @date
	)

-- Usage

select * from FN_Get_Schedule_For_Barber_By_Id_And_Date(2, '2019-09-22')