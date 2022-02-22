if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Average_Price_By_Each_Date')
drop function FN_Get_Average_Price_By_Each_Date;

go

create function FN_Get_Average_Price_By_Each_Date (@title nvarchar(50))
returns table
as
return (select Sales.purchuaseDate, avg(Items.salePrice) as [Average] from Sales			
		join Items on Items.id = Sales.itemId
		group by Sales.purchuaseDate)

-- Usage

select * from FN_Get_Average_Price_By_Each_Date ('Title')