package com.trend.serviceimpl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.UserDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Profiles;
import com.trend.models.User;
import com.trend.serviceinf.UserServiceInf;
import com.trend.utils.CryptUtilities;

public class UserServiceImpl implements UserServiceInf {
	protected final Logger log = Logger.getLogger(getClass());
	UserDaoImpl userDaoImpl = new UserDaoImpl();

	public MessageEnum add(User user) {
		try {
			/*String encryptedPassword = CryptUtilities.encryptPassword(user.getPassword());
			user.setPassword(encryptedPassword);*/
			System.out.println("*************2***********");
			userDaoImpl.add(user);
			System.out.println("success");
			return MessageEnum.MESSAGE_SUCCESS;
		} catch (PersistException e) {
			e.printStackTrace();
			return MessageEnum.MESSAGE_FAILUR;
		}

	}

	public MessageEnum update(User user) {
		try {
			userDaoImpl.update(user);
			return MessageEnum.MESSAGE_SUCCESS;
		} catch (PersistException e) {
			e.printStackTrace();
			return MessageEnum.MESSAGE_FAILUR;
		}

	}
	
	public User findUser(String userId){
		User user = new User();
		user.setUserId(userId);
		return userDaoImpl.userLogin(user);
	}

	// update admin password
	public User updateAdminPassword(User user) {
		
		try {
			User userObj = userDaoImpl.userLogin(user);
			
			
			if (userObj != null) {
				if (CryptUtilities.checkPassword(user.getPassword(), userObj.getPassword())) {
					System.out.println("*********** boolean value******"
							+ CryptUtilities.checkPassword(user.getPassword(), userObj.getPassword()));
					return userDaoImpl.updateAdminPassword(user);
					
					
				}else{
					user.setRoleId(userObj.getRoleId());
					user.setUserStatus("current_password_notmatch");
					
				}
			}
			
			//return MessageEnum.MESSAGE_SUCCESS;
		} catch (PersistException e) {
			e.printStackTrace();
			//return MessageEnum.MESSAGE_FAILUR;
		}
		return user;
	}

	public String delete(User user) {
		return null;
	}

	public User userLogin(User user) {

		User userObj = new User();
		try {
			// System.out.println("**************** 1**********");
			userObj = userDaoImpl.userLogin(user);
/*			userObj.setStatus(user.getStatus());
*/			if (userObj != null) {
				if (CryptUtilities.checkPassword(user.getPassword(), userObj.getPassword())) {
					System.out.println("*********** boolean value******"
							+ CryptUtilities.checkPassword(user.getPassword(), userObj.getPassword()));
					userObj.setDateOfBirth(null);
					return userObj;
					
				} else {
					userObj = new User();
					userObj.setPassword("PASSWORD_NOT_MATCH");
					return userObj;
					/*ResponseBuilder responseBuilder = Response.status(Response.Status.FORBIDDEN);
					Response response = responseBuilder.entity("Password didnot match").build();		
					throw new WebApplicationException(response);*/
					
				}
			}
			 else {
				userObj = new User();
				userObj.setUserId(null);
				userObj.setPassword(null);
				return userObj;
			}
		} catch (PersistException e) {
			e.printStackTrace();
			return null;
		}

	}

	public User userSettings(User user) {
		try {
			user = userDaoImpl.userSettings(user);
		} catch (PersistException e) {
			e.printStackTrace();
			return null;
		}
		return user;
	}

	public ArrayList<User> allUsers() {
		ArrayList<User> usersList = null;
		try {
			usersList = userDaoImpl.allUsers();
		} catch (PersistException e) {
			log.error(e.getMessage());
		}
		return usersList;
	}

	public ArrayList<User> allMerchants(String roleId) {
		ArrayList<User> usersList = null;
		try {
			usersList = userDaoImpl.allMerchants(roleId);
		} catch (PersistException e) {
			log.error(e.getMessage());
		}
		return usersList;
	}

	public static void main(String[] args) {
		System.out.println(CryptUtilities.encryptPassword("123"));
	}

	public User findMerchantDetails(String merchantId) {
		User merchant = null;
		try {
			merchant = userDaoImpl.findMerchantDetails(merchantId);

		} catch (PersistException e) {
			log.error(e.getMessage());
		}
		return merchant;
	}

	public User findInfluencerDetails(String influencerId) {
		User influencer = null;
		try {
			influencer = userDaoImpl.findInfluencerDetails(influencerId);

		} catch (PersistException e) {
			log.error(e.getMessage());
		}
		return influencer;
	}

	public User findEmployeeDetails(String empMail) {
		User employee = null;
		try {
			employee = userDaoImpl.findEmployeeDetails(empMail);

		} catch (PersistException e) {
			log.error(e.getMessage());
		}
		return employee;
	}
	
	public Profiles retrieveStoreName(String userId){
		Profiles profile = null;
		/*profile.setStoreName("storeName");
		return profile;*/
		
		try {
			profile = userDaoImpl.retrieveStoreName(userId);

		} catch (PersistException e) {
			log.error(e.getMessage());
		}
		return profile;
	}
	
	public User reSetPassword(User user){
		
		try {
			User cUser = userDaoImpl.userLogin(user);
			if(cUser != null){
				System.out.println("Find user in DB");
				/*DateFormat df = new SimpleDateFormat("YYYY-mm-dd");
				String reportDate = df.format(cUser.getDateOfBirth());*/
			//	if(user.getDateOfBirth().equals(cUser.getDateOfBirth())){
					System.out.println("Find user in DOB Match");
					return userDaoImpl.updateAdminPassword(user);
			//	}
			}
			
			

		} catch (PersistException e) {
			log.error(e.getMessage());
		}
		return user;
	}

}
