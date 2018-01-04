package com.trend.cassandra.models;

import java.util.Date;

import com.datastax.driver.mapping.annotations.Table;

@Table(keyspace = "trendSetr", name = "user_followers", caseSensitiveTable = false,  caseSensitiveKeyspace = true)
public class UserFollowersDTO {
	
	private String user_id;
	private String follower_user_id;
	private Date followed_date;
	private String follower_name;
	private String follower_profile_image_url;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFollower_user_id() {
		return follower_user_id;
	}
	public void setFollower_user_id(String follower_user_id) {
		this.follower_user_id = follower_user_id;
	}
	public Date getFollowed_date() {
		return followed_date;
	}
	public void setFollowed_date(Date followed_date) {
		this.followed_date = followed_date;
	}
	public String getFollower_name() {
		return follower_name;
	}
	public void setFollower_name(String follower_name) {
		this.follower_name = follower_name;
	}
	public String getFollower_profile_image_url() {
		return follower_profile_image_url;
	}
	public void setFollower_profile_image_url(String follower_profile_image_url) {
		this.follower_profile_image_url = follower_profile_image_url;
	}
	
	
	

}
