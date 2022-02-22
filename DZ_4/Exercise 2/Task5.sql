if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Average_Songs_Duration_By_Singer')
drop function FN_Get_Average_Songs_Duration_By_Singer;

go

create function FN_Get_Average_Songs_Duration_By_Singer (@name nvarchar(max))
returns table
as
return (select avg(duration) as [Average] from Songs
		join Singers on Singers.id = Songs.singerId
		where Singers.f_name + ' ' + Singers.l_name = @name)

-- Usage

select * from FN_Get_Average_Songs_Duration_By_Singer ('Name_1')