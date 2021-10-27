import { prepareNavigation } from "./navigation/navigation";
import { prepareFormExample } from "./form/form";
import { prepareListExample } from "./list/list";
import { registerModule } from "mdt-client";

registerModule(() => {
	prepareFormExample();
	prepareListExample();
	prepareNavigation();
});
