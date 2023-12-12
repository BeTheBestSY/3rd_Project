package c_board.controller;

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

import c_board.model.CBoardBean;
import c_board.model.CBoardDao;

@Controller
public class CBoardDeleteController {

	@Autowired
	private CBoardDao cdao;
	 
	public final String command="/cDelete.cb";
	public final String viewPage="cBoardDelete";
	public final String gotoPage="redirect:/cBoardList.cb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String deleteform(
				Model model,
				@RequestParam("c_num") int c_num,
				@RequestParam("pageNumber") int pageNumber
			) {
		
		CBoardBean bb = cdao.selectContent(c_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public ModelAndView deletelist(
								Model model, HttpServletResponse response,
								@RequestParam("c_num") int c_num,
								@RequestParam("pageNumber") int pageNumber,
								@RequestParam("c_password") String c_password) throws IOException {
		
		ModelAndView mav = new ModelAndView();
		CBoardBean bb = cdao.selectContent(c_num);
		
		if(c_password.equals(bb.getC_password())) {
			cdao.deleteBoard(c_num);
			mav.setViewName(gotoPage+"?pageNumber="+pageNumber);
			return mav;
		} else {
			response.setContentType("text/html; charset=UTF-8");
		    PrintWriter out = response.getWriter();
		    out.print("<script>alert('잘못된 비밀번호입니다.');</script>");
		    out.flush();
		    model.addAttribute("pageNumber",pageNumber);
			model.addAttribute("bb",bb);
		    mav.setViewName(viewPage);
			return mav;
		}
		
	}
	
}
