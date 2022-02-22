if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Average_Price_Of_Item')
drop function FN_Get_Average_Price_Of_Item;

go

create function FN_Get_Average_Price_Of_Item (@title nvarchar(50))
returns int
as
begin
	return (select avg(salePrice) from Items
			where Items.title = @title)
end