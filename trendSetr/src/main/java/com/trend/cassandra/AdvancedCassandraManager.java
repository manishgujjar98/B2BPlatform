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
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import org.apache.log4j.Logger;

import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.ConsistencyLevel;
import com.datastax.driver.core.Host;
import com.datastax.driver.core.HostDistance;
import com.datastax.driver.core.Metadata;
import com.datastax.driver.core.PoolingOptions;
import com.datastax.driver.core.ProtocolOptions;
import com.datastax.driver.core.QueryOptions;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.SocketOptions;
import com.datastax.driver.core.policies.ConstantReconnectionPolicy;
import com.datastax.driver.core.policies.LatencyAwarePolicy;
import com.datastax.driver.core.policies.LoadBalancingPolicy;
import com.datastax.driver.core.policies.RoundRobinPolicy;
import com.datastax.driver.mapping.MappingManager;
import com.trend.cassandra.CassandraProps.BigHalfCassandra;

public class AdvancedCassandraManager implements CassandraManager {

	private static final Logger LOGGER = Logger.getLogger(AdvancedCassandraManager.class);
	private Cluster cluster = null;
	private Session session = null;
	private MappingManager mappingManager = null;
	private static AdvancedCassandraManager cassandraManager = null;

	/**
	 * creating cluster while calling the constructor
	 */
	private AdvancedCassandraManager() {
		try {
			cluster = Cluster.builder().addContactPoints(getNodes())
					.withLoadBalancingPolicy(LatencyAwarePolicy.builder(new RoundRobinPolicy()).withExclusionThreshold(2.0).withScale(100, TimeUnit.MILLISECONDS).withRetryPeriod(10, TimeUnit.SECONDS)
							.withUpdateRate(100, TimeUnit.MILLISECONDS).withMininumMeasurements(50).build())
					.withCompression(ProtocolOptions.Compression.LZ4).withQueryOptions(getQueryOptions()).withPoolingOptions(getPoolingOptions()).withSocketOptions(getSocketOptions())
					.withReconnectionPolicy(new ConstantReconnectionPolicy(10000)).build();
			Metadata metadata = cluster.getMetadata();
			LOGGER.info("Connected to cluster: " + metadata.getClusterName());
			for (Host host : metadata.getAllHosts()) {
				LOGGER.info("Datatacenter: " + host.getDatacenter() + " Host: " + host.getAddress() + " Rack: " + host.getRack());
			}
			createSession();
			new CassandraMonitor().monitor();
		} catch (Exception e) {
			LOGGER.error("Error creating cluster", e);
		}
	}

	/**
	 * method used to return the instance of CassandraManager
	 * 
	 * @return CassandraManager instance
	 */
	public static AdvancedCassandraManager getInstance() {
		if (cassandraManager == null) {
			cassandraManager = new AdvancedCassandraManager();
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

	private SocketOptions getSocketOptions() {
		SocketOptions options = new SocketOptions();
		options.setConnectTimeoutMillis(1000000);
		return options;
	}

	/**
	 * method to set the connection pooling options for the cluster
	 * 
	 * @return PoolingOptions
	 */
	private PoolingOptions getPoolingOptions() {
		PoolingOptions options = new PoolingOptions();
		options.setCoreConnectionsPerHost(HostDistance.LOCAL, 4);
		options.setMaxConnectionsPerHost(HostDistance.LOCAL, 8);
		options.setCoreConnectionsPerHost(HostDistance.REMOTE, 2);
		options.setMaxConnectionsPerHost(HostDistance.REMOTE, 4);
		options.setMaxRequestsPerConnection(HostDistance.LOCAL, 128);
		options.setMaxConnectionsPerHost(HostDistance.REMOTE, 50);
		return options;

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
		options.setConsistencyLevel(ConsistencyLevel.TWO);
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

	/**
	 * Class to Monitor Cassandra connections
	 * 
	 * @author Ravikiran
	 * 
	 */
	private class CassandraMonitor {

		public void monitor() {
			final LoadBalancingPolicy loadBalancingPolicy = cluster.getConfiguration().getPolicies().getLoadBalancingPolicy();
			final PoolingOptions poolingOptions = cluster.getConfiguration().getPoolingOptions();
			ScheduledExecutorService scheduled = Executors.newScheduledThreadPool(1);
			scheduled.scheduleAtFixedRate(new Runnable() {
				@Override
				public void run() {
					Session.State state = getSession().getState();
					for (Host host : state.getConnectedHosts()) {
						HostDistance distance = loadBalancingPolicy.distance(host);
						int connections = state.getOpenConnections(host);
						int inFlightQueries = state.getInFlightQueries(host);
						LOGGER.info(host + ":connections=" + connections + ", current load" + inFlightQueries + ", max load=" + connections * poolingOptions.getMaxConnectionsPerHost(distance));

					}
				}
			}, 20, 60, TimeUnit.SECONDS);
		}
	}

}
