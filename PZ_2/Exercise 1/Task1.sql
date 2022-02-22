USE [SportsShop]
GO

/****** Object:  Table [dbo].[Items]    Script Date: 1/19/2022 11:04:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Items] (
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](20) NOT NULL,
	[quantity] [int] NOT NULL,
	[costPrice] [int] NOT NULL,
	[manufacturer] [nvarchar](30) NOT NULL,
	[salePrice] [int] NOT NULL,
	[title] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Items] ADD  DEFAULT ('Title') FOR [title]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD CHECK  (([title]<>N''))
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [CK_Items_CostPrice_Value] CHECK  (([costPrice]>=(0)))
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [CK_Items_CostPrice_Value]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [CK_Items_FirstName_Not_Empty] CHECK  (([type]<>N''))
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [CK_Items_FirstName_Not_Empty]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [CK_Items_Manufacturer_Not_Empty] CHECK  (([manufacturer]<>N''))
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [CK_Items_Manufacturer_Not_Empty]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [CK_Items_Quantity_Value] CHECK  (([quantity]>=(0)))
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [CK_Items_Quantity_Value]
GO

ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [CK_Items_SalePrice_Value] CHECK  (([salePrice]>=(0)))
GO

ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [CK_Items_SalePrice_Value]
GO