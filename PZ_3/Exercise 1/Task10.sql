if exists (select 1 from sys.procedures where name = N'sp_get_power')
drop proc sp_get_power;

go

create proc sp_get_power @num int, @power int
as
begin
	select power(@num, @power);
end

exec sp_get_power 2, 3;