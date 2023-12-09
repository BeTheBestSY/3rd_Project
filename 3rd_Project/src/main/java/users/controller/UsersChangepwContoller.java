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
		// 1. ���� ��й�ȣ�� �°� �Է��ߴٸ�
		if(ub.getU_password().equals(old_password)) {
			// 1-1. ��й�ȣ Ȯ���� �´ٸ�
			if(new_password.equals(new_password_chk)) {
				ud.updatePassword(u_id, new_password);
				model.addAttribute("msg", "����Ǿ����ϴ�.");
				model.addAttribute("url", ".main");
			// 1-2. ��й�ȣ Ȯ���� Ʋ�ȴٸ�
			} else {
				model.addAttribute("msg", "�����Ͻ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				model.addAttribute("url", command+"?old_password="+old_password+"&new_password="+new_password+"&new_password_chk="+new_password_chk);
			}
		// 2. ���� ��й�ȣ�� Ʋ���� �Է��ߴٸ�
		} else {
			model.addAttribute("msg", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			model.addAttribute("url", command+"?old_password="+old_password+"&new_password="+new_password+"&new_password_chk="+new_password_chk);
		}
		return gotoPage;
	}
}
