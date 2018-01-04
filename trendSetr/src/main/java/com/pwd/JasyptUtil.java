package com.pwd;

import org.jasypt.util.password.StrongPasswordEncryptor;

public class JasyptUtil {

	
	public static void main(String[] args) {
	
		System.out.println(checkPwd("swamy"));
	}
	
	public static boolean checkPwd(String inputPassword){
		
		StrongPasswordEncryptor passwordEncryptor = new StrongPasswordEncryptor();
		String encryptedPassword = passwordEncryptor.encryptPassword(inputPassword);
		
		
		System.out.println(encryptedPassword);
		
		if (passwordEncryptor.checkPassword(inputPassword, encryptedPassword)) {
		  return true;
		} else {
			return false;
		}
	}
			
			
}
