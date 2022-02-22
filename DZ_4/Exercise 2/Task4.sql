if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Disks_Number_In_Particular_Slyle')
drop function FN_Get_Disks_Number_In_Particular_Slyle;

go

create function FN_Get_Disks_Number_In_Particular_Slyle ()
returns table
as
return (select count(*) as [Count] from MusicalDisk
		join Styles on Styles.id = MusicalDisk.styleId
		where Styles.title = 'Style_1' or Styles.title = 'Style_2')

-- Usage

select * from FN_Get_Disks_Number_In_Particular_Slyle ()