package com.trend.daoinf;

import java.util.List;

import com.trend.cassandra.models.UserFolloweesDTO;

public interface UserFolloweeDAO {

	public boolean save(UserFolloweesDTO UserFolloweesDTO);

	public boolean delete(String userID, String followerID);

	public UserFolloweesDTO get(String userID, String followerID);

	public List<UserFolloweesDTO> getALL(String userID);

}
