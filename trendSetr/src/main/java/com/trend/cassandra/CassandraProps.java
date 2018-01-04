package com.trend.cassandra;

/**
 * class used to fetch values from the property file 
 * 
 * @author Ravi, Big Half.
 * @version 1.0
 *
 */

import org.apache.commons.configuration.Configuration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.PropertiesConfiguration;

public class CassandraProps {

	private static Configuration config;

	static {
		try {
			config = new PropertiesConfiguration(CassandraConstants.API_PROPERTIES_LOC);
		} catch (ConfigurationException e) {
			
		}
	}
	
	

	public static class BigHalfCassandra {
		public static String BIGHALF_KEYSPACE = "trendSetr";
		public static String CASSANDRA_NODES = (CassandraConstants.SERVER_INSTANCE_MODE.equals(CassandraConstants.PRODUCTION))?config.getString("cassandra.production.nodes"):config.getString("cassandra.development.nodes");
		public static String CASSANDRA_LOCALHOST_KEYSPACE =config.getString("cassandra.localhost.keyspace");
		public static String CASSANDRA_TOPOLOGY_KEYSPACE =config.getString("cassandra.topology.keyspace");
		public static final String CASSANDRA_USER_NAME = (CassandraConstants.SERVER_INSTANCE_MODE.equals(CassandraConstants.PRODUCTION))?config.getString("cassandra.production.username"):config.getString("cassandra.development.username");
		public static final String CASSANDRA_KEY = (CassandraConstants.SERVER_INSTANCE_MODE.equals(CassandraConstants.PRODUCTION))?config.getString("cassandra.production.key"):config.getString("cassandra.development.key");
	}
	
	
}
