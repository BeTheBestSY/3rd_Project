package c_board.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import c_board.model.CBoardBean;
import c_board.model.CBoardDao;
import utility.Paging;


@Controller
public class CBoardListController {
	@Autowired
	private CBoardDao cdao;
	  
	public final String command="/cBoardList.cb";
	public final String viewPage="cBoardList";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String goList(
				Model model,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
		
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = cdao.getTotalCount(map);
		String url = request.getContextPath()+command;
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword);
		
		List<CBoardBean> list = cdao.getAllBoardList(pageInfo,map);
		
		model.addAttribute("list",list);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("whatColumn",whatColumn);
		model.addAttribute("keyword",keyword);
		
		return viewPage;
	}
}
 