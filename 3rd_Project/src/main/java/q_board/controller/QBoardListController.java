package q_board.controller;

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

import q_board.model.QBoardBean;
import q_board.model.QBoardDao;
import utility.Paging;

@Controller
public class QBoardListController {
	@Autowired
	private QBoardDao qdao;
	  
	public final String command="/qBoardList.qb";
	public final String viewPage="qBoardList";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String goList(
				Model model,
				@RequestParam(value="whatColumn",required = false) String whatColumn,
				@RequestParam(value="keyword",required = false) String keyword,
				@RequestParam(value="pageNumber",required = false) String pageNumber,
				HttpServletRequest request
			) {
		whatColumn="all";
		Map<String,String> map = new HashMap<String,String>();
		map.put("whatColumn", whatColumn);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = qdao.getTotalCount(map);
		System.out.println("글 수:"+totalCount);
		System.out.println("map:"+map);
		String url = request.getContextPath()+command;
		
		Paging pageInfo = new Paging(pageNumber,null,totalCount,url,whatColumn,keyword);
		
		List<QBoardBean> list = qdao.getAllBoardList(pageInfo,map);
		System.out.println("list:"+list);
		System.out.println(list.size());
		
		model.addAttribute("list",list);
		model.addAttribute("pageInfo",pageInfo);
		
		return viewPage;
	}
}
