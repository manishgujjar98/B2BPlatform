package com.trend.daoinf;

import java.util.List;

import com.trend.cassandra.models.UserNotificationDTO;

public interface UserNotificationDAO {
	
	public boolean save(UserNotificationDTO userNotificationDTO);
	
	public UserNotificationDTO get(String userID, String notificationID);
	
	public List<UserNotificationDTO> getALL(String userID);

}
