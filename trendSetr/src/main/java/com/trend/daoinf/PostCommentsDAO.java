package com.trend.daoinf;

import java.util.List;

import com.trend.cassandra.models.PostCommentsDTO;

public interface PostCommentsDAO {

	public boolean save(PostCommentsDTO postCommentsDTO);
	
	public boolean delete(String postID, String commentID);

	public PostCommentsDTO get(String postID, String commentID);

	public List<PostCommentsDTO> getALL(String postID);

}
