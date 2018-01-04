package com.taxjar;

import java.util.Map;

import org.apache.log4j.Logger;

import com.trend.daoimpl.ConfigDaoImpl;



public class TaxJarClient {
	private Logger logger = Logger.getLogger(TaxJarClient.class);
   	public TaxJarClient() {
	
	}
	
	public Taxjar getClient() {
		String keyValue = getAccess();
		return new Taxjar(keyValue);
	}
	
	public String getAccess(){
		ConfigDaoImpl config = new ConfigDaoImpl();
		String accessValue = null;
		
		//tax name in databse
		String taxKey = "taxAccessKey";
		 Map<String, String> map = config.get();
		 for (String key : map.keySet()) {
			 if(key.equals(taxKey)){
		     accessValue = map.get(key);
		     System.out.println("Key = " + key + ", Value = " + accessValue);
			 }
		 }

		
		return accessValue;
		 
	}
	
	

}
