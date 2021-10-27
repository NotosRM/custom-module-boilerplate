import { Api, FormService, Ui } from "mdt-client";

export function prepareFormExample() {
	// Подписка на событие создания формы
	FormService.onCreate((form) => {
		console.log(form.getObject().getCode());

		// Проверка, что текущая таблица - goods.VIEW_GoodsInfo
		if (form.getObject().getCode() != "goods.VIEW_GoodsInfo") return;
		// Добавление на форму команды вывода сообщения
		form.addCommand({
			title: () => (form.value("IsMark") ? "Снять с акции" : "Сделать акционным продуктом"),
			type: "primary",
			execute: () => {
				Api.request(
					"goods/promo",
					{
						RecordId: form.value("ID")
					},
					{ method: "POST" }
				).then(() => {
					Ui.showNotification(
						{
							title: "Успех!",
							text: "Изменения внесены"
						},
						10000
					);
				});
			}
		});
	});
}
