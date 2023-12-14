package admin.contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import users.model.UsersBean;

@Controller
public class AdminUsersController {
	private final String command = "/adminUsersList.admin";
	private final String viewPage = "adminUsers";
//	private final String gotoPage = "";
	
	@Autowired
	private AdminDao ad;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String adUsers(Model model) {
		List<UsersBean> usersLists = ad.getUsers();
		model.addAttribute("usersLists", usersLists);
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String adUsers2(@RequestParam(required = false) String whatColumn,
						@RequestParam(required = false) String keyword,
						Model model) {
		
		List<UsersBean> usersLists = ad.getUsers();
		model.addAttribute("usersLists", usersLists);
		return viewPage;
	}
}
