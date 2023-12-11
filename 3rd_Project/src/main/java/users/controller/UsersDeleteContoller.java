package users.controller;


import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.UsersDao;

@Controller
public class UsersDeleteContoller {
	private final String command = "/delete.u";
	private final String gotoPage = "redirect";
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam String u_id, Model model, HttpSession session) throws IOException {
		ud.deleteUsers(u_id);
		session.invalidate();
		model.addAttribute("msg", "탈퇴처리되었습니다. 그동안 이용해주셔서 감사합니다.");
		model.addAttribute("url", ".main");
		return gotoPage;
	}
}
