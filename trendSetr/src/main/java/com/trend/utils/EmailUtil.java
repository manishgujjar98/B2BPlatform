package com.trend.utils;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class EmailUtil {
	
	public enum EmailType {
		RESETPASSWORD, ADDUSER
	};
	
	private static String getText(EmailType type) {
		System.out.println("EMAIL TYPE : "+ type);
		String text = "";
		switch(type) {
		  case ADDUSER: {
			text = "<h2>Hi {firstName}, welcome to Trendsetr.</h2><br>";
		    text += "<div>Please follow the below link to activate and register</div><br>";
		    text += "<div><a href=\"{link}\">Activate account.</a></div><br>";
		    text += "Thank you.";
		  } break;
		  
		  case RESETPASSWORD: {
				text = "<h2>Hi Customer, welcome to Trendsetr.</h2><br>";
			    text += "<div>Please follow the below link to Reset your password</div><br>";
			    text += "<div><a href=\"{link}\">Reset Password.</a></div><br>";
			    text += "Thank you.";
			  } break;  // http://localhost:8081/trendSetrIntegration/PasswordController?emailInput=request.getParameter("emailInput")
		}
		return text;
	}
	
	private static String interPolate(String text, Map<String, String> values) {
		Pattern pattern = Pattern.compile("\\{(.*?)\\}");
        Matcher matcher = pattern.matcher(text);
        StringBuffer buf = new StringBuffer(text);
        // check all occurrence
        int diff = 0;
        while (matcher.find()) {
            String key = text.substring(matcher.start()+1, matcher.end()-1);
            if(values != null && values.containsKey(key)) {            	
            	buf.replace(matcher.start() - diff, matcher.end() - diff, values.get(key));
            	diff += matcher.end() - matcher.start() - values.get(key).length(); 
            }
        }
        System.out.println("message--"+ buf.toString());
        return buf.toString();
	}
	
	public static String getEmailText(EmailType type, Map<String, String> values) {
		return interPolate(getText(type), values);
	}
}
