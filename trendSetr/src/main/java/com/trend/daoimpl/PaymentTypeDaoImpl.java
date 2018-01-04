package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trend.constants.Queries;
import com.trend.daoinf.PaymentTypeDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.Address;
import com.trend.models.PaymentType;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class PaymentTypeDaoImpl implements PaymentTypeDaoInf {
	private Logger logger = Logger.getLogger(PaymentTypeDaoImpl.class);
	private String idGen = null;
    private Gson gson = new Gson();

	public void add(PaymentType paymentType)  {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PAYMENT_TYPE_INSERT);
			idGen = "PYT"+CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, paymentType.getUserId());
			pstmt.setString(3,paymentType.getCardName());
			pstmt.setString(4, paymentType.getCardNumber());
			pstmt.setString(5, paymentType.getExpirationDate());
			pstmt.setString(6, paymentType.getCardType());
			pstmt.setObject(7, new Gson().toJson(paymentType.getBillingAddress()));
			pstmt.setString(8, paymentType.getCreatedBy());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

		
	}

	public void update(PaymentType paymentType)  {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PAYMENT_TYPE_UPDATE);

			
			pstmt.setString(1,paymentType.getCardName());
			pstmt.setString(2, paymentType.getCardNumber());
			pstmt.setString(3, paymentType.getExpirationDate());
			pstmt.setString(4, paymentType.getCardType());
			pstmt.setObject(5, new Gson().toJson(paymentType.getBillingAddress()));
			pstmt.setString(6, paymentType.getUpdatedBy());
			pstmt.setString(7, paymentType.getId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

		
		
	}

	public ArrayList<PaymentType> retrieve(String paymentTypeId)  {
     
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PaymentType> retrievedList = new ArrayList<PaymentType>();
		ArrayList<Object> billingAddress = new ArrayList<Object>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PAYMENT_TYPE_RETRIEVE_SELECTED);
			pstmt.setString(1, paymentTypeId);
			rs = pstmt.executeQuery();
			TypeToken<ArrayList<Address>> token = new TypeToken<ArrayList<Address>>() {};
			while (rs.next()) {
				PaymentType paymentType = new PaymentType();
				paymentType.setCardName(rs.getString("CARD_NAME"));
				paymentType.setCardNumber(rs.getString("CARD_NUMBER"));
				paymentType.setExpirationDate(rs.getString("EXPIRATION_DATE"));
				paymentType.setCardType(rs.getString("CARD_TYPE"));
				billingAddress = gson.fromJson(rs.getString("billing_address"), token.getType());
				paymentType.setBillingAddress(billingAddress);
				paymentType.setCreatedBy(rs.getString("CREATED_BY"));
				paymentType.setCreatedTime(rs.getDate("CREATED_TIME"));
				paymentType.setUpdatedBy(rs.getString("UPDATED_BY"));
				paymentType.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(paymentType);
			}
			
		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return retrievedList;
	
	}

	public ArrayList<PaymentType> retrieveAll()  {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<PaymentType> retrievedList = new ArrayList<PaymentType>();
		ArrayList<Object> billingAddress = new ArrayList<Object>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PAYMENT_TYPE_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			TypeToken<ArrayList<Address>> token = new TypeToken<ArrayList<Address>>() {};
			while (rs.next()) {
				PaymentType paymentType = new PaymentType();
				paymentType.setCardName(rs.getString("CARD_NAME"));
				paymentType.setCardNumber(rs.getString("CARD_NUMBER"));
				paymentType.setExpirationDate(rs.getString("EXPIRATION_DATE"));
				paymentType.setCardType(rs.getString("CARD_TYPE"));
				billingAddress = gson.fromJson(rs.getString("billing_address"), token.getType());
				paymentType.setBillingAddress(billingAddress);
				paymentType.setCreatedBy(rs.getString("CREATED_BY"));
				paymentType.setCreatedTime(rs.getDate("CREATED_TIME"));
				paymentType.setUpdatedBy(rs.getString("UPDATED_BY"));
				paymentType.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(paymentType);
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
