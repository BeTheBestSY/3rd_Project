package users.controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import users.model.UsersBean;
import users.model.UsersDao;


@Controller
public class UsersUpdateController {
	
	private final String command = "/update.u";
	private final String command_color = "/updateColor.u";
	private final String viewPage = "usersUpdateForm";
	private final String viewPage2 = "redirect";
	
	@Autowired
	private UsersDao ud;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String doAction() {
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String doAction2(@ModelAttribute(value = "ub") UsersBean ub, HttpServletResponse response, HttpSession session, Model model,
			@RequestParam("img_before") String img_before) throws IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("u_phone : " + ub.getU_phone());
		String u_phone = ub.getU_phone().replace(",","-"); // 010-1234-5678
		String u_email = ub.getU_email().replace(",","@");
		ub.setU_phone(u_phone);
		ub.setU_email(u_email);
		
		System.out.println("기존 타이틀이미지:"+img_before);
		System.out.println("받아온 프로필 이미지:"+ub.getU_profileimg());
		String uploadPath = servletContext.getRealPath("/resources/uploadFolder/users/");
		File destBefore = new File(uploadPath+File.separator+img_before);
		
		try {
			destBefore.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(ud.updateUsers(ub) > 0) {
			
			System.out.println("uploadPath:"+uploadPath);
			File destTitle = new File(uploadPath+File.separator+ub.getU_profileimg());
			MultipartFile u_profileImg = ub.getUpload_img();
			
			try {
				u_profileImg.transferTo(destTitle); //destTitle에 ttl_img 올려라.
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			model.addAttribute("msg", "수정되었습니다.");
			model.addAttribute("url", "mypage.u");
			return viewPage2;
		} else {
			out.print("<script>alert('수정 실패. 관리자에게 문의하세요.');</script>");
			out.flush();
			return viewPage;
		}
	} 
	
	@RequestMapping(value=command_color, method=RequestMethod.GET)
	public String updateColor(HttpServletResponse response, HttpSession session,
							@RequestParam("personalColor") String personalColor, Model model) throws IOException {
		
		UsersBean ub = (UsersBean)session.getAttribute("loginInfo");
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		
		if(ud.updateColor(personalColor, ub.getU_id()) > 0) {
			//out.print("<script>alert('수정되었습니다.');</script>");
			//out.flush();
			model.addAttribute("msg", "수정되었습니다.");
			model.addAttribute("url", "mypage.u");
			return viewPage2;
		} else {
			out.print("<script>alert('수정 실패. 관리자에게 문의하세요.');</script>");
			out.flush();
		}
		
		return viewPage2;
	}
}