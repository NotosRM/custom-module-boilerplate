IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[mdt].[view_GoodsInfo]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW mdt.view_GoodsInfo
AS
SELECT NULL [ID]'
GO
ALTER VIEW [mdt].[view_GoodsInfo]
AS
SELECT mdt.GoodsData.ID, mdt.GoodsData.Name, mdt.GoodsData.Price, mdt.Warehouse.BoxesAmount * mdt.Warehouse.ItemsPerBox AS Count, IsMark
FROM     mdt.Warehouse INNER JOIN
                  mdt.GoodsData ON mdt.Warehouse.ID = mdt.GoodsData.ID

