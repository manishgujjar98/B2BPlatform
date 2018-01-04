package com.trend.cassandra;

public class CassandraConstants {
	
	public static final String API_PROPERTIES_LOC = "cassandra.properties";
	public static final String PRODUCTION="PRODUCTION";
	public static final String DEVELOPMENT="DEVELOPMENT";
	public static String SERVER_INSTANCE_MODE = System.getenv("SERVER_INSTANCE_MODE");
	public static final CassandraManager CASSANDRA_INSTANCE = CassandraManagerFactoy.getInstance(SERVER_INSTANCE_MODE);
}

