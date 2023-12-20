
package admin.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import celeb.model.CelebBean;
import company.model.CompanyBean;
import product.model.ProductBean;
import q_board.model.QBoardBean;
import utility.Paging;

@Controller
public class AdminCelebController {
	private final String command = "/celebList.admin";
	private final String viewPage = "adminCeleb";
	private final String deleteCommand = "/celebDelete.admin";
	private final String gotoPage = "redirect:/celebList.admin";
	private final String insertCommand = "/celebInsert.admin";
	private String insertFormPage = "adminCelebInsertForm";
	private final String updateCommand = "/celebUpdate.admin";
	private String updateformPage = "adminCelebUpdateForm";
	
	@Autowired
	private AdminDao adminDao;
	
	@RequestMapping(value=command)
	public String list(Model model,
					HttpServletRequest request,
					@RequestParam(required = false) String whatColumn,
					@RequestParam(required = false) String keyword,
					@RequestParam(required = false) String filter,
					@RequestParam(required = false) String pageNumber) throws UnsupportedEncodingException {

		 request.setCharacterEncoding("UTF-8");
		if(keyword == null) keyword = "";
		Map<String, String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		map.put("filter", filter); 
		System.out.println(whatColumn+","+keyword+","+filter);
		String ps="1000";
		 
		int totalCount = adminDao.getCeleb(map);
		String url = request.getContextPath()+command;
		Paging pageInfo = new Paging(pageNumber, ps, totalCount, url, whatColumn, keyword);
		
		List<CelebBean> celebLists = adminDao.getAllCelebList(map, pageInfo);
		model.addAttribute("celebLists",celebLists);
		model.addAttribute("pageInfo", pageInfo); 
		return viewPage;
	}
	
	@RequestMapping(value = insertCommand, method = RequestMethod.GET)
	public String insertForm() {
		return insertFormPage;
	}
	
	@RequestMapping(value = insertCommand, method = RequestMethod.POST)
	public String in(@ModelAttribute("bb") CelebBean bb,
						HttpServletResponse response) throws IOException {
		adminDao.insertCeleb(bb);
		return gotoPage;
		
	}
	
	
	
	@RequestMapping(value=updateCommand)
	public String updateForm(@RequestParam("cl_num") int cl_num, Model model) {
		CelebBean bb = adminDao.getSelectOneCeleb(cl_num);
		model.addAttribute("bb", bb);
		return updateformPage;
	}
	
	@RequestMapping(value = updateCommand, method = RequestMethod.POST)
	public String update(@ModelAttribute(value = "bb") CelebBean bb,
						HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		
		adminDao.updateCeleb(bb);
		model.addAttribute("bb", bb);
		return gotoPage;
	} 
	
	@RequestMapping(value=deleteCommand,method=RequestMethod.GET)
	public String delete(
				Model model,
				@RequestParam("cl_num") int cl_num,
				@RequestParam("pageNumber") int pageNumber
			) {
		
		CelebBean bb = adminDao.getSelectOneCeleb(cl_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		
		adminDao.deleteCeleb(cl_num);
		
		return gotoPage;
	}
}
