package users.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.EmailSender;
import users.model.UsersDao;
import utility.Email;

@Controller
public class UsersEmailController {
	private final String command = "/email.u";
	private final String viewPage = "usersFindPwResView";
	
	@Autowired
    private EmailSender emailSender;
	@Autowired
	private UsersDao ud;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String email(@RequestParam String toEmail,
					@RequestParam String u_id) {
		
		//임시 비밀번호 생성
		String tempPw = UUID.randomUUID().toString().replace("-", ""); //-를 제거
		tempPw = tempPw.substring(0,10);
		// 임시 비밀번호 발급 이메일 발송
		Email email = new Email();
		email.setFromEmail("hiddenbyuti23@gmail.com");
		email.setToEmail(toEmail);
		email.setTitle("Hidden Beauty 임시 비밀번호 안내 이메일입니다.");
		StringBuffer sb = new StringBuffer();
		sb.append("<div style='70%;'>");
		sb.append("<img src='cid:image' style='width: 20%; margin: auto;'><br><hr>");
		sb.append("<h1 style=\"font-family: 'MaruBuri-Regular';\">임시 비밀번호 발급 안내</h1>");
		sb.append("<span style=\"font-family: 'RIDIBatang';\" font-size: 11pt;>"+u_id+"님,<br>");
		sb.append("회원님의 임시 비밀번호를 아래와 같이 보내드립니다.</span>");
		sb.append("<div style='background-color: #B3B3CE; width: 30%;'>임시 비밀번호: "+tempPw+"</div>");
		sb.append("</div>");
		String html = sb.toString();																			
//		String content = "";
//		content += "<div>";
//		content += "<img src='cid:image' style='width: 20%; margin-left: 100px;'><br><hr>";
//		content += "<h1 style=\"font-family: 'MaruBuri-Regular';\">임시 비밀번호 발급 안내</h1>";
//		content += "<span style=\"font-family: 'RIDIBatang';\" font-size: 11pt;>"+u_id+"님,<br>";
//		content += "회원님의 임시 비밀번호를 아래와 같이 보내드립니다.</span>";
//		content += "<div style='background-color: #B3B3CE; width: 30%;'>임시 비밀번호: "+tempPw+"</div>";
//		content += "</div>";
		email.setContent(html);
		System.out.println("메일전송: "+emailSender.sendMail(email));
		ud.updatePassword(u_id, tempPw);
		
		return viewPage;
	}
}
