if not exists (select *
from sys.schemas
where name = N'goods')
	exec('create schema [goods]')
go

if object_id('[goods].[Warehouse]') is null
begin
	CREATE TABLE [goods].[Warehouse]
	(
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[BoxesAmount] [int] NOT NULL,
		[ItemsPerBox] [int] NOT NULL,
		CONSTRAINT [PK_goods_Warehouse] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
end
else
begin
	delete from [goods].[Warehouse]
END

go

if object_id('[goods].[GoodsData]') is null
begin
	CREATE TABLE [goods].[GoodsData]
	(
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[Name] [varchar](100) COLLATE Cyrillic_General_CI_AS NOT NULL,
		[Price] [int] NOT NULL,
		[IsFragile] [bit] NOT NULL,
		CONSTRAINT [PK_goods_GoodsExample] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
	ALTER TABLE [goods].[GoodsData] ADD  CONSTRAINT [DF_goods_GoodsExample_IsFragile]  DEFAULT (N'false') FOR [IsFragile]
	ALTER TABLE [goods].[GoodsData] ADD CONSTRAINT [UQ_goods_GoodsData_Name] UNIQUE ([Name])
end
else
begin
	delete from [goods].[GoodsData]
END


GO
SET IDENTITY_INSERT [goods].[GoodsData] ON 
GO
INSERT [goods].[GoodsData]
	([ID], [Name], [Price], [IsFragile])
VALUES
	(1, N'Альбом', 95, 0)
GO
INSERT [goods].[GoodsData]
	([ID], [Name], [Price], [IsFragile])
VALUES
	(2, N'Гарнитура', 15, 0)
GO
INSERT [goods].[GoodsData]
	([ID], [Name], [Price], [IsFragile])
VALUES
	(3, N'Граненный стакан', 215, 1)
GO
INSERT [goods].[GoodsData]
	([ID], [Name], [Price], [IsFragile])
VALUES
	(4, N'Карандаш', 21, 0)
GO
INSERT [goods].[GoodsData]
	([ID], [Name], [Price], [IsFragile])
VALUES
	(5, N'Ластик', 32, 0)
GO
SET IDENTITY_INSERT [goods].[GoodsData] OFF
GO
SET IDENTITY_INSERT [goods].[Warehouse] ON 
GO
INSERT [goods].[Warehouse]
	([ID], [BoxesAmount], [ItemsPerBox])
VALUES
	(1, 1, 11)
GO
INSERT [goods].[Warehouse]
	([ID], [BoxesAmount], [ItemsPerBox])
VALUES
	(2, 3, 90)
GO
INSERT [goods].[Warehouse]
	([ID], [BoxesAmount], [ItemsPerBox])
VALUES
	(3, 1, 9)
GO
INSERT [goods].[Warehouse]
	([ID], [BoxesAmount], [ItemsPerBox])
VALUES
	(4, 2, 60)
GO
INSERT [goods].[Warehouse]
	([ID], [BoxesAmount], [ItemsPerBox])
VALUES
	(5, 1, 40)
GO
SET IDENTITY_INSERT [goods].[Warehouse] OFF
GO
