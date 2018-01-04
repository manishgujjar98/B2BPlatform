package com.trend.cassandra.models;

import java.util.Date;

import com.datastax.driver.mapping.annotations.Column;
import com.datastax.driver.mapping.annotations.Table;

@Table(keyspace = "trendSetr", name = "user_following", caseSensitiveTable = false,  caseSensitiveKeyspace = true)
public class UserFolloweesDTO {
	
	private String user_id;
	private String following_user_id;
	@Column(name = "following_date")
	private Date followed_date;
	private String following_name;
	private String following_profile_image_url;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getFollowing_user_id() {
		return following_user_id;
	}
	public void setFollowing_user_id(String following_user_id) {
		this.following_user_id = following_user_id;
	}
	public Date getFollowed_date() {
		return followed_date;
	}
	public void setFollowed_date(Date followed_date) {
		this.followed_date = followed_date;
	}
	public String getFollowing_name() {
		return following_name;
	}
	public void setFollowing_name(String following_name) {
		this.following_name = following_name;
	}
	public String getFollowing_profile_image_url() {
		return following_profile_image_url;
	}
	public void setFollowing_profile_image_url(String following_profile_image_url) {
		this.following_profile_image_url = following_profile_image_url;
	}
	

}
