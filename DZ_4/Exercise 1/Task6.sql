if exists (select 1 from sys.objects where type in ('FN', 'IF', 'TF') and name = 'FN_Get_Items_By_Manufacturer_And_Type')
drop function FN_Get_Items_By_Manufacturer_And_Type;

go

create function FN_Get_Items_By_Manufacturer_And_Type (
				@type nvarchar(50), @manufacturer nvarchar(50))
returns table
as
return (select * from Items
		where type = @type
		and manufacturer = @manufacturer)

-- Usage

select * from FN_Get_Items_By_Manufacturer_And_Type ('Clothes', 'Manufacturer_2')