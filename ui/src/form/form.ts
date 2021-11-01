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
	});
}
