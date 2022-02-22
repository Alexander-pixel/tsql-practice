if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Longest_And_Shortest_Songs_Duration')
drop function FN_Get_Longest_And_Shortest_Songs_Duration;

go

create function FN_Get_Longest_And_Shortest_Songs_Duration ()
returns table
as
return (select duration as [Duration] from Songs
		where duration = (select max(duration) from Songs)
			union
		select duration from Songs
		where duration = (select min(duration) from Songs))

-- Usage

select * from FN_Get_Longest_And_Shortest_Songs_Duration ()