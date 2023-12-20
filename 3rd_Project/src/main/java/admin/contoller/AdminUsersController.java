package admin.contoller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

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
		System.out.println("totalCount:"+totalCount);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		
		String[] a = pageInfo.getPagingHtml().split("&nbsp;");
		Vector<Integer> indexVector = new Vector<Integer>();
		System.out.println();
		for(int i=0; i<a.length; ++i) {
			System.out.println(i+"번째 pagingHtml:"+a[i]);
			int index = a[i].indexOf("' style");
			while (index >= 0) {
				System.out.println("문자열 \"' style\"의 위치: " + index);
			    index = a[i].indexOf("' style", index + 1);
			    indexVector.add(index);
			}
		}
//		if(pageInfo.getBeginPage() != 1) {
//			// 여러개의 <a>태그로 이루어진 pagingHtml을 우선 쪼갠다.
//			// style이라는 문자열을 찾아서(indexOf). 그 앞에다가 filter를 쿼리스트링으로 삽입
//		}
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
