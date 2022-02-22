if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Last_Sold_Item')
drop function FN_Get_Last_Sold_Item;

go

create function FN_Get_Last_Sold_Item ()
returns table
as
return (select * from Sales
		where purchuaseDate = (select max(purchuaseDate) from Sales))

-- Usage

select * from FN_Get_Last_Sold_Item ()

