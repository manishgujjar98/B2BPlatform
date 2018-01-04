package com.trend.serviceimpl;

import com.trend.daoimpl.NotificationsDaoImpl;
import com.trend.exceptions.PersistException;
import com.trend.models.NotificationSettings;

public class NotificationsService {
	NotificationsDaoImpl notificationDao = new NotificationsDaoImpl();

	public String addAccount(NotificationSettings notificationSettings) {
		try {
			int check = notificationDao.findMerchant(notificationSettings.getUserId());
			System.out.println("CHECK IS --> "+ check);
			if(check == 0)
				notificationDao.notificationSetting(notificationSettings);
			else if(check > 0){
				notificationDao.updateAccountSetting(notificationSettings);
			}
		} catch (PersistException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	public String updateAccount(NotificationSettings notificationSettings) {
		try {
			notificationDao.updateAccountSetting(notificationSettings);
		} catch (PersistException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}

	public NotificationSettings retrieveAccount(String userId) {
		return	notificationDao.retrieveAccount(userId);
	}
}
