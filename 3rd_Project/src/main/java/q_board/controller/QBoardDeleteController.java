package q_board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import q_board.model.QBoardBean;
import q_board.model.QBoardDao;

@Controller
public class QBoardDeleteController {

	@Autowired
	private QBoardDao qdao;
	
	public final String command="/qDelete.qb";
	public final String viewPage="qBoardDelete";
	public final String gotoPage="redirect:/qBoardList.qb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String deleteform(
				Model model,
				@RequestParam("q_num") int q_num,
				@RequestParam("pageNumber") int pageNumber
			) {
		
		QBoardBean bb = qdao.selectContent(q_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView deletelist(
								Model model, HttpServletResponse response,
								@RequestParam("q_num") int q_num,
								@RequestParam("pageNumber") int pageNumber,
								@RequestParam("q_password") String q_password) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		QBoardBean bb = qdao.selectContent(q_num);
		
		if(q_password.equals(bb.getQ_password())) {
			qdao.deleteBoard(q_num);
			mav.setViewName(gotoPage+"?pageNumber="+pageNumber);
			return mav;
		} else {
			response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.println("<script>alert('비밀번호가 틀렸습니다.');</script>");
		    out.flush();
		    model.addAttribute("pageNumber",pageNumber);
			model.addAttribute("bb",bb);
		    mav.setViewName(viewPage);
			return mav;
		}
		
	}
	
}
