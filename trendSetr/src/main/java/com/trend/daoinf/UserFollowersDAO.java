package com.trend.daoinf;

import java.util.List;

import com.trend.cassandra.models.UserFollowersDTO;

public interface UserFollowersDAO {

	public boolean save(UserFollowersDTO userFollowersDTO);

	public boolean delete(String userID, String followerID);

	public UserFollowersDTO get(String userID, String followerID);

	public List<UserFollowersDTO> getALL(String userID);

}
