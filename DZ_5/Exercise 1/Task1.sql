if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Barber_Who_Works_The_Longest')
drop function FN_Get_Barber_Who_Works_The_Longest;

go

create function FN_Get_Barber_Who_Works_The_Longest ()
returns table 
as
	return (select top 1 * from Barber
	order by employmentDate)

-- Usage

select * from FN_Get_Barber_Who_Works_The_Longest()