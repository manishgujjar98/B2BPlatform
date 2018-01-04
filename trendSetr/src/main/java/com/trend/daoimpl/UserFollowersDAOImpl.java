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
import com.trend.cassandra.models.UserFollowersDTO;
import com.trend.daoinf.UserFollowersDAO;

public class UserFollowersDAOImpl implements UserFollowersDAO {

	private static final Logger LOGGER = Logger.getLogger(UserFollowersDAOImpl.class);

	@Override
	public boolean save(UserFollowersDTO userFollowersDTO) {
		boolean isSaved = false;
		try {
			CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<UserFollowersDTO> mapper = manager.mapper(UserFollowersDTO.class);
				mapper.save(userFollowersDTO);
				isSaved = true;
			}
		} catch (Exception e) {
			LOGGER.error("Error saving user follower", e);
		}
		return isSaved;
	}

	@Override
	public boolean delete(String userID, String followerID) {
		boolean isDeleted = false;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<UserFollowersDTO> mapper = manager.mapper(UserFollowersDTO.class);
				mapper.delete(userID, followerID);
				isDeleted = true;
			}

		} catch (Exception e) {
			LOGGER.error("Error deleting comment", e);
		}
		return isDeleted;
	}

	@Override
	public UserFollowersDTO get(String userID, String followerID) {
		UserFollowersDTO userFollowersDTO = null;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<UserFollowersDTO> mapper = manager.mapper(UserFollowersDTO.class);
				userFollowersDTO = mapper.get(userID, followerID);
			}

		} catch (Exception e) {
			LOGGER.error("Error fetching user follower", e);
		}
		return userFollowersDTO;
	}

	@Override
	public List<UserFollowersDTO> getALL(String userID) {
		List<UserFollowersDTO> comments = null;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				UserFollowers accessor = manager.createAccessor(UserFollowers.class);
				Result<UserFollowersDTO> result = accessor.getUserFollowers(userID);
				comments = result.all();
			}

		} catch (Exception e) {
			LOGGER.error("Error fetching user followers", e);
		}
		return comments;
	}

	@Accessor
	public static interface UserFollowers {
		@Query("select * from trendSetr.user_followers WHERE user_id = ?")
		Result<UserFollowersDTO> getUserFollowers(String userID);
	}

}
