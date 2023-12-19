package q_board.controller;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import q_board.model.QBoardBean;
import q_board.model.QBoardDao;


@Controller
public class QBoardWriteController {

	@Autowired
	private QBoardDao bdao;
	
	public final String command="/write.qb"; 
	public final String viewPage="qBoardWrite";
	public final String gotoPage="redirect:/qBoardList.qb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String writeform(@RequestParam(value="pageNumber", required=false) String pageNumber,
							@RequestParam(value="whatColumn", required=false) String whatColumn,
							@RequestParam(value="keyword", required=false) String keyword,
							Model model) {
		
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword", keyword);
		return viewPage;
	} 
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String gowrite(
				HttpServletRequest request,
				@ModelAttribute("bb") 
				@Valid QBoardBean bb,
				BindingResult br
			) { 
		
		if(br.hasErrors()) {
			return viewPage;
		}
		
		bb.setQ_ip(request.getRemoteAddr());
		bb.setQ_regdate(new Timestamp(System.currentTimeMillis()));
		bdao.writeBoard(bb);
		return gotoPage;
		
	}
	
}
