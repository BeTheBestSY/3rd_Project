package users.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import users.model.UsersBean;
import users.model.UsersDao;

@Controller
public class UsersFindPwContoller {
	private final String command = "/findpw.u";
	private final String viewPage = "usersFindPwForm";
	private final String gotoPage = "redirect:/email.u";
	private final String redirect = "redirect";
	
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute UsersBean ub,
						Model model) {

		String toEmail = ud.getEmail(ub);
		if(toEmail.equals("null")) {
			model.addAttribute("msg", "회원정보에서 이메일을 기입해주세요.");
			model.addAttribute("url", "findpw.u");
			return redirect;
		}
		return gotoPage + "?toEmail="+toEmail;
	}
}
