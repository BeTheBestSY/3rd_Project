package users.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.UsersBean;
import users.model.UsersDao;

@Controller
public class UsersMypageController {
	private final String command = "/mypage.u";
	private final String viewPage = "usersMypage";
	
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam String u_id) {
		//ud.getUser(u_id);
		return viewPage;
	}
	
}
