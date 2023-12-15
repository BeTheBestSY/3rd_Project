package admin.contoller;
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

import admin.model.AdminDao;
import q_board.model.QBoardBean;
import utility.Paging;


@Controller
public class AdminController {

	@Autowired
	private AdminDao adminDao;
	private final String command = "/.admin";
	private final String viewPage = "adminMain";
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction() {
		return viewPage;
	} 
	
}