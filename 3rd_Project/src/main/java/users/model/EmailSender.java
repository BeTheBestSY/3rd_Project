package users.model;

import javax.activation.FileDataSource;
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
		    messageHelper.setFrom("Hidden Beauty <"+email.getFromEmail()+">");
		    messageHelper.setText(email.getContent(), true);
		    messageHelper.setSubject(email.getTitle());
		    messageHelper.addInline("image", new FileDataSource("C:/Users/apple2701/git/3rd_Project/3rd_Project/src/main/webapp/resources/image/fyhbLogo.png"));

		    mailSender.send(message);
		} catch(Exception e){
		    System.out.println(e);
		    return "Error";
		}
		return "Sucess";
	}	
}
