package com.trend.cassandra.models;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import com.datastax.driver.mapping.annotations.ClusteringColumn;
import com.datastax.driver.mapping.annotations.PartitionKey;
import com.datastax.driver.mapping.annotations.Table;

@XmlRootElement
@Table(keyspace = "trendSetr", name = "post_comments", caseSensitiveTable = false,  caseSensitiveKeyspace = true)
public class PostCommentsDTO {
	
	@PartitionKey
	private String post_id;
	@ClusteringColumn
	private String comment_id;
	private Date comment_date;
	private String comment_image_url;
	private String comment_text;
	private String commented_by;
	
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_image_url() {
		return comment_image_url;
	}
	public void setComment_image_url(String comment_image_url) {
		this.comment_image_url = comment_image_url;
	}
	public String getComment_text() {
		return comment_text;
	}
	public void setComment_text(String comment_text) {
		this.comment_text = comment_text;
	}
	public String getCommented_by() {
		return commented_by;
	}
	public void setCommented_by(String commented_by) {
		this.commented_by = commented_by;
	}
	
	
	

}
