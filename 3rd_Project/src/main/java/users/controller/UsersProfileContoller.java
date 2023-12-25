package users.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

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
	private final String redirect = "redirect";
	
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String profile(@RequestParam String u_id, Model model) {
		UsersBean ub = ud.getUserById(u_id);
		if(ub == null) {
			model.addAttribute("msg", "탈퇴한 회원입니다.");
			return redirect;
		} 
		model.addAttribute("ub",ub);
		return viewPage;
	}
}
