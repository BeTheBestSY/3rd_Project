package product.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ProductMainController {

	private final String command = "/productMain.p";
	private final String viewPage = "productMain";

	@RequestMapping(command)
	public String doAction() {
		return viewPage;
	}
	
}