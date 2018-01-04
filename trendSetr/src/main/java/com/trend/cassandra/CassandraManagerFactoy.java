package com.trend.cassandra;

public class CassandraManagerFactoy {

	public static CassandraManager getInstance(String serverMode) {
		if ("production".equalsIgnoreCase(serverMode)) {
			return AdvancedCassandraManager.getInstance();
		} else {
			return LocalCassandraManager.getInstance();
		}
	}
	
}
