if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_The_Longest_Service')
drop function FN_Get_The_Longest_Service;

go

create function FN_Get_The_Longest_Service ()
returns table 
as
	return 
	(
		select * from Service
		where duration = (select max(duration) 
							from Service)
	)

-- Usage

select * from FN_Get_The_Longest_Service()