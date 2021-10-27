using Mdt.Core;

namespace Goods.Controllers
{
	/* 
		Класс-контроллер должен наследоваться от IController
		обращение к методам, происходит по /<имя контроллера>/<имя метода>
		где имя контроллера, это имя класса без "Controller" в конце
	*/
	public class GoodsController : IController
	{
		private readonly GoodsService _gs;

		public GoodsController(GoodsService gs)
			=> _gs = gs;

		public class MarkRequest
		{
			public int recordId;
		}

		// /goods/mark
		public void Mark(MarkRequest req)
		{
			_gs.Mark(req.recordId);
		}
	}
}
