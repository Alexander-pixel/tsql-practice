if exists (select 1 from sys.procedures where name = N'sp_get_current_date')
drop proc sp_get_current_date

go

create proc sp_get_current_date
as
begin
	select convert(nvarchar, datepart(DAY, GetDate())) + N'/' +
		   convert(nvarchar, datepart(MONTH, GetDate())) + N'/' + 
 		   convert(nvarchar, datepart(YEAR, GetDate())) 
		   as [Current Date];
end