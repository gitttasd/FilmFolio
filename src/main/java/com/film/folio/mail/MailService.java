package com.film.folio.mail;

import java.util.List;

import org.springframework.stereotype.Service;


public interface MailService {

	public void sendMail(String to, String subject, String body);
}
