using Mdt.Core.Data;
using Mdt.Core.Data.Query;

namespace Goods
{
	public class GoodsService
	{
		public const string GoodsTable = "goods.GoodsData";

		private readonly IDataRepository _rep;

		public GoodsService(IDataRepository rep) 
			=> (_rep) = (rep);


		public void Promo(int recordId)
		{
			var goodsRecord = _rep.GetOne(GoodsTable,	Filter.Eq("ID", recordId));
			goodsRecord.SetValue("IsPromo", !goodsRecord.GetValue<bool>("IsPromo"));
			_rep.Update(GoodsTable, goodsRecord);
		}

	}
}
