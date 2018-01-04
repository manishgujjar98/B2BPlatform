package com.trend.serviceimpl;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.trend.daoimpl.ConfigDaoImpl;

/**
 * 
 * @author Ravi Class to load all configurable parameters
 *
 */
public class Config {

	private static final Config CONFIG = new Config();
	private Map<String, String> configParamaters = null;

	private Config() {
		configParamaters = load();
	}

	private Map<String, String> load() {
		ConfigDaoImpl configDaoImpl = new ConfigDaoImpl();
		return configDaoImpl.get();
	}

	public static Config getInstance() {
		return CONFIG;
	}

	/**
	 * 
	 * @param name
	 * @return
	 * returns the value associated with key from the database. Returns null if key does not exist
	 */
	public String getValue(String name) {
		String value = null;
		if (StringUtils.isNotBlank(name)) {
			if (configParamaters != null) {
				value = configParamaters.get(name.trim()).trim();
			}
		}
		return value;
	}

}
