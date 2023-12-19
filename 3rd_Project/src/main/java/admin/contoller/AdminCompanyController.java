package admin.contoller;

import java.io.IOException;
import java.io.PrintWriter;
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

import admin.model.AdminDao;
import company.model.CompanyBean;
import company.model.CompanyDao;
import users.model.UsersBean;
import utility.Paging;

@Controller
public class AdminCompanyController {

	private final String command = "/companyList.admin";
	private String viewPage = "adminCompany";
	private final String deleteCommand = "/companyDelete.admin";
	private String gotoPage = "redirect:/companyList.admin";
	private final String updateCommand = "/companyUpdate.admin";
	private String formPage = "adminCompanyUpdateForm";
	
	@Autowired
	private AdminDao admindao;
	
	@RequestMapping(value = command)
	public String list(
			@RequestParam(value = "oneName", required = false) String oneName,
			@RequestParam(value = "oneX", required = false) String oneX,
			@RequestParam(value = "oneY", required = false) String oneY,
			@RequestParam(value = "whatColumn", required = false) String whatColumn,
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value ="pageNumber", required = false) String pageNumber,
			@RequestParam(required = false) String filter,
			HttpServletRequest request,
			Model model) {
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		map.put("filter", filter); 
		
		int totalCount = admindao.getTotalCountCompany(map);
		String url = request.getContextPath()+command;
		String ps="1000";
		 
		Paging pageInfo = new Paging(pageNumber, ps, totalCount, url, whatColumn, keyword);
		
		List<CompanyBean> list = admindao.getAllCompany(pageInfo,map);
			
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword", keyword);
		model.addAttribute("oneY", oneY);
		model.addAttribute("oneX", oneX);
		model.addAttribute("oneName", oneName);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword", keyword);
		
		return viewPage;	
	}
	
	@RequestMapping(value=updateCommand)
	public String updateForm(@RequestParam("cmp_num") int cmp_num, Model model) {
		CompanyBean bb = admindao.getSelectOneCompany(cmp_num);
		model.addAttribute("bb", bb);
		return formPage;
	}
	
	@RequestMapping(value = updateCommand, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute(value = "bb") CompanyBean bb, 
							HttpServletResponse response, 
							HttpSession session, 
							Model model) throws IOException {
		admindao.updateCompany(bb);
		System.out.println("변경 후 회사명 :"+ bb.getCmp_name());
		model.addAttribute("bb", bb);
		return gotoPage;
	} 
	
	
	@RequestMapping(value=deleteCommand,method=RequestMethod.GET)
	public String delete(
				Model model,
				@RequestParam("cmp_num") int cmp_num,
				@RequestParam("pageNumber") int pageNumber
			) {
		
		CompanyBean bb = admindao.getSelectOneCompany(cmp_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		
		admindao.deleteCompany(cmp_num);
		
		return gotoPage;
	}
	
}
