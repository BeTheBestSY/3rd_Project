package c_board.controller;

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

import c_board.model.CBoardBean;
import c_board.model.CBoardDao;


@Controller
public class CBoardReplyController {


	@Autowired
	private CBoardDao cdao;
	
	public final String command="/cReply.cb";
	public final String viewPage="cBoardReply";
	public final String gotoPage="redirect:/cBoardList.cb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String replyform(
				Model model,
				@RequestParam("c_num") int c_num,
				@RequestParam("pageNumber") int pageNumber,
				@RequestParam("c_ref") int c_ref,
				@RequestParam("c_re_step") int c_re_step,
				@RequestParam("c_re_level") int c_re_level
			) {
		
		CBoardBean bb = cdao.selectContent(c_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("c_ref",c_ref);
		model.addAttribute("c_re_step",c_re_step);
		model.addAttribute("c_re_level",c_re_level);
		model.addAttribute("bb",bb);
		
		return viewPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String goReply(
			Model model,
			HttpServletResponse response,
			@RequestParam(value="pageNumber",required = false) int pageNumber,
			@RequestParam(value="c_ref",required = false) int c_ref,
			@RequestParam(value="c_re_step",required = false) int c_re_step,
			@RequestParam(value="c_re_level",required = false) int c_re_level,
			HttpServletRequest request,
			@ModelAttribute("bb") @Valid CBoardBean bb,
			BindingResult br
		) throws IOException {
		
		int c_num = bb.getC_num();
		
		if(br.hasErrors()) {
			
			model.addAttribute("pageNumber",pageNumber);
			model.addAttribute("c_num",c_num);
			model.addAttribute("bb", bb);
			
			return viewPage;
		}
		
		bb.setC_ref(c_ref);
		bb.setC_subject("[답글] "+bb.getC_subject());
		bb.setC_re_step(c_re_step);
		bb.setC_re_level(c_re_level);
		bb.setC_ip(request.getRemoteAddr());
		bb.setC_regdate(new Timestamp(System.currentTimeMillis()));
		
		cdao.replyProc(bb);
		
		return gotoPage+"?c_num="+c_num+"&pageNumber="+pageNumber;
	}
	
}
