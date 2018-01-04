package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.UserWalletDaoInf;
import com.trend.models.UserWallet;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class UserWalletDaoImpl implements UserWalletDaoInf {
	private Logger logger = Logger.getLogger(UserWalletDaoImpl.class);
	private String idGen = null;
	private Double totalEarnings = null;

	public void addUpdate(String userId, Double earningAmount, String earningId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {

			// Check for entry in wallet table, because there should not be a
			// duplicate entry in wallet table for any user

			String check = conditionForAddUpdate(userId);
			if (check.equals(null)) {

				conn = DBHelper.getConn();
				logger.info("connection" + conn);
				pstmt = conn.prepareStatement(Queries.USER_WALLET_INSERT);
				idGen = "URW" + CommonsUtils.getID();
				pstmt.setString(1, idGen);
				pstmt.setString(2, userId);
				pstmt.setString(3, earningId);
				pstmt.executeUpdate();

			} else if (check.equals(userId)) {

				totalEarnings = conditionForAddEarnings(userId, earningAmount);
				conn = DBHelper.getConn();
				logger.info("connection" + conn);
				pstmt = conn.prepareStatement(Queries.USER_WALLET_UPDATE);
				pstmt.setDouble(1, totalEarnings);
				pstmt.setString(2, userId);
				pstmt.executeUpdate();

			} else {

				logger.info(" Given Id is Invalid !!! ");
			}
		} catch (SQLException e) {
			logger.info(e.toString());
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}
	}

	// method to check weather an user exist in wallet table

	public String conditionForAddUpdate(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ret = null;

		try {

			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.USER_WALLET_RETRIEVE_SELECTED);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ret = rs.getString("USER_ID");
			}

		} catch (SQLException e) {
			logger.info(e.toString());
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}

		return ret;
	}

	public Double conditionForAddEarnings(String userId, Double eAmount) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Double tEarnings = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.USER_WALLET_RETRIEVE_SELECTED);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				tEarnings = rs.getDouble("TOTAL_EARNINGS");
				tEarnings += eAmount;
			}
		} catch (SQLException e) {
			logger.info(e.toString());
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		return tEarnings;
	}

	public ArrayList<UserWallet> retrieve(String userWalletId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserWallet> retrievedList = new ArrayList<UserWallet>();

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.USER_WALLET_RETRIEVE_SELECTED);
			pstmt.setString(1, userWalletId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				UserWallet userWallet = new UserWallet();
				userWallet.setUserId(rs.getString("USER_ID"));
				userWallet.setTotalEarnings(rs.getDouble("TOTAL_EARNINGS"));
				userWallet.setCreatedBy(rs.getString("CREATED_BY"));
				userWallet.setCreatedTime(rs.getDate("CREATED_TIME"));
				userWallet.setUpdatedBy(rs.getString("UPDATED_BY"));
				userWallet.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(userWallet);
			}
		} catch (SQLException e) {
			logger.info(e.toString());

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return retrievedList;
	}

	public ArrayList<UserWallet> retrieveAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserWallet> retrievedList = new ArrayList<UserWallet>();
		UserWallet userWallet = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.USER_WALLET_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				userWallet = new UserWallet();
				userWallet.setUserId(rs.getString("USER_ID"));
				userWallet.setTotalEarnings(rs.getDouble("TOTAL_EARNINGS"));
				userWallet.setCreatedBy(rs.getString("CREATED_BY"));
				userWallet.setCreatedTime(rs.getDate("CREATED_TIME"));
				userWallet.setUpdatedBy(rs.getString("UPDATED_BY"));
				userWallet.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(userWallet);
			}
		} catch (SQLException e) {
			logger.info(e.toString());

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return retrievedList;
	}

}
