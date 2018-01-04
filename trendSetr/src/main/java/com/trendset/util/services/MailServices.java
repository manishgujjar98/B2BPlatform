package com.trendset.util.services;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.trendset.utils.PropertiesUtils;

public class MailServices {

	public static void main(String[] args) {
		//MailServices.sendMail("grrpritam92@gmail.com","write Subject here", "Write content what you want send");
	}

	public static void sendMail(String toEmail, String subject, String body){
		try
	    {
			
			final PropertiesUtils pop= PropertiesUtils.getInstance();
			  
			   //Get the session object  
			   Properties props = new Properties();  
			   props.put("mail.smtp.host", pop.getValue("HOST"));  
			   props.put("mail.smtp.port", Integer.parseInt(pop.getValue("PORT")));
			   props.put("mail.smtp.auth", "true");  
			   props.put("mail.smtp.starttls.enable", "true");
			     
			   Session session = Session.getDefaultInstance(props,  
			    new javax.mail.Authenticator() {  
			      protected PasswordAuthentication getPasswordAuthentication() {  
			    return new PasswordAuthentication(pop.getValue("USERNAME"),pop.getValue("PASSWORD"));  
			      }  
			    }); 
			
		
			
	      MimeMessage msg = new MimeMessage(session);
	      //set message headers
	      msg.setFrom(new InternetAddress(pop.getValue("USERNAME")));  
	      msg.setSubject(subject, "UTF-8");
	      msg.setText(body, "utf-8", "html");

	      msg.setSentDate(new Date());
	      msg.addRecipient(Message.RecipientType.TO,new InternetAddress(toEmail));  
	      //msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
	      System.out.println("Message is ready");
    	  Transport.send(msg);  

	      System.out.println("EMail Sent Successfully!!");
	    }
	    catch (Exception e) {
	      System.out.println("exception--"+e);	
	      e.printStackTrace();
	    }
	}
	
}