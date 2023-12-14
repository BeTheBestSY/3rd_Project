package users.controller;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.UsersBean;
import users.model.UsersDao;


@Controller
public class UsersMypageController {
	
	@Autowired
	private UsersDao ud;
	private final String command = "/mypage.u";
	private final String command_delForm = "/deleteForm.u";
	private final String command_del = "/delete.u";
	private final String viewPage = "usersMypage";
	private final String viewPage_delForm = "usersMypageDelId";
	private final String viewPage_del = "redirect";
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(HttpSession session) {
		
		UsersBean ub_origin = (UsersBean)session.getAttribute("loginInfo");
		UsersBean ub_new = ud.getUserById(ub_origin.getU_id());
		session.setAttribute("loginInfo", ub_new); 
		// 마이페이지 들어갈 때 마다 DB에서 정보 받아와서 새로 loginInfo 설정.
		// 이렇게 안하면 수정사항이 제대로 반영이 안되더라구.
		
		return viewPage;
	}
	
	@RequestMapping(value = command_delForm, method = RequestMethod.GET)
	public String delForm(HttpSession session) {
		return viewPage_delForm; 
	}
	
	@RequestMapping(value = command_del, method = RequestMethod.GET)
	public String delId(@RequestParam String u_id, @RequestParam String reason, Model model, HttpSession session) {
		System.out.println("탈퇴사유: " + reason);
		
		ud.deleteUsers(u_id);
		session.invalidate();
		model.addAttribute("msg", "탈퇴 처리되었습니다. 이용해주셔서 감사합니다.");
		model.addAttribute("url", ".main");
		return viewPage_del;
 	}
	
}
