package users.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import c_board.model.CBoardBean;
import c_board.model.CBoardDao;
import users.model.UsersBean;
import users.model.UsersDao;


@Controller
public class UsersAskContoller {
	private final String command = "/ask.u";
	private final String viewPage = "usersAsk";
	
	@Autowired
	private UsersDao ud; 
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(Model model) {
		return viewPage;
	}
	
	public String insert(Model model) {
		
		return viewPage;
	}
	
}
