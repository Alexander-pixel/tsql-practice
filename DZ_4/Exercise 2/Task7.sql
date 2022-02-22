if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Singers_With_2_And_More_Styles')
drop function FN_Get_Singers_With_2_And_More_Styles;

go

create function FN_Get_Singers_With_2_And_More_Styles ()
returns table
as
return (select Singers.id, f_name, l_name from Singers
		join MusicalDisk on MusicalDisk.singerId = Singers.id
		group by Singers.id, f_name, l_name
		having count(styleId) >= 2)

-- Usage

select * from FN_Get_Singers_With_2_And_More_Styles ()