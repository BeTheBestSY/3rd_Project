package users.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.UsersBean;
import users.model.UsersDao;
  
@Controller
public class UsersRegisterController {
	private final String command = "/register.u";
	private final String viewPage = "usersRegisterForm";
	private final String viewPage2 = "usersWelcomeView";
	
	@Autowired
	private UsersDao ud;
	@Autowired
	private ServletContext application;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute("ub") UsersBean ub,
						@RequestParam String u_rePassword,
						HttpServletResponse response) throws IOException {
		if(!(Boolean) application.getAttribute("flag")) {
			String u_phone = ub.getU_phone().replace(",","-"); // 010-1234-5678
			ub.setU_phone(u_phone);
			System.out.println(ub.getU_address()); // 23104,인천 옹진군 백령면 콩돌로 170,102호
			// 주소 입력을 안 했을 경우
			if(ub.getU_address().equals(",,")) {
				ub.setU_address("-");
			}
			
			if(!ub.getU_password().equals(u_rePassword)) {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=UTF-8");
				out.print("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
				out.flush();
				return viewPage;
			}
			ub.setU_link("S");
			ud.register(ub);
			application.setAttribute("flag", true); 
		}
		return viewPage2;
	}
}
