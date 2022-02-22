USE [SportsShop]
GO

/****** Object:  Table [dbo].[Sales]    Script Date: 1/19/2022 11:05:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sales] (
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itemId] [int] NULL,
	[quantity] [int] NOT NULL,
	[clientId] [int] NULL,
	[sellerId] [int] NULL,
	[purchuaseDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([clientId])
REFERENCES [dbo].[Clients] ([id])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([itemId])
REFERENCES [dbo].[Items] ([id])
GO

ALTER TABLE [dbo].[Sales]  WITH CHECK ADD FOREIGN KEY([sellerId])
REFERENCES [dbo].[Workers] ([id])
ON DELETE CASCADE
GO