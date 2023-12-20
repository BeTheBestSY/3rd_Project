package q_board.controller;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import q_board.model.QBoardBean;
import q_board.model.QBoardDao;


@Controller
public class QBoardWriteController {

	@Autowired
	private QBoardDao qdao;
	
	public final String command="/write.qb"; 
	public final String viewPage="qBoardWrite";
	public final String gotoPage="redirect:/qBoardList.qb";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String writeform(@RequestParam(value="pageNumber", required=false) String pageNumber,
							@RequestParam(value="whatColumn", required=false) String whatColumn,
							@RequestParam(value="keyword", required=false) String keyword,
							Model model) {
		
		model.addAttribute("pageNumber", pageNumber);
		model.addAttribute("whatColumn", whatColumn);
		model.addAttribute("keyword", keyword);
		return viewPage;
	} 
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public String gowrite(HttpServletRequest request, Model model) {
		
		QBoardBean qb = new QBoardBean();
		qb.setQ_type(request.getParameter("q_type"));
		System.out.println("qb.getQ_type()" + qb.getQ_type());
		
		System.out.println("post 도착함");
		qb.setQ_ip(request.getRemoteAddr());
		qb.setQ_regdate(new Timestamp(System.currentTimeMillis()));
		qdao.writeBoard(qb);
		model.addAttribute("bb", qb);
		return gotoPage;
		
	}
	
}
