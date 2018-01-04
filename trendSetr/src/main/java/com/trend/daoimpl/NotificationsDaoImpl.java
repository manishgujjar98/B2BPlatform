package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.AccountSettings;
import com.trend.models.NotificationSettings;
import com.trend.utils.DBHelper;

public class NotificationsDaoImpl {
	private Logger logger = Logger.getLogger(NotificationsDaoImpl.class);

	AccountSettings accountSettings = new AccountSettings();

	public void notificationSetting(NotificationSettings notificationSettings) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.NOTIFICATION_SETTINGS);

			pstmt.setString(1, notificationSettings.getUserId());
			pstmt.setBoolean(2, notificationSettings.isDailyPerformance());
			pstmt.setBoolean(3, notificationSettings.isAccountChanges());
			pstmt.setBoolean(4, notificationSettings.isTrendSetrPromos());
			pstmt.setBoolean(5, notificationSettings.isCustomerDirectMessages());

			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

	}

	public int findMerchant(String mId) {
		Connection conn = null;
		int check = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			logger.info("connection" + conn);
			System.out.println("MERCHANT ID -->  "+mId);
			pstmt = conn.prepareStatement(Queries.NOTIFICATION_MERCHANT);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			while(rs.next()){
				check = rs.getInt(1);
			}
			return check;
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}

		return check;
	}

	public void updateAccountSetting(NotificationSettings notificationSettings) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.NOTIFICATION_UPDATE_SETTINGS);
			/*
			 * System.out.println(notificationSettings.isDailyPerformance());
			 * System.out.println( notificationSettings.isAccountChanges());
			 * System.out.println(notificationSettings.isTrendSetrPromos());
			 * System.out.println(
			 * notificationSettings.isCustomerDirectMessages());
			 */

			pstmt.setBoolean(1, notificationSettings.isDailyPerformance());
			pstmt.setBoolean(2, notificationSettings.isAccountChanges());
			pstmt.setBoolean(3, notificationSettings.isTrendSetrPromos());
			pstmt.setBoolean(4, notificationSettings.isCustomerDirectMessages());
			pstmt.setString(5, notificationSettings.getUserId());

			pstmt.executeUpdate();
			pstmt.close();
			conn.commit();
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

	}

	public NotificationSettings retrieveAccount(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		NotificationSettings ns = null;

		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.NOTIFICATION_DATA);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ns = new NotificationSettings();
				ns.setAccountChanges(rs.getBoolean("ACCOUNT_CHANGES"));
				ns.setCustomerDirectMessages(rs.getBoolean("CUSTOMER_DIRECT_MESSAGES"));
				ns.setDailyPerformance(rs.getBoolean("DAILY_PERFORMANCE"));
				ns.setTrendSetrPromos(rs.getBoolean("TRENDSETR_PROMOS"));
			}
			pstmt.close();
			conn.commit();
			return ns;
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return ns;

	}

}
