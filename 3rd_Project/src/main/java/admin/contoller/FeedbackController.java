package admin.contoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import admin.model.AdminDao;

@Controller
public class FeedbackController {
	private final String command = "selectFeedback.admin";
	private String viewPage = "adminMain";
	
	 @Autowired 
	  private AdminDao adminDao;
	
	@RequestMapping(value = command)
	public String feedback(
						Model model
						) {
		String fb1 = adminDao.fb1Select("흥미로운 컨텐츠가 부족해요.");
		String fb2 = adminDao.fb2Select("웹 사이트를 이용하기가 불편해요.");
		String fb3 = adminDao.fb3Select("관리가 잘 되지 않는 것 같아요.");
		String fb4 = adminDao.fb4Select("사고 싶은 물품이 없어요.");
		String fb5 = adminDao.fb5Select("비매너 사용자를 만났어요.");
		String fb6 = adminDao.fb6Select("새 계정을 만들고 싶어요.");
		String etc = adminDao.etcSelect();
		
		
		System.out.println(fb1+"fb1");
		System.out.println(fb2+"fb2");
		System.out.println(fb3+"fb3");
		System.out.println(fb4+"fb4");
		System.out.println(fb5+"fb5");
		System.out.println(fb6+"fb6");
		System.out.println(etc+"etc");

		model.addAttribute("fb1", fb1);
		model.addAttribute("fb2", fb2);
		model.addAttribute("fb3", fb3);
		model.addAttribute("fb4", fb4);
		model.addAttribute("fb5", fb5);
		model.addAttribute("fb6", fb6);
		model.addAttribute("etc", etc);
		
		return viewPage;
		
	}
}
