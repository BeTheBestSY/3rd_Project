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
public class UsersChangepwContoller {
	private final String command = "changepw.u";
	private final String viewPage = "usersChangepwForm";
	private final String gotoPage = "redirect";
	
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction(@RequestParam(required = false) String old_password,
					@RequestParam(required = false) String new_password,
					@RequestParam(required = false) String new_password_chk) {
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@RequestParam String old_password,
						@RequestParam String new_password,
						@RequestParam String new_password_chk,
						HttpSession session,
						Model model) {
		String u_id = String.valueOf(session.getAttribute("id"));
		UsersBean ub = ud.getUserById(u_id);
		// 1. 기존 비밀번호를 맞게 입력했다면
		if(ub.getU_password().equals(old_password)) {
			// 1-1. 비밀번호 확인이 맞다면
			if(new_password.equals(new_password_chk)) {
				ud.updatePassword(u_id, new_password);
				model.addAttribute("msg", "변경되었습니다.");
				model.addAttribute("url", ".main");
			// 1-2. 비밀번호 확인이 틀렸다면
			} else {
				model.addAttribute("msg", "변경하실 비밀번호가 일치하지 않습니다.");
				model.addAttribute("url", command+"?old_password="+old_password+"&new_password="+new_password+"&new_password_chk="+new_password_chk);
			}
		// 2. 기존 비밀번호를 틀리게 입력했다면
		} else {
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", command+"?old_password="+old_password+"&new_password="+new_password+"&new_password_chk="+new_password_chk);
		}
		return gotoPage;
	}
}
