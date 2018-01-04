package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.EarningsDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.Earnings;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class EarningsDaoImpl implements EarningsDaoInf {
	private Logger logger = Logger.getLogger(EarningsDaoImpl.class);
	private String idGen = null;
	UserWalletDaoImpl userWalletDaoImpl = new UserWalletDaoImpl();

	public void add(Earnings earnings) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.EARNINGS_INSERT);
			idGen = "ERN" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, earnings.getUserId());
			pstmt.setDouble(3, earnings.getAmount());
			pstmt.setString(4, earnings.getEarnedFrom());
			pstmt.setString(5, earnings.getProductId());
			pstmt.setDouble(6, earnings.getEarnedShare());
			pstmt.setString(7, earnings.getCreatedBy());
			pstmt.executeUpdate();
			userWalletDaoImpl.addUpdate(earnings.getUserId(), earnings.getAmount(), idGen);

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}
	}

	public void update(Earnings earnings) {
	}

	public ArrayList<Earnings> retrieve(String earningId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Earnings> retrievedList = new ArrayList<Earnings>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.EARNINGS_RETRIEVE_SELECTED);
			pstmt.setString(1, earningId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Earnings earnings = new Earnings();
				earnings.setAmount(rs.getDouble("AMOUNT"));
				earnings.setEarnedFrom(rs.getString("EARNED_FROM"));
				earnings.setProductId(rs.getString("PRODUCT_ID"));
				earnings.setEarnedShare(rs.getDouble("EARNED_SHARE"));
				earnings.setCreatedBy(rs.getString("CREATED_BY"));
				earnings.setCreatedTime(rs.getDate("CREATED_TIME"));
				retrievedList.add(earnings);
			}
		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}
		return retrievedList;
	}

	public ArrayList<Earnings> retrieveAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Earnings> retrievedList = new ArrayList<Earnings>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.EARNINGS_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Earnings earnings = new Earnings();
				earnings.setAmount(rs.getDouble("AMOUNT"));
				earnings.setEarnedFrom(rs.getString("EARNED_FROM"));
				earnings.setProductId(rs.getString("PRODUCT_ID"));
				earnings.setEarnedShare(rs.getDouble("EARNED_SHARE"));
				earnings.setCreatedBy(rs.getString("CREATED_BY"));
				earnings.setCreatedTime(rs.getDate("CREATED_TIME"));
				retrievedList.add(earnings);
			}
		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return retrievedList;
	}

}
