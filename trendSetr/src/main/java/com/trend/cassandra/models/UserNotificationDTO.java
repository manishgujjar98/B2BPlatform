package com.trend.cassandra.models;

import java.util.Date;

import com.datastax.driver.mapping.annotations.ClusteringColumn;
import com.datastax.driver.mapping.annotations.PartitionKey;
import com.datastax.driver.mapping.annotations.Table;

@Table(keyspace = "trendSetr", name = "user_notification", caseSensitiveTable = false,  caseSensitiveKeyspace = true)

public class UserNotificationDTO {
	
	@PartitionKey
	private String user_id;
	@ClusteringColumn
	private String notification_id;
	private boolean has_seen;
	private String notification_message;
	private String notification_on;
	private Date notification_time;
	private String notification_type;
	private String notified_by;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNotification_id() {
		return notification_id;
	}
	public void setNotification_id(String notification_id) {
		this.notification_id = notification_id;
	}
	public boolean isHas_seen() {
		return has_seen;
	}
	public void setHas_seen(boolean has_seen) {
		this.has_seen = has_seen;
	}
	public String getNotification_message() {
		return notification_message;
	}
	public void setNotification_message(String notification_message) {
		this.notification_message = notification_message;
	}
	public String getNotification_on() {
		return notification_on;
	}
	public void setNotification_on(String notification_on) {
		this.notification_on = notification_on;
	}
	public Date getNotification_time() {
		return notification_time;
	}
	public void setNotification_time(Date notification_time) {
		this.notification_time = notification_time;
	}
	public String getNotification_type() {
		return notification_type;
	}
	public void setNotification_type(String notification_type) {
		this.notification_type = notification_type;
	}
	public String getNotified_by() {
		return notified_by;
	}
	public void setNotified_by(String notified_by) {
		this.notified_by = notified_by;
	}

}
