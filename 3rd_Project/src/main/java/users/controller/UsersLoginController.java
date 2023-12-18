package users.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import users.model.UsersBean;
import users.model.UsersDao;


@Controller
public class UsersLoginController {
	private final String command = "/login.u";
	private final String viewPage = "usersLoginForm";
	private final String adminPage = "../admin/adminMain";
	private String gotoPage = "../views/main";
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute("ub") UsersBean ub,
						HttpSession session,
						HttpServletResponse response) throws IOException {
		
		
		PrintWriter out = response.getWriter();
		  
		if(ud.didYouJoin(ub)) { // 가입 한 회원 혹은 관리자이면
			// 아이디 session 설정
			session.setAttribute("loginInfo", ud.getUserById(ub.getU_id()));
			if(ub.getU_id().equals("admin"))
				return adminPage;
			else {
				if(session.getAttribute("destination") != null) {
					gotoPage = String.valueOf(session.getAttribute("destination"));
				}
				return gotoPage;
			}
		} else { 
			response.setContentType("text/html; charset=UTF-8");
			out.print("<script>alert('가입되지 않은 회원입니다.');</script>");
			out.flush();
			return viewPage;
		}
	
	}
}