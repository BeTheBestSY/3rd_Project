package users.model;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import utility.Email;

@Component("EmailSender")
public class EmailSender {
	
	@Autowired
	private JavaMailSender mailSender;
	
	public String sendMail(Email email) {
		try {
		    MimeMessage message = mailSender.createMimeMessage();
		    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		    messageHelper.setTo(email.getToEmail());
		    messageHelper.setFrom(email.getFromEmail());
		    messageHelper.setText(email.getContent());
		    messageHelper.setSubject(email.getTitle());	// 메일제목은 생략이 가능하다
		    mailSender.send(message);
		
		} catch(Exception e){
		    System.out.println(e);
		    return "Error";
		}
		return "Sucess";
	}	
}
