using Mdt.Core;

namespace Books.Controllers
{
    /* 
		Класс-контроллер должен наследоваться от IController
		обращение к методам, происходит по /<имя контроллера>/<имя метода>
		где имя контроллера, это имя класса без "Controller" в конце
	*/
    public class BooksController : IController
    {
        private readonly BooksService _gs;

        public BooksController(BooksService gs)
            => _gs = gs;

        public class ReadRequest
        {
            public int BookId;
        }

        // /books/read
        public void Read(ReadRequest req)
        {
            _gs.Read(req.BookId);
        }
    }
}
