package com.trend.resources;

import javax.mail.Message;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.trend.enums.MessageEnum;
import com.trend.models.NotificationSettings;
import com.trend.serviceimpl.NotificationsService;


@Path("/notifications")
public class NotificationResource {
	NotificationsService notificationService = new NotificationsService();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MessageEnum addAccount(NotificationSettings notificationSettings) {
		System.out.println("TEST Notification Settings");
		notificationService.addAccount(notificationSettings);
		return MessageEnum.MESSAGE_SUCCESS;
	}
	
	@GET
	@Path("{userId}")
	@Produces(MediaType.APPLICATION_JSON)
	public NotificationSettings retrieveAccount(@PathParam("userId") String userId) {
		System.out.println("TEST Notification Settings " + userId);
		return notificationService.retrieveAccount(userId);

	}

}