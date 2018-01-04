package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.BankAccountDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.exceptions.PersistException;
import com.trend.models.BankAccount;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class BankAccountDaoImpl implements BankAccountDaoInf {
	private Logger logger = Logger.getLogger(BankAccountDaoImpl.class);
	private String genId = null;

	public void add(BankAccount bankAccount) throws PersistException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ACCOUNT_INSERT);
			genId = "BNK" + CommonsUtils.getID();
			pstmt.setString(1, genId);
			pstmt.setString(2, bankAccount.getUserId());
			pstmt.setString(3, bankAccount.getBankName());
			pstmt.setString(4, bankAccount.getAccountNumber());
			pstmt.setString(5, bankAccount.getBankName());
			pstmt.setString(6, bankAccount.getRoutingNumber());
			pstmt.setString(7, bankAccount.getName());
			pstmt.setInt(8, bankAccount.getDefaultAccount());
			
			pstmt.executeUpdate();

		}catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		
		

	}

	public void update(BankAccount bankAccount) throws PersistException{

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ACCOUNT_UPDATE);
		
		pstmt.setString(1, bankAccount.getBankName());
		pstmt.setString(2, bankAccount.getAccountNumber());
		pstmt.setString(3, bankAccount.getRoutingNumber());
		pstmt.setString(4, bankAccount.getName());
		pstmt.setInt(5, bankAccount.getDefaultAccount());
		pstmt.setString(6,bankAccount.getUpdatedBy());
		pstmt.setString(7, bankAccount.getId());
		pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}

	public ArrayList<BankAccount> retrieve(String bankAccountId) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BankAccount> retrievedList = new ArrayList<BankAccount>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ACCOUNT_RETRIEVE_SELECTED);
			pstmt.setString(1, bankAccountId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BankAccount bankAccount = new BankAccount();
				bankAccount.setBankName(rs.getString("BANK_NAME"));
				bankAccount.setAccountNumber(rs.getString("ACCOUNT_ID"));
				bankAccount.setRoutingNumber(rs.getString("ROUTING_NUMBER"));
				bankAccount.setName(rs.getString("NAME"));
				bankAccount.setDefaultAccount(rs.getInt("DEFAULT_NUMBER"));
				bankAccount.setCreatedBy(rs.getString("CREATED_BY"));
				bankAccount.setCreatedTime(rs.getDate("CREATED_TIME"));
				bankAccount.setUpdatedBy(rs.getString("UPDATED_BY"));
				bankAccount.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(bankAccount);
			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		return retrievedList;
	}

	public ArrayList<BankAccount> retrieveAll() throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BankAccount> retrievedList = new ArrayList<BankAccount>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ACCOUNT_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BankAccount bankAccount = new BankAccount();
				bankAccount.setBankName(rs.getString("BANK_NAME"));
				bankAccount.setAccountNumber(rs.getString("ACCOUNT_ID"));
				bankAccount.setRoutingNumber(rs.getString("ROUTING_NUMBER"));
				bankAccount.setName(rs.getString("NAME"));
				bankAccount.setDefaultAccount(rs.getInt("DEFAULT_NUMBER"));
				bankAccount.setCreatedBy(rs.getString("CREATED_BY"));
				bankAccount.setCreatedTime(rs.getDate("CREATED_TIME"));
				bankAccount.setUpdatedBy(rs.getString("UPDATED_BY"));
				bankAccount.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(bankAccount);
			}

		}catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		return retrievedList;
	}

}
