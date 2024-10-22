package com.film.folio.mail;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.folio.comm.PageVo;
import com.film.folio.comm.SearchVo;

@Service
public class MailServiceImpl implements MailService {

	@Override
	public void sendMail(String to, String subject, String body) {
		
		//SMTP 서버 설정
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true"); /* SMTP 서버에 인증이 필요함을 말함 */
		props.put("mail.smtp.starttls.enable", "true"); // TLS 사용
	    props.put("mail.smtp.host", "smtp.gmail.com");  //SMTP 서버의 호스트 이름을 지정
	    props.put("mail.smtp.port", "587"); // TLS 포트
	    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	    
	    final String username = "lsj4073@gmail.com";
	    final String password = "ipon guma uvlr vnab";
	    
	    //session 생성(인증정보 패키징)
	    Session session = Session.getInstance(props, new javax.mail.Authenticator() {
	    	protected PasswordAuthentication getPasswordAuthentication() {
	    		return new PasswordAuthentication(username, password);
	    	}
	    });
		
	    try {
	    	//메세지 객체 생성
	    	Message message = new MimeMessage(session);
	    	message.setFrom(new InternetAddress(username)); // 아이디 유효성 검사 및 SMTP 형식으로 변환 
	    	message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	    	message.setSubject(subject); // 제목
	        message.setText(body); // 본문
	        
	        Transport.send(message);
	        System.out.println("이메일이 전송되었습니다.");
	        
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}


	

}
