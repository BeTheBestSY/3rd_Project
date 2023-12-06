package q_board.controller;
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class QBoardReplyController {


	@Autowired
	private QBoardDao qdao;
	
	public final String command="/qReply.qb";
	public final String viewPage="qBoardReply";
	public final String gotoPage="redirect:/qBoardList.qb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String replyform(
				Model model,
				@RequestParam("q_num") int q_num,
				@RequestParam("pageNumber") int pageNumber,
				@RequestParam("q_ref") int q_ref,
				@RequestParam("q_re_step") int q_re_step,
				@RequestParam("q_re_level") int q_re_level
			) {
		
		QBoardBean bb = qdao.selectContent(q_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("q_ref",q_ref);
		model.addAttribute("q_re_step",q_re_step);
		model.addAttribute("q_re_level",q_re_level);
		model.addAttribute("bb",bb);
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String goReply(
			Model model,
			HttpServletResponse response,
			@RequestParam(value="pageNumber",required = false) int pageNumber,
			@RequestParam(value="q_ref",required = false) int q_ref,
			@RequestParam(value="q_re_step",required = false) int q_re_step,
			@RequestParam(value="q_re_level",required = false) int q_re_level,
			HttpServletRequest request,
			@ModelAttribute("bb") @Valid QBoardBean bb,
			BindingResult br
		) throws IOException {
		
		int q_num = bb.getQ_num();
		
		if(br.hasErrors()) {
			
			model.addAttribute("pageNumber",pageNumber);
			model.addAttribute("q_num",q_num);
			model.addAttribute("bb", bb);
			
			return viewPage;
		}
		
		bb.setQ_ref(q_ref);
		bb.setQ_subject("[´ä±Û] "+bb.getQ_subject());
		bb.setQ_re_step(q_re_step);
		bb.setQ_re_level(q_re_level);
		bb.setQ_ip(request.getRemoteAddr());
		bb.setQ_regdate(new Timestamp(System.currentTimeMillis()));
		
		qdao.replyProc(bb);
		
		return gotoPage+"?q_num="+q_num+"&pageNumber="+pageNumber;
	}
	
	
}
