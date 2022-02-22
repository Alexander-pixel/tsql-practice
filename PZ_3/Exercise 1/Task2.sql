create proc sp_get_current_time
as
begin
	select GetDate();
end