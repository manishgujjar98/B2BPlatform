package com.trend.cassandra;

/**
 * Manager class used to manage the session and connection objects with the cassandra database
 * 
 * @author Ravi, Big Half.
 * @version 1.0
 *
 */

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ConsistencyLevel;
import com.datastax.driver.core.ProtocolOptions;
import com.datastax.driver.core.QueryOptions;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.policies.LatencyAwarePolicy;
import com.datastax.driver.core.policies.RoundRobinPolicy;
import com.datastax.driver.mapping.MappingManager;
import com.trend.cassandra.CassandraProps.BigHalfCassandra;

public class LocalCassandraManager implements CassandraManager {

	private static final Logger LOGGER = Logger.getLogger(LocalCassandraManager.class);
	private Cluster cluster = null;
	private Session session = null;
	private MappingManager mappingManager = null;
	private static LocalCassandraManager cassandraManager = null;

	/**
	 * creating cluster while calling the constructor
	 */
	private LocalCassandraManager() {
		try {
			cluster = Cluster.builder().addContactPoints(getNodes())
					.withLoadBalancingPolicy(LatencyAwarePolicy.builder(new RoundRobinPolicy()).withExclusionThreshold(2.0).withScale(100, TimeUnit.MILLISECONDS).withRetryPeriod(10, TimeUnit.SECONDS)
							.withUpdateRate(100, TimeUnit.MILLISECONDS).withMininumMeasurements(50).build())
					.withCompression(ProtocolOptions.Compression.LZ4).withQueryOptions(getQueryOptions()).build();
			createSession();
		} catch (Exception e) {
			LOGGER.error("Error creating cluster:", e);
		}
	}

	/**
	 * method used to return the instance of CassandraManager
	 * 
	 * @return CassandraManager instance
	 */
	public static LocalCassandraManager getInstance() {
		if (cassandraManager == null) {
			cassandraManager = new LocalCassandraManager();
		}
		return cassandraManager;
	}

	/**
	 * method used to close the sessions and cluster connection with the
	 * cassandra database call this method at undeploy event on the website
	 */
	@Override
	public void close() {
		try {
			if (session != null) {
				session.close();
			}
			if (cluster != null) {
				cluster.close();
			}
		} catch (Exception e) {
			LOGGER.error(e);
		}
	}

	/**
	 * creates a session for each keyspace: one session for keyspace should be
	 * maintained for entire application
	 * 
	 * @param keyspace
	 * @return Session instance
	 */
	@Override
	public Session getSession() {
		return session;
	}

	/**
	 * creates Mapping manager for a session. one mapping manager should be
	 * created for one session instance
	 */
	@Override
	public MappingManager getMappingManager() {
		return mappingManager;
	}

	/**
	 * method used to set consistency level
	 * 
	 * @return QueryOptions
	 */
	private static QueryOptions getQueryOptions() {
		QueryOptions options = new QueryOptions();
		// TODO quorum should be set
		options.setConsistencyLevel(ConsistencyLevel.ONE);
		return options;
	}

	/**
	 * method used to prepare cassandra nodes as string array
	 * 
	 * @return string array of nodes
	 */
	private static String[] getNodes() {
		String[] nodes = BigHalfCassandra.CASSANDRA_NODES.split(",");
		List<String> nodesList = new ArrayList<String>();
		for (String node : nodes) {
			nodesList.add(node.trim());
		}
		System.out.println("nodesList = " + nodesList);
		return (String[]) nodesList.toArray(new String[nodesList.size()]);
	}

	/**
	 * 
	 * @return
	 */
	private Session createSession() {
		try {
			session = cluster.connect();
			mappingManager = new MappingManager(session);
		} catch (Exception e) {
			LOGGER.error(e);
		}
		return session;
	}

	public static void main(String[] args) {
		LocalCassandraManager cassandraManager = LocalCassandraManager.getInstance();
		try {
			System.out.println(cassandraManager.getSession());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			cassandraManager.close();
		}
	}

}
