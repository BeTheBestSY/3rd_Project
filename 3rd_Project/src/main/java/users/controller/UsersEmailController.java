package users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import users.model.EmailSender;
import utility.Email;

@Controller
public class UsersEmailController {
	private final String command = "/email.u";
	private final String viewPage = "usersFindPwResView";
	
	@Autowired
    EmailSender emailSender;

	@RequestMapping(value = command)
    public String getEmail(@RequestParam String toEmail) {
		Email email = new Email();
		email.setFromEmail("phj__0916@naver.com");
		email.setToEmail(toEmail);
		email.setTitle("히든뷰티 임시비밀번호 입니다.");
		email.setContent("");
		
		System.out.println("메일전송: "+emailSender.sendMail(email));
       
        return viewPage;
    }
}
