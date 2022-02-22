if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Disks_With_Same_Title_And_Different_Singers')
drop function FN_Get_Disks_With_Same_Title_And_Different_Singers;

go

create function FN_Get_Disks_With_Same_Title_And_Different_Singers ()
returns table
as
return (select distinct singerId, title, publishDate, styleId, publisherId, desciption from MusicalDisk
		where title in (select title from MusicalDisk
						group by title
						having count(*) > 1))

-- Usage

select * from FN_Get_Disks_With_Same_Title_And_Different_Singers ()