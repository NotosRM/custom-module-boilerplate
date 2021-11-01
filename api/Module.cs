using Mdt.Core;
using Mdt.Core.Data.Updating;

namespace Books
{
    // Чтобы подхватился модуль нужен класс, который наследуется от IModule
    public class Module : IModule
    {
        // Статический метод Startup нужен, если мы хотим зарегистрировать свои сервисы в DI
        static void Startup(IServiceRegistry sr)
        {
            // Регистрируем сервис
            sr.Register<BooksService>(ServiceLifetime.Application);
        }

        public Module(RecordRegistry rr, BooksService gs)
        {

        }
    }
}
