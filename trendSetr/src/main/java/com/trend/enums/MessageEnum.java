package com.trend.enums;

public enum MessageEnum {
	
	MESSAGE_SUCCESS("SUCCESS"),MESSAGE_FAILUR("FAILURE"),AUTH("authen");
	
	private String message;  
	
	private MessageEnum(String message){  
	this.message=message;  
	}

	public String getMessage() {
		return message;
	}  
}
