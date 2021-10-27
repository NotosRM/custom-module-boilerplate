import { Api, FormService, Ui } from "mdt-client";

export function prepareFormExample() {
	// Подписка на событие создания формы
	FormService.onCreate((form) => {
		console.log(form.getObject().getCode());

		// Проверка, что текущая таблица - ep.Event
		if (form.getObject().getCode() != "mdt.view_GoodsInfo") return;
		// Добавление на форму команды вывода сообщения
		form.addCommand({
			title: () => (form.value("IsMark") ? "Снять с акции" : "Сделать акционным продуктом"),
			execute: () => {
				Api.request(
					"ep/postpone",
					{
						RecordIds: form.value("ID")
					},
					{ method: "POST" }
				).then(() => {
					Ui.showNotification(
						{
							title: "Успешно!",
							text: "Товар помечен"
						},
						10000
					);
				});
			}
		});
	});
}
