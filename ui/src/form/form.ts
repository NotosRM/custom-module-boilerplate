import { FormService, Ui } from "mdt-client";

export function prepareFormExample() {
	// Подписка на событие создания формы
	FormService.onCreate((form) => {
		// Проверка, что текущая таблица - cmb.BooksData
		if (form.getObject().getCode() != "cmb.BooksData") return;

		// Добавление на форму команды вывода сообщения
		form.addCommand({
			title: "Вывести код книги",
			type: "info",
			// Отображать кнопку только для существующих записей
			visible: () => !form.isNewRecord(),
			execute: () => {
				Ui.showNotification(
					{
						title: "ISBN",
						text: form.value("ISBN")
					},
					10000
				);
			}
		});

		// Установка опций для поля формы
		form.setFieldOptions({
			// Отображать поле ISBN только для новой записи
			ISBN: {
				visible$: () => form.isNewRecord()
			}
		});
	});
}
