package com.trendset.utils;

import java.io.IOException;
import java.util.Properties;

public class PropertiesUtils {

    private static PropertiesUtils instance = null;
    private Properties properties;


    private PropertiesUtils() throws IOException{
        properties = new Properties();
        properties.load(getClass().getResourceAsStream("/config.properties"));

    }

    public static PropertiesUtils getInstance() {
        if(instance == null) {
            try {
                instance = new PropertiesUtils();
            } catch (IOException ioe) {
                ioe.printStackTrace();
            }
        }
        return instance;
    }

    public String getValue(String key) {
        return properties.getProperty(key);
    }

}