package users.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import users.model.UsersBean;
import users.model.UsersDao;


@Controller
public class UsersMypageController {
	
	@Autowired
	private UsersDao UsersDao;
	private final String command = "/mypage.u";
	private final String viewPage = "usersMypage";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		
		UsersBean ub_origin = (UsersBean)session.getAttribute("loginInfo");
		UsersBean ub_new = UsersDao.getUserById(ub_origin.getU_id());
		session.setAttribute("loginInfo", ub_new); 
		// 마이페이지 들어갈 때 마다 DB에서 정보 받아와서 새로 loginInfo 설정.
		// 이렇게 안하면 수정사항이 제대로 반영이 안되더라구.
		
		return viewPage;
	}
	
}
