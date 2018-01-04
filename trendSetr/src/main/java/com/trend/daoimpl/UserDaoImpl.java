package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.pwd.CryptUtilities;
import com.trend.constants.Queries;
import com.trend.daoinf.UserDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.Address;
import com.trend.models.Merchant;
import com.trend.models.Profiles;
import com.trend.models.User;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class UserDaoImpl implements UserDaoInf {
	protected final Logger log = Logger.getLogger(getClass());
	private String idGen = null;
	private String genId = null;
	private String idFor = null;

	public void add(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			log.info("Got the connection to add user:" + user.getFirstName() + user.getLastName());
			System.out.println("**********" + user.getRoleId());
			String encryptedPassword = CryptUtilities.encryptPassword(user.getPassword());
			if ((user.getRoleId().equals("2")))
				encryptedPassword = CryptUtilities.encryptPassword("");

			pstmt = conn.prepareStatement(Queries.USER_INSERT);
			pstmt.setString(1, user.getFirstName());
			pstmt.setString(2, user.getLastName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhoneNumber());
			pstmt.setString(5, user.getUserId());
			pstmt.setString(6, encryptedPassword);
			pstmt.setString(7, user.getGender());
			pstmt.setDate(8, user.getDateOfBirth());
			pstmt.setString(9, user.getStatus());
			pstmt.setString(10, user.getCreatedBy());
			int i = pstmt.executeUpdate();
			pstmt.close();
			// conn.commit();

			// Adding influencers
			if (user.getRoleId().equals("5")) {
				pstmt = conn.prepareStatement(Queries.USER_INFLUENCER);
				idGen = "INF" + CommonsUtils.getID();
				pstmt.setString(1, idGen);
				pstmt.setString(2, user.getUserId());
				pstmt.setDate(3, user.getDateOfBirth());
				pstmt.setString(4, user.getFirstName() + " " + user.getLastName());
				pstmt.setString(5, user.getPhoneNumber());
				pstmt.setString(6, user.getEmail());
				pstmt.setString(7, user.getStatus());
				pstmt.setString(8, user.getFacebook());
				pstmt.setString(9, user.getTwitter());
				pstmt.setString(10, user.getInstagram());
				pstmt.executeUpdate();
				pstmt.close();
			}
			// Adding Merchants to merchants table

			if (user.getRoleId().equals("3")) {
				Profiles profile = user.getProfile();
				pstmt = conn.prepareStatement(Queries.MERCHANT_INSERT);
				idGen = "MER" + CommonsUtils.getID();
				pstmt.setString(1, idGen);
				pstmt.setString(2, profile.getStoreName());
				pstmt.setString(3, user.getCreatedBy());
				pstmt.setString(4, user.getUserId());
				pstmt.executeUpdate();
				pstmt.close();
			}

			// adding role to roles table
			pstmt = conn.prepareStatement(Queries.USER_INSERT_ROLE);
			idFor = "URS" + CommonsUtils.getID();
			// pstmt.setString(1, idFor);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getRoleId());
			pstmt.executeUpdate();
			pstmt.close();

			// adding profile details to profiles table
			if (!(user.getRoleId().equals("2"))) {
				System.out.println("test");
				Profiles profile = user.getProfile();
				pstmt = conn.prepareStatement(Queries.USER_INSERT_PROFILE);
				idGen = "PRF" + CommonsUtils.getID();
				pstmt.setString(1, idGen);
				pstmt.setString(2, user.getUserId());
				pstmt.setString(3, profile.getUploadImage());
				pstmt.setString(4, profile.getProfileImage());
				pstmt.setString(5, profile.getBannerImage());
				pstmt.setString(6, profile.getPositionHeld());
				pstmt.setString(7, profile.getStoreName());
				pstmt.setString(8, profile.getCreatedBy());
				pstmt.executeUpdate();
				pstmt.close();
				if (!user.getRoleId().equals("5")) {
					// adding address details to address table
					Address adrss = user.getAddress();
					pstmt = conn.prepareStatement(Queries.ADDRESS_INSERT);
					genId = "ADR" + CommonsUtils.getID();
					pstmt.setString(1, genId);
					pstmt.setString(2, user.getFirstName());
					pstmt.setString(3, user.getLastName());
					pstmt.setString(4, adrss.getAddressLine1());
					pstmt.setString(5, null);
					pstmt.setString(6, adrss.getCity());
					pstmt.setString(7, adrss.getState());
					pstmt.setString(8, adrss.getZip());
					pstmt.setString(9, adrss.getCountry());
					pstmt.setString(10, user.getPhoneNumber());
					System.out.println("***** Status **** " + adrss.getStatus());
					pstmt.setString(11, adrss.getStatus());
					pstmt.setString(12, adrss.getCreatedBy());
					pstmt.setString(13, adrss.getShippingImage());
					pstmt.setString(14, user.getUserId());
					pstmt.executeUpdate();

				}
			}
			conn.commit();

		} catch (SQLException e) {
			log.error(e.getMessage());
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public void update(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {

			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			log.info(conn + "Got the connection to update user:" + user.getUserId());
			String encryptedPassword = CryptUtilities.encryptPassword(user.getPassword());
			pstmt = conn.prepareStatement(Queries.USER_UPDATE);
			/*
			 * System.out.println(user.getFirstName());
			 * System.out.println(user.getLastName());
			 * System.out.println(user.getEmail());
			 * System.out.println(user.getPhoneNumber());
			 * System.out.println(user.getDateOfBirth());
			 * System.out.println(user.getStatus());
			 * System.out.println(user.getCreatedBy());
			 * System.out.println(user.getUserId());
			 */
			pstmt.setString(1, user.getFirstName());
			pstmt.setString(2, user.getLastName());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getPhoneNumber());
			// pstmt.setString(5, encryptedPassword);
			pstmt.setDate(5, user.getDateOfBirth());
			pstmt.setString(6, user.getStatus());
			pstmt.setString(7, user.getCreatedBy());
			pstmt.setString(8, user.getUserId());
			pstmt.executeUpdate();
			pstmt.close();

			// Updating influencers
			if ("5".equals(user.getRoleId())) {
				pstmt = conn.prepareStatement(Queries.UPDATE_INFLUENCER);

				pstmt.setString(1, user.getFirstName() + " " + user.getLastName());
				pstmt.setString(2, user.getPhoneNumber());
				pstmt.setString(3, user.getEmail());
				pstmt.setString(4, user.getStatus());
				pstmt.setString(5, user.getFacebook());
				pstmt.setString(6, user.getTwitter());
				pstmt.setString(7, user.getInstagram());
				pstmt.setString(8, user.getUserId());
				pstmt.executeUpdate();
				pstmt.close();
			}

			Profiles profile = user.getProfile();
			if (profile != null) {
				pstmt = conn.prepareStatement(Queries.USER_UPDATE_PROFILE);
				pstmt.setString(1, profile.getBannerImage());
				pstmt.setString(2, profile.getProfileImage());
				pstmt.setString(3, profile.getStoreName());
				pstmt.setString(4, profile.getPositionHeld());
				pstmt.setString(5, user.getUserId());

				pstmt.executeUpdate();
				pstmt.close();
			}

			// adding address details to address table
			Address adrss = user.getAddress();
			if (adrss != null) {
				pstmt = conn.prepareStatement(Queries.USER_UPDATE_ADDRESS);
				pstmt.setString(1, adrss.getAddressLine1());
				pstmt.setString(2, adrss.getCity());
				pstmt.setString(3, adrss.getState());
				pstmt.setString(4, adrss.getZip());
				pstmt.setString(5, adrss.getCountry());
				pstmt.setString(6, user.getUserId());
				pstmt.executeUpdate();
				pstmt.close();
			}
			conn.commit();
		} catch (SQLException e) {
			System.out.println("i am in catch sql excep" + e);
			log.error(e.getMessage());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}
	}
	// updating admin password

	public User updateAdminPassword(User user) {
		/* old code 
		 * Connection conn = null; PreparedStatement pstmt = null; try {
		 * 
		 * conn = DBHelper.getConn(); conn.setAutoCommit(false); log.info(conn +
		 * "Got the connection to update user:" + user.getUserId()); String
		 * encryptedPassword =
		 * CryptUtilities.encryptPassword(user.getPassword()); pstmt =
		 * conn.prepareStatement(Queries.USER_UPDATE_PASSWORD);
		 * System.out.println(user.getFirstName()); pstmt.setString(1,
		 * user.getUserId()); pstmt.setString(2, user.getPassword());
		 * pstmt.executeUpdate(); pstmt.close();
		 * 
		 * conn.commit();
		 */
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User userObj = new User();
		try {

			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			if (user.getNewPassword() != null && user.getNewPassword() != "") {
				System.out.println(conn + "   Got the connection to update user:" + user.getUserId());
				String encryptedPassword = CryptUtilities.encryptPassword(user.getNewPassword());
				pstmt = conn.prepareStatement(Queries.USER_UPDATE_PASSWORD);
				pstmt.setString(1, encryptedPassword);
				pstmt.setString(2, user.getUserId());
				pstmt.executeUpdate();
				pstmt.close();
			}
			
			if (user.getPassword() != null && user.getPassword() != "") {
				System.out.println(conn + "   Got the connection to update user:" + user.getUserId());
				String encryptedPassword = CryptUtilities.encryptPassword(user.getPassword());
				pstmt = conn.prepareStatement(Queries.USER_UPDATE_PASSWORD);
				pstmt.setString(1, encryptedPassword);
				pstmt.setString(2, user.getUserId());
				pstmt.executeUpdate();
				pstmt.close();
			}

			/*pstmt = conn.prepareStatement(Queries.USER_UPDATE_PROFILESTORE);
			pstmt.setString(1, user.getProfile().getStoreName());
			pstmt.setString(2, user.getUserId());
			pstmt.executeUpdate();
			pstmt.close();*/

			conn.commit();
			conn.close();
			conn = DBHelper.getConn();
			if (user.getUserId() != null || user.getEmail() != null) {

				if (user.getUserId() != null) {

					pstmt = conn.prepareStatement(Queries.USER_LOGIN);
					pstmt.setString(1, user.getUserId());

				}

				rs = pstmt.executeQuery();
				while (rs.next()) {
					userObj.setFirstName(rs.getString("first_name"));
					userObj.setLastName(rs.getString("last_name"));
					userObj.setPassword(rs.getString("password"));
					userObj.setRoleId(rs.getString("role_id"));
					userObj.setUserId(rs.getString("user_id"));
					/*Profiles profile = new Profiles();
					profile.setStoreName(rs.getString("STORE_NAME"));
					userObj.setProfile(profile);*/
				}
			}
			return userObj;

		} catch (SQLException e) {
			log.error(e.getMessage());
			//ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}
		return userObj;
	}

	public void delete(User user) {
	}

	public ArrayList<User> allUsers() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<User> usersList = new ArrayList<User>();
		try {
			conn = DBHelper.getConn();
			log.info("Got the connection inside all users:" + conn.toString());
			pstmt = conn.prepareStatement(Queries.USERS_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getString("userId"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmail(rs.getString("eMail"));
				user.setPhoneNumber(rs.getString("phoneNumber"));
				user.setRoleId(rs.getString("roleID"));
				user.setStatus(rs.getString("status"));
				user.setCreatedBy(rs.getString("createdBy"));
				user.setCreatedTime(rs.getDate("createdTime"));
				// user.setCreatedTime(new Date(0));
				usersList.add(user);
			}
		} catch (SQLException e) {
			log.error(e.getMessage());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return usersList;
	}

	public User userSettings(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			log.info("Got the connection inside userSettings:" + conn.toString());
			pstmt = conn.prepareStatement(Queries.USER_SETTINGS);
			pstmt.setString(1, user.getUserId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setPhoneNumber(rs.getString("phone_number"));
				user.setDateOfBirth(rs.getDate("date_of_birth"));
			}
		} catch (SQLException e) {
			log.error(e.getMessage());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return user;
	}

	public User userLogin(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User userObj = null;
		try {
			conn = DBHelper.getConn();
			log.info("Got the connection inside userLogin:" + conn.toString());
			System.out.println("user ID : "+user.getUserId());
			if (user.getUserId() != null || user.getEmail() != null) {

				if (user.getUserId() != null && user.getEmail() == null) {

					pstmt = conn.prepareStatement(Queries.USER_LOGIN);
					pstmt.setString(1, user.getUserId());

				} else if (user.getUserId() == null && user.getEmail() != null) {

					pstmt = conn.prepareStatement(Queries.USER_LOGIN_EMAIL);
					pstmt.setString(1, user.getEmail());
				}

				rs = pstmt.executeQuery();
				while (rs.next()) {
					userObj = new User();
					userObj.setFirstName(rs.getString("first_name"));
					userObj.setLastName(rs.getString("last_name"));
					userObj.setPassword(rs.getString("password"));
					userObj.setRoleId(rs.getString("role_id"));
					userObj.setUserId(rs.getString("user_id"));
					userObj.setDateOfBirth(rs.getDate("date_of_birth"));
					
					/*Profiles profile = new Profiles();
					profile.setStoreName(rs.getString("STORE_NAME"));
					userObj.setProfile(profile);*/

				}
			}
		} catch (SQLException e) {
			log.error(e.getMessage());
			//ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return userObj;
	}

	public ArrayList<User> allMerchants(String roleId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<User> usersList = new ArrayList<User>();
		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.MERCHANTS_ALL);
			// System.out.println(roleId);
			pstmt.setString(1, roleId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setFirstName(rs.getString("first_name"));
				user.setLastName(rs.getString("last_name"));
				user.setCreatedBy(rs.getString("created_by"));
				user.setCreatedTime(rs.getDate("created_time"));
				user.setStatus(rs.getString("status"));
				user.setUserId(rs.getString("user_id"));
				System.out.println(user.getUserId());
				user.setEmail(rs.getString("eMail"));
				usersList.add(user);
			}
		} catch (SQLException e) {
			log.error(e.getMessage());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return usersList;

	}

	public User findMerchantDetails(String merchantId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User merchant = null;
		Address address = null;
		Profiles profile = null;

		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.MERCHANT_DATA);
			pstmt.setString(1, merchantId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				merchant = new User();
				address = new Address();
				profile = new Profiles();
				merchant.setFirstName(rs.getString("firstName"));
				merchant.setLastName(rs.getString("lastName"));
				merchant.setPhoneNumber(rs.getString("phoneNumber"));
				merchant.setDateOfBirth(rs.getDate("date_of_birth"));
				merchant.setEmail(rs.getString("eMail"));
				merchant.setUserId(rs.getString("userID"));
				address.setAddressLine1(rs.getString("address"));
				address.setCity(rs.getString("city"));
				address.setState(rs.getString("state"));
				address.setZip(rs.getString("zip"));
				address.setCountry(rs.getString("country"));
				merchant.setAddress(address);
				profile.setStoreName(rs.getString("storeName"));
				profile.setPositionHeld(rs.getString("position_held"));
				merchant.setProfile(profile);
				System.out.println(rs.getString("firstName"));
				System.out.println(rs.getString("lastName"));
			}
		} catch (SQLException e) {
			log.error(e.getMessage());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		System.out.println(merchant);
		return merchant;

	}

	public User findInfluencerDetails(String influencerId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User influencer = null;

		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.INFLUENCER_DATA);
			pstmt.setString(1, influencerId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				influencer = new User();
				Profiles profile = new Profiles();
				System.out.println(rs.getString("firstName"));
				influencer.setFirstName(rs.getString("firstName"));
				influencer.setLastName(rs.getString("lastName"));
				influencer.setPhoneNumber(rs.getString("phoneNumber"));
				influencer.setDateOfBirth(rs.getDate("date_of_birth"));
				influencer.setEmail(rs.getString("eMail"));
				influencer.setUserId(rs.getString("userId"));
				influencer.setFacebook(rs.getString("facebook"));
				influencer.setTwitter(rs.getString("twitter"));
				influencer.setInstagram(rs.getString("instagram"));
				profile.setProfileImage(rs.getString("profileImage"));
				influencer.setProfile(profile);

			}
		} catch (SQLException e) {
			log.error(e.getMessage());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return influencer;

	}

	public User findEmployeeDetails(String empMail) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User employee = null;

		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.INFLUENCER_DATA);
			pstmt.setString(1, empMail);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				employee = new User();
				System.out.println(rs.getString("first_name"));
				employee.setFirstName(rs.getString("first_name"));
				employee.setLastName(rs.getString("last_name"));
				employee.setPhoneNumber(rs.getString("phone_number"));
				employee.setEmail(rs.getString("email"));
				employee.setUserId(rs.getString("user_id"));

			}
		} catch (SQLException e) {
			log.error(e.getMessage());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return employee;
	}
	
	
	public Profiles retrieveStoreName(String userId){
		Profiles profile = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.MERCHANT_STORE_NAME);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				profile = new Profiles();
				profile.setStoreName(rs.getString("STORE_NAME"));
			}
		} catch (SQLException e) {
			log.error(e.getMessage());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return profile;
	}

}