package c_board.controller;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import c_board.model.CBoardBean;
import c_board.model.CBoardDao;


@Controller
public class CBoardWriteController {

	@Autowired
	private CBoardDao cdao;
	
	public final String command="/write.cb"; 
	public final String viewPage="cBoardWrite";
	public final String gotoPage="redirect:/cBoardList.cb";
	
	@RequestMapping(value=command,method=RequestMethod.GET)
	public String writeform() {
		return viewPage;
	} 
	
	@RequestMapping(value=command,method=RequestMethod.POST)
	public String gowrite(
				HttpServletRequest request,
				@ModelAttribute("bb") 
				@Valid CBoardBean bb,
				BindingResult br
			) {
		
		if(br.hasErrors()) {
			return viewPage;
		}
		
		bb.setC_ip(request.getRemoteAddr());
		bb.setC_regdate(new Timestamp(System.currentTimeMillis()));
		cdao.writeBoard(bb);
		return gotoPage;
		
	}
	
}
