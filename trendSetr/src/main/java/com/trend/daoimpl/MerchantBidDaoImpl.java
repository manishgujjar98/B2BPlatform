package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.MerchantBidDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.MerchantBid;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class MerchantBidDaoImpl implements MerchantBidDaoInf {

	private Logger logger = Logger.getLogger(MerchantBidDaoImpl.class);
	private String idGen = null;

	public void add(MerchantBid merchantBid) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.MERCHANT_BID_INSERT);
			idGen = "MRB" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, merchantBid.getUserId());
			pstmt.setString(3, merchantBid.getBidId());
			pstmt.setDouble(4, merchantBid.getBidPrice());
			pstmt.setBoolean(5, merchantBid.getBidApproval());
			pstmt.setDate(6, merchantBid.getBiddedOn());
			pstmt.setDate(7, merchantBid.getApprovedOn());
			pstmt.setString(8, merchantBid.getMerchantBidImage());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public void update(MerchantBid merchantBid) {
	}

	public ArrayList<MerchantBid> retrieve(String merchantBidId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MerchantBid> retrievedList = new ArrayList<MerchantBid>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_BID_RETRIEVE);
			pstmt.setString(1, merchantBidId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MerchantBid merchantBid = new MerchantBid();
				merchantBid.setUserId(rs.getString("user_id"));
				merchantBid.setBidId(rs.getString("bid_id"));
				merchantBid.setBidPrice(rs.getDouble("bid_price"));
				merchantBid.setBidApproval(rs.getBoolean("bid_approval"));
				merchantBid.setBiddedOn(rs.getDate("bidded_on"));
				merchantBid.setApprovedOn(rs.getDate("approved_on"));
				merchantBid.setMerchantBidImage(rs.getString("merchant_bid_image"));
				retrievedList.add(merchantBid);
			}

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}
		return retrievedList;

	}

	public ArrayList<MerchantBid> retrieveAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MerchantBid> retrievedList = new ArrayList<MerchantBid>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_BID_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MerchantBid merchantBid = new MerchantBid();
				merchantBid.setUserId(rs.getString("user_id"));
				merchantBid.setBidId(rs.getString("bid_id"));
				merchantBid.setBidPrice(rs.getDouble("bid_price"));
				merchantBid.setBidApproval(rs.getBoolean("bid_approval"));
				merchantBid.setBiddedOn(rs.getDate("bidded_on"));
				merchantBid.setApprovedOn(rs.getDate("approved_on"));
				merchantBid.setMerchantBidImage(rs.getString("merchant_bid_image"));
				retrievedList.add(merchantBid);
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
