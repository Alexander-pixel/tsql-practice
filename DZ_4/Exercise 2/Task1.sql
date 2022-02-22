if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Disks_By_Year')
drop function FN_Get_Disks_By_Year;

go

create function FN_Get_Disks_By_Year (@year int)
returns table
as
return (select * from MusicalDisk
		where datepart(year, publishDate) = @year)

-- Usage

select * from FN_Get_Disks_By_Year (2009)