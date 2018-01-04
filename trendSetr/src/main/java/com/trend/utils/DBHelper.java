package com.trend.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.log4j.Logger;

import com.trend.exceptions.PersistException;

public class DBHelper {

	private static Logger logger = Logger.getLogger(DBHelper.class);
	public static Connection getConn() {

		Connection con = null;
		try {

//			Context ctx = null;
//			ctx = new InitialContext();
//			DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/trendSetrDB");
			 String driver = "com.mysql.cj.jdbc.Driver";
			 String connection =
			"jdbc:mysql://q23fjqenrlvf.cjamdguhhlue.us-east-2.rds.amazonaws.com:3306/trendsetr?useSSL=false";		 
			 //"jdbc:mysql://localhost/trendsetr?autoReconnect=true&useSSL=false";
			 String user = "root";
			 String password = "";
			 Class.forName(driver);
			 con = DriverManager.getConnection(connection, user, password);
//			con = ds.getConnection();
		}
		
		catch (Exception e) {
			logger.error("",e);
			throw new PersistException();
		} 

		return con;
	}

	public static void closeConnection(ResultSet rs,PreparedStatement pstmt,Connection con) {
		DbUtils.closeQuietly(con, pstmt, rs);			
	}

}
