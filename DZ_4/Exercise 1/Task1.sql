if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Unique_Clients_Number')
drop function FN_Get_Unique_Clients_Number;

go

create function FN_Get_Unique_Clients_Number()
returns int
as
begin
	return (select count(*) from Clients)
end