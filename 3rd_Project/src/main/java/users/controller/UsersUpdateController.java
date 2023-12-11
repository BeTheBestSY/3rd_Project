package users.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.UsersBean;
import users.model.UsersDao;

@Controller
public class UsersUpdateController {
	private final String command = "/update.u";
	private final String viewPage = "usersUpdateForm";
	private final String viewPage2 = "usersMypage";
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam String u_id, Model model) {
		
		UsersBean ub = ud.getUserById(u_id);
		model.addAttribute("ub",ub);
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute(value = "ub") UsersBean ub) {
		String u_phone = ub.getU_phone().replace(",","-"); // 010-1234-5678
		ub.setU_phone(u_phone);
		ud.updateUsers(ub);
		// alert('수정되었습니다.');
		// alert('수정 실패');
		return viewPage2;
	}
}