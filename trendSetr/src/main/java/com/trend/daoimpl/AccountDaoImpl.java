package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.exceptions.PersistException;
import com.trend.models.AccountSettings;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class AccountDaoImpl {
	private Logger logger = Logger.getLogger(AccountDaoImpl.class);

	public void addAccount(AccountSettings accountSettings) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ACCOUNT_INSERT);
			String idGen = "BNK" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, accountSettings.getEmailId());
			pstmt.setString(3, accountSettings.getEmailId());
			pstmt.setString(4, accountSettings.getEmailId());
			pstmt.setString(5, "American Express");
			pstmt.setString(6, "123456");
			pstmt.setString(7, accountSettings.getEmailId());
			pstmt.setInt(8, 222);

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

}
