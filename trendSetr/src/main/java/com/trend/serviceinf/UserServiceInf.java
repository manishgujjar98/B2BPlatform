package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.enums.MessageEnum;
import com.trend.models.User;

public interface UserServiceInf {
	
	MessageEnum add(User user);
	MessageEnum update(User user);
	User updateAdminPassword(User user);
	String delete(User user);
	User userSettings(User user);
	ArrayList<User> allUsers();
	User userLogin(User user);
	ArrayList<User> allMerchants(String roleId);
}
