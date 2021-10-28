using Mdt.Core.Data;
using Mdt.Core.Data.Query;
using Mdt.Core.Helpers;
using System;
using Mdt.Core.Logging;

namespace Goods
{
	public class GoodsService
	{
		public const string GoodsTable = "goods.GoodsData"; // Таблица с данными о товарах

		private const string ID = "ID"; // Ключевое поле таблицы
		private const string IsFragile = "IsFragile"; // Поля определяющее хрупкий товар или нет
		
		private readonly IDataRepository _rep;

		public GoodsService(IDataRepository rep)
			=> (_rep) = (rep);

		// Пометить товар, как хрупкий, либо сделать снять метку
		public void Fragile(int recordId)
		{
			// Получаем запись с товаром
			var goodsRecord = _rep.GetOne(GoodsTable, Filter.Eq(ID, recordId));
			// Получаем значение поля IsFragile
			var IsFragileValue = goodsRecord.GetValue<bool>(IsFragile);
			// Задаем обратное значение
			goodsRecord.SetValue(IsFragile, !IsFragileValue);
			_rep.Update(GoodsTable, goodsRecord);
		}

	}
}
