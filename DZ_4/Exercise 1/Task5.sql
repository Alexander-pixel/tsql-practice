if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_First_Sold_Item')
drop function FN_Get_First_Sold_Item;

go

create function FN_Get_First_Sold_Item ()
returns table
as
return (select * from Sales
		where purchuaseDate = (select min(purchuaseDate) from Sales))

-- Usage

select * from FN_Get_First_Sold_Item ()