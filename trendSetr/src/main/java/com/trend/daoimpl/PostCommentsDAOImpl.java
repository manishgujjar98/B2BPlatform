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
import com.trend.cassandra.models.PostCommentsDTO;
import com.trend.daoinf.PostCommentsDAO;

public class PostCommentsDAOImpl implements PostCommentsDAO {
	
	private static final Logger LOGGER = Logger.getLogger(PostCommentsDAOImpl.class);

	@Override
	public boolean save(PostCommentsDTO postCommentsDTO) {
		boolean isSaved = false;
		try {
			CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<PostCommentsDTO> mapper = manager.mapper(PostCommentsDTO.class);
				mapper.save(postCommentsDTO);
				isSaved = true;
			}
		} catch (Exception e) {
			LOGGER.error("Error saving comment", e);
		}
		return isSaved;
	}

	@Override
	public PostCommentsDTO get(String postID, String commentID) {
		PostCommentsDTO postCommentsDTO = null;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<PostCommentsDTO> mapper = manager.mapper(PostCommentsDTO.class);
				postCommentsDTO = mapper.get(postID, commentID);
			}

		} catch (Exception e) {
			LOGGER.error("Error fetching comment", e);
		}
		return postCommentsDTO;
	}
	
	@Override
	public boolean delete(String postID, String commentID) {
		boolean isDeleted = false;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				Mapper<PostCommentsDTO> mapper = manager.mapper(PostCommentsDTO.class);
				mapper.delete(postID, commentID);
				isDeleted = true;
			}

		} catch (Exception e) {
			LOGGER.error("Error deleting comment", e);
		}
		return isDeleted;
	}

	@Override
	public List<PostCommentsDTO> getALL(String postID) {
		List<PostCommentsDTO> comments = null;
		CassandraManager cassandraManager = CassandraConstants.CASSANDRA_INSTANCE;
		try {
			if (cassandraManager != null) {
				MappingManager manager = cassandraManager.getMappingManager();
				PostComments accessor = manager.createAccessor(PostComments.class);
				Result<PostCommentsDTO> result = accessor.getPostComments(postID);
				comments = result.all();
			}
			
		} catch (Exception e) {
			LOGGER.error("Error fetching post comments",e);
		}
		return comments;
	}
	
	@Accessor
	public static interface PostComments {
		@Query("select * from trendSetr.post_comments WHERE post_id = ?")
		Result<PostCommentsDTO> getPostComments(String postID);
	}

}
