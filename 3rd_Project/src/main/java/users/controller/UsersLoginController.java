package users.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import users.model.UsersBean;
import users.model.UsersDao;

@Controller
public class UsersLoginController {
	private final String command = "/login.u";
	private final String viewPage = "usersLoginForm";
	private final String gotoPage = "main";
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute("ub") @Valid UsersBean ub,
						BindingResult res, 
						HttpSession session,
						HttpServletResponse response) throws IOException {
		
		if(res.hasErrors()) {
			return viewPage;
		}
		
		PrintWriter out = response.getWriter();
		/* 가입된 회원인지 확인 */
		if(ud.didYouJoin(ub)) { // 1-1. 가입 한 회원이면
			// 아이디 session 설정
			session.setAttribute("id", ub.getU_id());
			return gotoPage;
			
		} else { // 1-2. 가입 안 한 회원이면
			response.setContentType("text/html; charset=UTF-8");
			// alert 띄우기
			out.print("<script>alert('가입하지 않은 회원입니다.');</script>");
			out.flush();
			return viewPage;
		}
		
		
	}
}
