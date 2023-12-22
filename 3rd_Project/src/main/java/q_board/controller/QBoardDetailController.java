package q_board.controller;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import q_board.model.QBoardBean;
import q_board.model.QBoardDao;


@Controller
public class QBoardDetailController {
	
	@Autowired
	private QBoardDao qdao;
	 
	public final String command="/detail.qb";
	public final String viewPage="qBoardDetail";
	
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String toDetailList(
			Model model,
			@RequestParam("q_num") int q_num,
			@RequestParam("pageNumber") int pageNumber,
			@RequestParam("whatColumn") String whatColumn,
			@RequestParam("keyword") String keyword
			) throws Exception {
		
		qdao.updateReadcount(q_num);
		QBoardBean bb = qdao.selectContent(q_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("whatColumn",whatColumn);
		model.addAttribute("keyword",keyword);
		model.addAttribute("bb",bb);
		
		return viewPage;
		
		
	}
}
