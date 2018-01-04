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
import com.trend.daoinf.TransactionDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.Transactions;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class TransactionDaoImpl implements TransactionDaoInf {

	private Logger logger = Logger.getLogger(TransactionDaoImpl.class);
	private String idGen = null;
	private Gson gson = new Gson();

	public void add(Transactions transactions) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.TRANSACTION_INSERT);
			idGen = "TRN" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, transactions.getUserId());
			pstmt.setString(3, transactions.getSourceId());
			pstmt.setString(4, transactions.getSourceType());
			pstmt.setString(5, transactions.getType());
			pstmt.setString(6, transactions.getDestinationId());
			pstmt.setString(7, transactions.getDestinationType());
			pstmt.setString(8, transactions.getStatus());
			pstmt.setObject(9, new Gson().toJson(transactions.getStatusResponse()));
			pstmt.setDouble(10, transactions.getAmount());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public void update(Transactions transactions) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.TRANSACTION_UPDATE);
			pstmt.setString(1, transactions.getStatus());
			pstmt.setString(2, transactions.getId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public ArrayList<Transactions> retrieve(String transactionId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Transactions> retrievedList = new ArrayList<Transactions>();
		ArrayList<Object> statusResopnseList = new ArrayList<Object>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.TRANSACTION_RETRIEVE);
			pstmt.setString(1, transactionId);
			rs = pstmt.executeQuery();
			TypeToken<ArrayList<Object>> token = new TypeToken<ArrayList<Object>>() {
			};
			while (rs.next()) {
				Transactions transactions = new Transactions();
				transactions.setSourceId(rs.getString("source_id"));
				transactions.setSourceType(rs.getString("source_type"));
				transactions.setType(rs.getString("type"));
				transactions.setDestinationId(rs.getString("destination_id"));
				transactions.setDestinationType(rs.getString("destination_type"));
				transactions.setStatus(rs.getString("status"));
				statusResopnseList = gson.fromJson(rs.getString("status_response"), token.getType());
				transactions.setStatusResponse(statusResopnseList);
				transactions.setTransactionDate(rs.getDate("transaction_date"));
				transactions.setAmount(rs.getDouble("amount"));
				retrievedList.add(transactions);
			}

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}
		return retrievedList;

	}

	public ArrayList<Transactions> retrieveAll() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Transactions> retrievedList = new ArrayList<Transactions>();
		ArrayList<Object> statusResopnseList = new ArrayList<Object>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.TRANSACTION_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			TypeToken<ArrayList<Object>> token = new TypeToken<ArrayList<Object>>() {
			};
			while (rs.next()) {
				Transactions transactions = new Transactions();
				transactions.setSourceId(rs.getString("source_id"));
				transactions.setSourceType(rs.getString("source_type"));
				transactions.setType(rs.getString("type"));
				transactions.setDestinationId(rs.getString("destination_id"));
				transactions.setDestinationType(rs.getString("destination_type"));
				transactions.setStatus(rs.getString("status"));
				statusResopnseList = gson.fromJson(rs.getString("status_response"), token.getType());
				transactions.setStatusResponse(statusResopnseList);
				transactions.setTransactionDate(rs.getDate("transaction_date"));
				transactions.setAmount(rs.getDouble("amount"));
				retrievedList.add(transactions);
			}

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}
		return retrievedList;

	}

}
