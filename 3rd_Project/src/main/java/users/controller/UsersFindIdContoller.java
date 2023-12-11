package users.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import users.model.UsersBean;
import users.model.UsersDao;

@Controller
public class UsersFindIdContoller {
	private final String command = "/findid.u";
	private final String viewPage = "usersFindIdForm";
	private final String viewPage2 = "usersFindIdResView";
	
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute("ub") UsersBean ub) {
		String u_phone = ub.getU_phone().replace(",","-"); // 010-1234-5678
		ub.setU_phone(u_phone);
		
		String u_id = ud.findId(ub);
		ub.setU_id(u_id);
		return viewPage2;
	}
}
