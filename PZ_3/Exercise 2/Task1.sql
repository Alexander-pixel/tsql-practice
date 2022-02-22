if exists (select 1 from sys.procedures where name = N'get_all_salesmen')
drop proc get_all_salesmen;

go

create proc get_all_salesmen as
begin
	select * from Salesmen
end

exec get_all_salesmen