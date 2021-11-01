import { Navigation } from "mdt-client";

/* Добавление новых узлов навигации */

export function prepareNavigation() {
	// Добавление узла с дочерними узлами
	Navigation.addNode({
		title: "Список книг",
		code: "BooksData",
		icon: "book",
		objectCode: "cmb.BooksData"
	});
}
