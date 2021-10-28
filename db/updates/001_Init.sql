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


