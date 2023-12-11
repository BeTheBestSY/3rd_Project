package users.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import users.model.UsersBean;
import users.model.UsersDao;
  
@Controller
public class UsersRegisterController {
	private final String command = "/register.u";
	private final String viewPage = "usersRegisterForm";
	private final String viewPage2 = "usersWelcomeView";
	
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute("ub") UsersBean ub, HttpSession session) {
		String u_phone = ub.getU_phone().replace(",","-"); // 010-1234-5678
		ub.setU_phone(u_phone);
		System.out.println(ub.getU_address()); // 23104,인천 옹진군 백령면 콩돌로 170,102호
//		String[] addrList = ub.getU_address().split(",");
//		String u_address = "";
//		u_address += addrList[1]+" "+addrList[2]+" ("+addrList[0]+")";
//		ub.setU_address(u_address);
//		System.out.println(ub.getU_address());
		ud.register(ub);
		session.setAttribute("id", ub.getU_id());
		return viewPage2;
	}
}
