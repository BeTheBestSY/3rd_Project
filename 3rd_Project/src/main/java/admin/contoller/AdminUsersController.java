package admin.contoller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

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
	private final String redirect = "redirect";
	@Autowired
	private AdminDao ad;
	
	@RequestMapping(value = command)
	public String adUsers(@RequestParam(required = false) String filter,
						@RequestParam(required = false) String whatColumn,
						@RequestParam(required = false) String keyword,
						@RequestParam(required = false) String pageNumber,
						Model model,
						HttpServletRequest request) {
		
		System.out.println("\n=======usersList.admin 요청=======");
		
		if(filter == null) {
			filter = "";
		}
		System.out.println("필터:"+filter);
		System.out.println("페이지넘버:"+pageNumber);
		System.out.println("왓칼럼:"+whatColumn);
		System.out.println("키워드:"+keyword);
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("filter", filter);
		map.put("whatColumn", whatColumn);
		if(keyword == null || keyword.equals("")) {
			keyword = "";
			map.put("keyword", keyword);
		} else{
			map.put("keyword", "%"+keyword+"%");
		}
		
		//int totalCount = ad.getTotalUserCount(map);
		//System.out.println("토탈카운트:"+totalCount);
		//String url = request.getContextPath()+command;
		//Paging pageInfo = new Paging(pageNumber, "10", totalCount, url, whatColumn, keyword);
		
		// --------------- pagingHtml에 filter 쿼리스트링 추가하기 --------------- 
		//String pagingHtml = pageInfo.getPagingHtml();
		//System.out.println("\n원래 pagingHtml:"+pagingHtml);
		//ArrayList<Integer> indexes = new ArrayList<Integer>(); // 찾은 인덱스들을 저장할 ArrayList
		//StringBuffer pagingSB = new StringBuffer(pagingHtml); // pagingHtml 중간에 문자열을 삽입하기 위한 StringBuffer
		
		//Matcher matcher = Pattern.compile("' style").matcher(pagingHtml);
		/*
		while (matcher.find()) {
			System.out.println("원래 인덱스:"+matcher.start());
			indexes.add(matcher.start());
		}
		
		
		String queryParam = "&filter="+filter;
		System.out.println("\nfilter쿼리스트링의 길이:"+queryParam.length());
		for(int i=0; i<indexes.size(); ++i) {//Integer idx:indexes
			int idx = indexes.get(i);
			idx += queryParam.length()*i;
			System.out.println("쿼리스트링의 길이가 반영된 인덱스:"+idx);
			indexes.set(i, idx);
			pagingSB.insert(idx, queryParam);
		}
		System.out.println("filter파라미터가 추가된 pagingHtml:"+pagingSB.toString());
		pageInfo.setPagingHtml(pagingSB.toString());
		// -----------------------------------------------------------------
		*/
		
		//List<UsersBean> usersLists = ad.getUsers(map, pageInfo);
		List<UsersBean> usersLists = ad.getUsers(map);
		model.addAttribute("usersLists", usersLists);
		//model.addAttribute("pageInfo", pageInfo);
		
		return viewPage;
	}
	@RequestMapping(value = delCommand)
	public String delete(@RequestParam String u_id,
						@RequestParam String u_jointype,
						Model model) {
		ad.deleteUsers(u_id);
		if(u_jointype.equals("N")) {
			// 네이버 연동 해제
			model.addAttribute("msg", u_id.substring(0, 11)+"...(네이버)님이 탈퇴되었습니다.");
			model.addAttribute("url", "disnaver.u?admin=yes");
		} else if(u_jointype.equals("K")) {
			// 카카오 연동 해제
			model.addAttribute("msg", u_id+"(카카오)님이 탈퇴되었습니다.");
			model.addAttribute("url", "diskakao.u?admin=yes");
		} else {
			model.addAttribute("msg", u_id+"님이 탈퇴되었습니다.");
			model.addAttribute("url", ".admin");
		}
		return redirect;
	}
	@RequestMapping(value = upCommand)
	public String update(@RequestParam String u_id, Model model) {
		UsersBean ub = ad.getUserById(u_id);
		model.addAttribute("ub", ub);
		return viewPage2;
	}
}
