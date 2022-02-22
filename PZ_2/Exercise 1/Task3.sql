USE [SportsShop]
GO

/****** Object:  Table [dbo].[Workers]    Script Date: 1/19/2022 11:06:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Workers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[f_name] [nvarchar](30) NOT NULL,
	[l_name] [nvarchar](30) NOT NULL,
	[position] [nvarchar](30) NOT NULL,
	[employmentDate] [date] NOT NULL,
	[sex] [nvarchar](10) NOT NULL,
	[salary] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [CK_Workers_FirstName_Not_Empty] CHECK  (([f_name]<>N''))
GO

ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [CK_Workers_FirstName_Not_Empty]
GO

ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [CK_Workers_LastName_Not_Empty] CHECK  (([l_name]<>N''))
GO

ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [CK_Workers_LastName_Not_Empty]
GO

ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [CK_Workers_Position_Not_Empty] CHECK  (([position]<>N''))
GO

ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [CK_Workers_Position_Not_Empty]
GO

ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [CK_Workers_Salary] CHECK  (([salary]>(0)))
GO

ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [CK_Workers_Salary]
GO

ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [CK_Workers_Sex_Not_Empty] CHECK  (([sex]<>N''))
GO

ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [CK_Workers_Sex_Not_Empty]
GO