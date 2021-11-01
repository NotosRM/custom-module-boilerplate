using Mdt.Core.Data;
using Mdt.Core.Data.Query;

namespace Books
{
    public class BooksService
    {
        public const string BooksTable = "cmb.BooksData"; // Таблица с данными о книгах

        private const string ID = "ID"; // Ключевое поле таблицы
        private const string FlagRead = "FlagRead"; // Поля определяющее прочитана книга или нет

        private readonly IDataRepository _rep;

        public BooksService(IDataRepository rep)
            => (_rep) = (rep);

        // Пометить книги как прочитанные 
        public void Read(int BookId)
        {
            // Получаем запись книги
            var book = _rep.GetOne(BooksTable, Filter.Eq(ID, BookId));
            // Помечаем книгу, как прочитанную
            book.SetValue(FlagRead, true);
            // Обновляем таблицу новыми данными
            _rep.Update(BooksTable, book);
        }

    }
}
