package color.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import color.model.ColorDao;


@Controller
public class ColorListController {
	
	@Autowired
	private ColorDao colorDao;
	private final String command = "/list.col";
	private final String viewPage = "main";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		return viewPage;
	}
}
