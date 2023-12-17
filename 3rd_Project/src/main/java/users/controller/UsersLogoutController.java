package users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import users.model.UsersBean;


@Controller
public class UsersLogoutController {
	private final String command = "/logout.u";
	private final String redirect = "redirect:/";
	
	@RequestMapping(command)
	public String doAction(HttpSession session) {
		UsersBean loginInfo = (UsersBean)session.getAttribute("loginInfo");
		session.invalidate();
		if(loginInfo.getU_jointype().equals("K")) {
			// 카카오 로그아웃
			return redirect+"outkakao.u";
		} else {
			// 네이버/기본 로그아웃
			// 네이버는 별도의 로그아웃 api를 제공하지 않음.
			return redirect+".main";
		}
	}
}
