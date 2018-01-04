package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.trend.utils.DBHelper;

public class ConfigDaoImpl {

	private static final Logger LOGGER = Logger.getLogger(ConfigDaoImpl.class);

	public Map<String, String> get() {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Connection connection = DBHelper.getConn();
		Map<String, String> configParams = new HashMap<>();
		try {
			if (connection != null) {
				pstmt = connection.prepareStatement("SELECT * from config_keys");
				rset = pstmt.executeQuery();
				while (rset.next()) {
					String key = rset.getString("name");
					String value = rset.getString("value");
					configParams.put(key, value);
				}
			}
		} catch (Exception e) {
			LOGGER.error("Error fetching configuration parameters", e);
		} finally {
			DBHelper.closeConnection(rset, pstmt, connection);
		}
		return configParams;
	}
	
	public static void main(String[] args) {
		ConfigDaoImpl configDaoImpl = new ConfigDaoImpl();
		System.out.println(configDaoImpl.get());
	}

}
