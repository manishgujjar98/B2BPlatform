package com.trend.utils;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;  

	  
	public class MailServices {  
		private final static String HOST = "smtp.gmail.com";
		private final static int PORT = 587;
		private final static String USERNAME  = "grrpritam92@gmail.com";
		private final static String PASSWORD = "Gaps@1992";
		
		
	public String send(String to, String message) {
		
		return "";
	}
		
	 public static void main(String[] args) {  

	    
	   String to="pritam8380@gmail.com";//change accordingly  
	  
	   //Get the session object  
	   Properties props = new Properties();  
	   props.put("mail.smtp.host", HOST);  
	   props.put("mail.smtp.starttls.enable", true);
	   props.put("mail.smtp.auth", "true");  
	   props.put("mail.smtp.port", PORT);
	     
	   Session session = Session.getDefaultInstance(props,  
	    new javax.mail.Authenticator() {  
	      protected PasswordAuthentication getPasswordAuthentication() {  
	    return new PasswordAuthentication(USERNAME,PASSWORD);  
	      }  
	    });  
	  
	   //Compose the message  
	    try {  
	     MimeMessage message = new MimeMessage(session);  
	     message.setFrom(new InternetAddress(USERNAME));  
	     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
	     message.setSubject("javatpoint");  
	     message.setText("This is simple program of sending email using JavaMail API");
	     String htmlMessage = "<h1>Hello Mesage</h1><h2>Html Mail</h2><p><a href='http://google.com' target='_blank'>Google</a>";
	     message.setContent(htmlMessage,"text/html");
	       
	    //send the message  
	     Transport.send(message);  
	  
	     System.out.println("message sent successfully...");  
	   
	     } catch (MessagingException e) {e.printStackTrace();}  
	 }  
	}  

