package com.trend.cassandra;

import com.datastax.driver.core.Session;
import com.datastax.driver.mapping.MappingManager;

public interface CassandraManager {
	
	public void close();
	public Session getSession();
	public MappingManager getMappingManager();

}
