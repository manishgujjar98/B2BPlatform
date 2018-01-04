package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.BidDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.Bid;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class BidDaoImpl implements BidDaoInf {

	private Logger logger = Logger.getLogger(BidDaoImpl.class);
	private String genId = null;

	public void addBid(Bid bid) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("Success");
		logger.debug("Success");
		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.BID_INSERT);
			genId = "BID" + CommonsUtils.getID();
			pstmt.setString(1, bid.getUserId());
			pstmt.setDate(2, bid.getFromDate());
			pstmt.setDate(3, bid.getToDate());
			pstmt.setDouble(4, bid.getAmount());
			pstmt.setBoolean(5, bid.getStatus());
			pstmt.setString(6, genId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public void update(Bid bid) {
	}

	public ArrayList<Bid> retrieve(String bidId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Bid> retrievedList = new ArrayList<Bid>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.BID_RETRIEVE);
			pstmt.setString(1, bidId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bid bid = new Bid();
				bid.setUserId(rs.getString("user_id"));
				bid.setFromDate(rs.getDate("from_date"));
				bid.setToDate(rs.getDate("to_date"));
				bid.setAmount(rs.getDouble("bid_amount"));
				bid.setCreatedBy(rs.getString("created_by"));
				bid.setCreatedOn(rs.getDate("created_on"));
				bid.setStatus(rs.getBoolean("active_status"));
				retrievedList.add(bid);
			}

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}
		return retrievedList;
	}

	public ArrayList<Bid> retrieveAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Bid> retrievedList = new ArrayList<Bid>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.BID_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bid bid = new Bid();
				bid.setUserId(rs.getString("user_id"));
				bid.setFromDate(rs.getDate("from_date"));
				bid.setToDate(rs.getDate("to_date"));
				bid.setAmount(rs.getDouble("bid_amount"));
				bid.setCreatedBy(rs.getString("created_by"));
				bid.setCreatedOn(rs.getDate("created_on"));
				bid.setStatus(rs.getBoolean("active_status"));
				retrievedList.add(bid);
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
