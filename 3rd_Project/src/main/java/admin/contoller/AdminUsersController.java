package admin.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	private final String command = "/usersList.admin";
	private final String delCommand = "/usersDelete.admin";
	private final String upCommand = "/usersUpdate.admin";
	
	private final String viewPage = "adminUsers";
	private final String viewPage2 = "adminUsersUpdateForm";
	
	@Autowired
	private AdminDao ad;
	
	@RequestMapping(value = command)
	public String adUsers(@RequestParam(required = false) String whatColumn,
						@RequestParam(required = false) String keyword,
						Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		List<UsersBean> usersLists = ad.getUsers(map);
		model.addAttribute("usersLists", usersLists);
		
		return viewPage;
	}
	@RequestMapping(value = delCommand)
	public String delete(@RequestParam String u_id) {
		ad.deleteUsers(u_id);
		return "redirect:"+command;
	}
	@RequestMapping(value = upCommand)
	public String update(@RequestParam String u_id, Model model) {
		UsersBean ub = ad.getUserById(u_id);
		model.addAttribute("ub", ub);
		return viewPage2;
	}
}
