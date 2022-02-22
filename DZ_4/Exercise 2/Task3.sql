if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Disks_By_Title')
drop function FN_Get_Disks_By_Title;

go

create function FN_Get_Disks_By_Title (@word nvarchar(max))
returns table
as
return (select * from MusicalDisk
		where title like '%' + @word + '%')

-- Usage

select * from FN_Get_Disks_By_Title ('Disk')