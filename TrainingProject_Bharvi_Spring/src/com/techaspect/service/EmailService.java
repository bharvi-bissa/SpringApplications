package com.techaspect.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.techaspect.dao.CustomerDao;
import com.techaspect.entity.Customer;

public class EmailService {
	private static Properties properties = new Properties();
	
	static {
		InputStream inputStream = EmailService.class.getClassLoader().getResourceAsStream("email.properties");
		
		try {
			properties.load(inputStream);
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	
	public boolean sendWelcomeMailToCustomer(Customer customer) {
		boolean status = false;
		
		//CONNECTING TO MAIL SERVER
		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
																	protected PasswordAuthentication getPasswordAuthentication() {
																		return new PasswordAuthentication(properties.getProperty("mail.username"), properties.getProperty("mail.password"));
																	}
																});
		
		try {
			//COMPOSING EMAIL
			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("bharvi.bissa@gmail.com"));
			mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(customer.getEmail()));
			mimeMessage.setSubject("Welcome to My ECommerce Website.");
			mimeMessage.setText("Dear " + customer.getFirstName() + ",\n\n Thank you for registering with us.");

			//SENDING EMAIL
			Transport.send(mimeMessage);
			
			status = true;
		} catch (AddressException ae) {
			ae.printStackTrace();
		} catch (MessagingException me) {
			me.printStackTrace();
		}
	
		return status;
	}
}