package color.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import color.model.ColorBean;
import color.model.ColorDao;


@Controller
public class ColorDetailController {
	
	@Autowired
	private ColorDao colorDao;
	private final String command_spring = "/spring.col";
	private final String command_summer = "/summer.col";
	private final String command_autumn = "/autumn.col";
	private final String command_winter = "/winter.col";
	private final String viewPage_spring = "colSpring";
	private final String viewPage_summer = "colSummer";
	private final String viewPage_autumn = "colAutumn";
	private final String viewPage_winter = "colWinter";
	
	@RequestMapping(value=command_spring, method=RequestMethod.GET)
	public String spring(Model model) {
		ColorBean cbsl = colorDao.getSl();
		ColorBean cbsb = colorDao.getSb();
		model.addAttribute("cbsl", cbsl);
		model.addAttribute("cbsb", cbsb);
		return viewPage_spring;
	}
	
	@RequestMapping(value=command_summer, method=RequestMethod.GET)
	public String summer() {
		return viewPage_summer;
	}
	
	@RequestMapping(value=command_autumn, method=RequestMethod.GET)
	public String autumn() {
		return viewPage_autumn;
	}
	
	@RequestMapping(value=command_winter, method=RequestMethod.GET)
	public String winter() {
		return viewPage_winter;
	}

}
