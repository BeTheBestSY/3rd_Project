package admin.contoller;

import java.io.UnsupportedEncodingException;
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
import celeb.model.CelebBean;
import celeb.model.CelebDao;
import utility.Paging;

@Controller
public class AdminCelebController {
	
	private final String celebCommand = "/celebList.admin";
	private final String viewPage = "adminCeleb";
	
	@Autowired
	private AdminDao adminDao;
	
	@RequestMapping(value=celebCommand)
	public String celebList(Model model,
					HttpServletRequest request,
					@RequestParam(required = false) String whatColumn,
					@RequestParam(required = false) String keyword,
					@RequestParam(required = false) String pageNumber) throws UnsupportedEncodingException {

		 request.setCharacterEncoding("UTF-8");
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		System.out.println(whatColumn+","+keyword);
		String ps="1000";
		 
		int totalCount = adminDao.getTotalCountCeleb(map);
		String url = request.getContextPath()+celebCommand;
		Paging pageInfo = new Paging(pageNumber, ps, totalCount, url, whatColumn, keyword);
		
		List<CelebBean> celebLists = adminDao.getAllCelebList(map, pageInfo);
		model.addAttribute("celebLists",celebLists);
		model.addAttribute("pageInfo", pageInfo); 
		return viewPage;
	}
	
}
