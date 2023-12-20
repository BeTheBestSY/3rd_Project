package admin.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.model.AdminDao;
import users.model.UsersBean;
import utility.Paging;

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
	public String adUsers(@RequestParam(required = false) String filter,
						@RequestParam(required = false) String whatColumn,
						@RequestParam(required = false) String keyword,
						@RequestParam(required = false) String pageNumber,
						Model model,
						HttpServletRequest request) {
		System.out.println("필터:"+filter);
		System.out.println("페이지넘버:"+pageNumber);
		System.out.println("왓칼럼:"+whatColumn);
		if(keyword == null) keyword = "";
		System.out.println("키워드:"+keyword);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("filter", filter);
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = ad.getTotalUserCount(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		List<UsersBean> usersLists = ad.getUsers(map, pageInfo);
		model.addAttribute("usersLists", usersLists);
		model.addAttribute("pageInfo", pageInfo);
		
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
