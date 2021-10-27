import { Navigation } from "mdt-client";

/* Добавление новых узлов навигации */

export function prepareNavigation() {
	// Добавление узла с дочерними узлами
	Navigation.addNode({
		title: "Товары",
		code: "GoodsInfo",
		icon: "trailer",
		objectCode: "goods.VIEW_GoodsInfo"
	});
}
