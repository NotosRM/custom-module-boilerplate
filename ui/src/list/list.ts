import { Api, ListService, Ui } from "mdt-client";
import "./row-style.css";

export function prepareListExample() {
	// Подписка на событие создания списка
	ListService.onCreate((list) => {
		// Проверка, что текущая таблица - cmb.BooksData
		if (list.getObject().getCode() != "cmb.BooksData") return;

		/* Добавление дополнительных стилей для строк */
		list.addTransformerForRow((row) => {
			// Добавление класса строкам, у которых значение поля FlagRead равно true
			if (row.record.FlagRead) {
				row.addClass("row-book-read");
			}
		});

		// Добалвение команды на список
		list.addCommand({
			title: () => {
				if (list.getSelectedRows().length === 1) return "Прочитать";
				return "Выделите книгу";
			},
			// Если в списке выделена одна запись, то кнопка активна
			enabled: () => list.getSelectedRows().length === 1,
			type: "primary",
			execute: () => {
				// Получаем выделенную книгу
				const getBookId = () => list.getSelectedRows()[0].$id;
				Api.request(
					"cmb/read",
					{
						BookId: getBookId()
					},
					{ method: "POST" }
				).then(() => {
					list.refresh();
					Ui.showNotification(
						{
							title: "Успешно!",
							text: "Изменения внесены."
						},
						10000
					);
				});
			}
		});
	});
}
