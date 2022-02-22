if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Clients_Who_Turn_45')
drop function FN_Get_Clients_Who_Turn_45;

go

create function FN_Get_Clients_Who_Turn_45 ()
returns table
as
return (select * from Clients
		where datepart(year, GetDate()) - datepart(year, birthDate) = 45)

-- Usage

select * from FN_Get_Clients_Who_Turn_45 ()