package admin.contoller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.model.AdminDao;
import q_board.model.QBoardBean;
import utility.Paging;

@Controller
public class AdminQBoardController {

	@Autowired
	private AdminDao adminDao;

	public final String listCommand="/qBoardList.admin";
	public final String viewPage="adminQBoard";
	public final String deleteCommand="/qBoardDelete.admin";
	public final String gotoPage="redirect:/qBoardList.admin";
	
	@RequestMapping(value=listCommand,method=RequestMethod.GET)
	public String goAdmin(
				Model model,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
		
		Map<String,String> map = new HashMap<String,String>(); 
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = adminDao.getTotalCount(map);
		String url = request.getContextPath()+listCommand;
		
		String ps="1000";
		
		Paging pageInfo = new Paging(pageNumber,ps,totalCount,url,whatColumn,keyword);
		
		List<QBoardBean> list = adminDao.getAllBoardList(pageInfo,map);
		
		model.addAttribute("list",list);
		model.addAttribute("pageInfo",pageInfo);
		
		return viewPage;
	}
	
	@RequestMapping(value=deleteCommand,method=RequestMethod.GET)
	public String delete(
				Model model,
				@RequestParam("q_num") int q_num,
				@RequestParam("pageNumber") int pageNumber
			) {
		
		QBoardBean bb = adminDao.selectContent(q_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		
		adminDao.deleteBoard(q_num);
		
		return gotoPage;
	}
	
	
	
}