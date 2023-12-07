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
		/* ���Ե� ȸ������ Ȯ�� */
		if(ud.didYouJoin(ub)) { // 1-1. ���� �� ȸ���̸�
			// ���̵� session ����
			session.setAttribute("id", ub.getU_id());
			return gotoPage;
			
		} else { // 1-2. ���� �� �� ȸ���̸�
			response.setContentType("text/html; charset=UTF-8");
			// alert ����
			out.print("<script>alert('�������� ���� ȸ���Դϴ�.');</script>");
			out.flush();
			return viewPage;
		}
		
		
	}
}
