USE [SportsShop]
GO

/****** Object:  Table [dbo].[Clients]    Script Date: 1/19/2022 11:07:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Clients] (
	[id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [nvarchar](30) NOT NULL,
	[l_name] [nvarchar](30) NOT NULL,
	[address] [nvarchar](30) NOT NULL,
	[phone] [nvarchar](30) NOT NULL,
	[sex] [nvarchar](10) NOT NULL,
	[isSubscibed] [bit] NOT NULL,
	[discount] [int] NOT NULL,
	[registrationDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [CK_Clients_Address_Not_Empty] CHECK  (([address]<>N''))
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [CK_Clients_Address_Not_Empty]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [CK_Clients_Discount_Value] CHECK  (([discount]>=(0)))
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [CK_Clients_Discount_Value]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [CK_Clients_FirstName_Not_Empty] CHECK  (([f_name]<>N''))
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [CK_Clients_FirstName_Not_Empty]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [CK_Clients_LastName_Not_Empty] CHECK  (([l_name]<>N''))
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [CK_Clients_LastName_Not_Empty]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [CK_Clients_Phone_Not_Empty] CHECK  (([phone]<>N''))
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [CK_Clients_Phone_Not_Empty]
GO

ALTER TABLE [dbo].[Clients]  WITH CHECK ADD  CONSTRAINT [CK_Clients_Sex_Not_Empty] CHECK  (([sex]<>N''))
GO

ALTER TABLE [dbo].[Clients] CHECK CONSTRAINT [CK_Clients_Sex_Not_Empty]
GO