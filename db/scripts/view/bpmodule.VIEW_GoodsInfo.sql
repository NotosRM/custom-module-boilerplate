IF NOT EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[goods].[VIEW_GoodsInfo]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW goods.VIEW_GoodsInfo
AS
SELECT NULL [ID]'
GO
ALTER VIEW [goods].[VIEW_GoodsInfo]
AS
    SELECT goods.GoodsData.ID, goods.GoodsData.Name, goods.GoodsData.Price, goods.Warehouse.BoxesAmount * goods.Warehouse.ItemsPerBox AS Count, IsPromo
    FROM goods.Warehouse INNER JOIN
        goods.GoodsData ON goods.Warehouse.ID = goods.GoodsData.ID

