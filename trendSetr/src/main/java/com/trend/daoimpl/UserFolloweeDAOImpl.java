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
import com.trend.cassandra.models.UserFolloweesDTO;
import com.trend.cassandra.models.UserFollowersDTO;
import com.trend.daoinf.UserFolloweeDAO;

public class UserFolloweeDAOImpl implements UserFolloweeDAO {

	private static final Logger LOGGER = Logger.getLogger(UserFollowersDAOImpl.class);

	@Override
	public boolean save(UserFolloweesDTO UserFolloweesDTO) {
		boolean isSaved = false;
		try {
			CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<UserFolloweesDTO> mapper = manager.mapper(UserFolloweesDTO.class);
				mapper.save(UserFolloweesDTO);
				isSaved = true;
			}
		} catch (Exception e) {
			LOGGER.error("Error saving user follower", e);
		}
		return isSaved;
	}

	@Override
	public boolean delete(String userID, String followeeID) {
		boolean isDeleted = false;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<UserFolloweesDTO> mapper = manager.mapper(UserFolloweesDTO.class);
				mapper.delete(userID, followeeID);
				isDeleted = true;
			}

		} catch (Exception e) {
			LOGGER.error("Error deleting comment", e);
		}
		return isDeleted;
	}

	@Override
	public UserFolloweesDTO get(String userID, String followeeID) {
		UserFolloweesDTO UserFolloweesDTO = null;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<UserFolloweesDTO> mapper = manager.mapper(UserFolloweesDTO.class);
				UserFolloweesDTO = mapper.get(userID, followeeID);
			}

		} catch (Exception e) {
			LOGGER.error("Error fetching user follower", e);
		}
		return UserFolloweesDTO;
	}

	@Override
	public List<UserFolloweesDTO> getALL(String userID) {
		List<UserFolloweesDTO> followees = null;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				UserFollowees accessor = manager.createAccessor(UserFollowees.class);
				Result<UserFolloweesDTO> result = accessor.getUserFollowers(userID);
				followees = result.all();
			}

		} catch (Exception e) {
			LOGGER.error("Error fetching user followers", e);
		}
		return followees;
	}

	@Accessor
	public static interface UserFollowees {
		@Query("select * from trendSetr.user_following WHERE user_id = ?")
		Result<UserFolloweesDTO> getUserFollowers(String userID);
	}
	
	public static void main(String[] args) {
		UserFollowersDTO dto = new UserFollowersDTO();
		dto.setUser_id("u1");
		dto.setFollower_user_id("f1");
		boolean saved = new UserFollowersDAOImpl().save(dto);
		System.out.println(saved);
	}

}
