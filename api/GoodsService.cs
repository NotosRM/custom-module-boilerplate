using Mdt.Core.Data;
using Mdt.Core.Data.Query;
using Mdt.Core.Helpers;
using System;
using Mdt.Core.Logging;

namespace Goods
{
	public class GoodsService
	{
		public const string GoodsTable = "mdt.GoodsData";

		private readonly IDataRepository _rep;

		public GoodsService(IDataRepository rep) 
			=> (_rep) = (rep);


		public void Mark(int recordId)
		{
			var good = _rep.GetOne(GoodsTable,	Filter.Eq("ID", recordId));
			good.SetValue("IsMark", !good.GetValue<bool>("IsMark"));
			_rep.Update(GoodsTable, good);
		}

	}
}
