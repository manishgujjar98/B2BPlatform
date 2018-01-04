package com.trend.resources;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.trend.enums.MessageEnum;
import com.trend.models.Profiles;
import com.trend.models.User;
import com.trend.serviceimpl.UserServiceImpl;
import com.trend.utils.EmailUtil;
import com.trend.utils.EmailUtil.EmailType;
import com.trendset.util.services.MailServices;
import com.trendset.util.services.SMSServices;
import com.trendset.utils.PropertiesUtils;

@Path("/user")
public class UserResource {

	UserServiceImpl userServiceImpl = new UserServiceImpl();

	@POST
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MessageEnum addUser(User user) {
		MessageEnum status;
		status = userServiceImpl.add(user);
		System.out.println("status" + status);
		switch (status) {
		case MESSAGE_SUCCESS: {

			if (user.getNotification() != null && user.getNotification().equals("S")) {
				SMSServices.sendSMS(user.getPhoneNumber(), "Welcome to Trendsetr");
			} else {
				Map<String, String> values = new HashMap<String, String>();
				values.put("firstName", user.getFirstName());

				String registrationUrl = PropertiesUtils.getInstance().getValue("RegistrationUrl");
				System.out.println("url" + registrationUrl);
				registrationUrl += "email=" + user.getEmail();
				registrationUrl += "&firstName=" + user.getFirstName();
				registrationUrl += "&lastName=" + user.getLastName();
				registrationUrl += "&dateOfBirth=" + user.getDateOfBirth();
				registrationUrl += "&phoneNumber=" + user.getPhoneNumber();
				registrationUrl += "&userRoleId=" + user.getRoleId();
				values.put("link", registrationUrl);
				if (user.getRoleId().equals("3")) {
					MailServices.sendMail(user.getEmail(), "Trendsetr Merchant",
							EmailUtil.getEmailText(EmailType.ADDUSER, values));
				} else if (user.getRoleId().equals("4")) {
					MailServices.sendMail(user.getEmail(), "Trendsetr Employee",
							EmailUtil.getEmailText(EmailType.ADDUSER, values));
				} else if (user.getRoleId().equals("5")) {
					MailServices.sendMail(user.getEmail(), "Trendsetr Influencer",
							EmailUtil.getEmailText(EmailType.ADDUSER, values));
				}
			}

		}
			break;
		case MESSAGE_FAILUR: {
			throw new WebApplicationException(Response.Status.BAD_REQUEST);
		}
		case AUTH: {
			throw new WebApplicationException(Response.Status.FORBIDDEN);
		}
		}

		return status;
	}

	@POST
	@Path("{userId}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public User userLogin(@PathParam("userId") String userId, User user) {
		return userServiceImpl.userLogin(user);
	}

	@PUT
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public MessageEnum updateUser(User user) {
		System.out.println("i am in userresource");
		return userServiceImpl.update(user);
	}

	@PUT
	@Path("{userId}")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public User userSettings(@PathParam("userId") String userId, User user) {
		return userServiceImpl.userSettings(user);
	}

	@PUT
	@Path("{update}/changePassword")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public User updateAdminPassword(User user) {
		return userServiceImpl.updateAdminPassword(user);
	}

	@GET
	@Path("{roleId}")
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<User> allMerchants(@PathParam("roleId") String roleId) {
		return userServiceImpl.allMerchants(roleId);
	}

	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<User> allUsers() {
		return userServiceImpl.allUsers();
	}

	@GET
	@Path("merchant/{marchantId}")
	@Produces(MediaType.APPLICATION_JSON)
	public User findMerchantDetails(@PathParam("marchantId") String marchantId) {

		return userServiceImpl.findMerchantDetails(marchantId);
	}

	@GET
	@Path("influencer/influencerinfo/{influencerId}")
	@Produces(MediaType.APPLICATION_JSON)
	public User findInfluencerDetails(@PathParam("influencerId") String influencerId) {
		System.out.println("influencerId  **** " + influencerId);
		return userServiceImpl.findInfluencerDetails(influencerId);
	}

	@GET
	@Path("{employee}/{employeeinfo}/{employeeId}/{emp}")
	@Produces(MediaType.APPLICATION_JSON)
	public User findEmployeeDetails(@PathParam("emp") String empMail) {
		System.out.println("emp  **** " + empMail);
		return userServiceImpl.findEmployeeDetails(empMail);
	}

	@GET
	@Path("{merchant}/{merchantStore}/{get}/{storeName}/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	public Profiles retrieveStoreName(@PathParam("id") String userId) {
		return userServiceImpl.retrieveStoreName(userId);
	}

	@POST
	@Path("{userUpdate}/{reset}")
	@Produces(MediaType.APPLICATION_JSON)
	public MessageEnum reSetPassword(User user) {

		User rUser = userServiceImpl.reSetPassword(user);
		if (rUser.getRoleId() != null)
			return MessageEnum.MESSAGE_SUCCESS;
		else
			return MessageEnum.MESSAGE_FAILUR;
	}

	@POST
	@Path("{getuser}/{get}/{userId}")
	@Produces(MediaType.APPLICATION_JSON)
	public User getUserID(@PathParam("userId") String userId) {
		User user = null;
		if (userId != null && userId != "") {
			user = userServiceImpl.findUser(userId);
			if (user != null) {
				String body = EmailUtil.getEmailText(EmailType.RESETPASSWORD, null);
				body = body.replace("{link}",
						"http://localhost:8082/trendSetrIntegration/PasswordController?emailInput=" + userId);
				 MailServices.sendMail(userId, "Trendsetr Merchant", body);
				user.setUserStatus("USER_FOUND");
			}
			else {
				user = new User();
				user.setUserStatus("USER_NOT_FOUND");
			}
		} 
		return user;
	}
}
