if exists (select 1 from sys.triggers where name = N'TG_Refuse_Workers_from_2015_Removal')
drop trigger TG_Refuse_Workers_from_2015_Removal;

go

create trigger TG_Refuse_Workers_from_2015_Removal on Workers
instead of delete
as
begin
	delete from Workers
	where Workers.id in (select id from deleted
						  where datepart(year, Workers.employmentDate) > 2015)
end

-- Test

delete from Workers
where id = 3