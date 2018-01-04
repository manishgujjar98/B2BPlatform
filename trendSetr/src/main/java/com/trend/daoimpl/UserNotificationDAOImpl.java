package com.trend.daoimpl;

import java.util.List;

import org.apache.log4j.Logger;

import com.datastax.driver.mapping.Mapper;
import com.datastax.driver.mapping.MappingManager;
import com.datastax.driver.mapping.Result;
import com.datastax.driver.mapping.annotations.Accessor;
import com.datastax.driver.mapping.annotations.Query;
import com.trend.cassandra.CassandraConstants;
import com.trend.cassandra.CassandraManager;
import com.trend.cassandra.models.UserNotificationDTO;
import com.trend.daoinf.UserNotificationDAO;

public class UserNotificationDAOImpl implements UserNotificationDAO {

	private static final Logger LOGGER = Logger.getLogger(UserNotificationDAOImpl.class);

	@Override
	public boolean save(UserNotificationDTO userNotificationDTO) {
		boolean isSaved = false;
		try {
			CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<UserNotificationDTO> mapper = manager.mapper(UserNotificationDTO.class);
				mapper.save(userNotificationDTO);
				isSaved = true;
			}
		} catch (Exception e) {
			LOGGER.error("Error saving notification", e);
		}
		return isSaved;
	}

	@Override
	public UserNotificationDTO get(String userID, String notificationID) {
		UserNotificationDTO userNotificationDTO = null;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<UserNotificationDTO> mapper = manager.mapper(UserNotificationDTO.class);
				userNotificationDTO = mapper.get(userID, notificationID);
			}

		} catch (Exception e) {
			LOGGER.error("Error fetching notification", e);
		}
		return userNotificationDTO;
	}

	@Override
	public List<UserNotificationDTO> getALL(String userID) {
		List<UserNotificationDTO> notifications = null;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				UserNotifications accessor = manager.createAccessor(UserNotifications.class);
				Result<UserNotificationDTO> result = accessor.getUserNotifications(userID);
				notifications = result.all();
			}
			
		} catch (Exception e) {
			LOGGER.error("Error fetching user notifications",e);
		}
		return notifications;
	}
	
	@Accessor
	public static interface UserNotifications {
		@Query("select * from trendSetr.user_notification WHERE user_id = ?")
		Result<UserNotificationDTO> getUserNotifications(String userID);
	}

	public static void main(String[] args) {
		UserNotificationDTO userNotificationDTO = new UserNotificationDTO();
		userNotificationDTO.setUser_id("ravi");
		userNotificationDTO.setNotification_id("n123");
		userNotificationDTO.setNotification_message("myMessage");
		System.out.println(new UserNotificationDAOImpl().save(userNotificationDTO));
	}

}
