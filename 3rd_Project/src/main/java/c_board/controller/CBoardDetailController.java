package c_board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import c_board.model.CBoardBean;
import c_board.model.CBoardDao;

@Controller
public class CBoardDetailController {
	@Autowired
	private CBoardDao cdao;
	
	 
	public final String command="/detail.cb";
	public final String viewPage="cBoardDetail";
	
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String toDetailList(
			Model model,
			@RequestParam("c_num") int c_num,
			@RequestParam("pageNumber") int pageNumber
			) throws Exception {
		
		cdao.updateReadcount(c_num);
		CBoardBean bb = cdao.selectContent(c_num);
		
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("bb",bb);
		
		return viewPage;
		
		
	}
}
