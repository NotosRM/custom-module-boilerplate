import { ListService } from "mdt-client";
import "./row-style.css";

export function prepareListExample() {
	// Подписка на событие создания списка
	ListService.onCreate((list) => {
		console.log(list.getObject().getCode());
		// Проверка, что текущая таблица - ep.Event
		if (list.getObject().getCode() != "mdt.view_GoodsInfo") return;

		/* Добавление дополнительных стилей для строк */
		list.addTransformerForRow((row) => {
			// Добавление класса строкам, у которых значение поля IsPromo равно true
			if (row.record.IsMark) {
				row.addClass("row-promo");
			}
		});
	});
}
