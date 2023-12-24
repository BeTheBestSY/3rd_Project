package users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.UsersBean;
import users.model.UsersDao;

@Controller
public class UsersProfileContoller {
	private final String command = "profile.u";
	private final String viewPage = "usersProfileView";
	
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String profile(@RequestParam String u_id, Model model) {
		UsersBean ub = ud.getUserById(u_id);
		model.addAttribute("ub",ub);
		return viewPage;
	}
}
