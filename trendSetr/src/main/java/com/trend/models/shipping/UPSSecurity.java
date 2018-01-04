
package com.trend.models.shipping;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;
import com.trend.serviceimpl.Config;

public class UPSSecurity {

    @SerializedName("UsernameToken")
    @Expose
    private UsernameToken usernameToken;
    @SerializedName("ServiceAccessToken")
    @Expose
    private ServiceAccessToken serviceAccessToken;

    public UsernameToken getUsernameToken() {
        return usernameToken;
    }

    public void setUsernameToken(UsernameToken usernameToken) {
        this.usernameToken = usernameToken;
    }

    public ServiceAccessToken getServiceAccessToken() {
        return serviceAccessToken;
    }

    public void setServiceAccessToken(ServiceAccessToken serviceAccessToken) {
        this.serviceAccessToken = serviceAccessToken;
    }
    
    public static UPSSecurity get(){
    	Config config = Config.getInstance();
    	JsonObject upsSecurity = new JsonObject();
    	JsonObject usernameToken = new JsonObject();
		usernameToken.addProperty("Username", config.getValue("ups_username"));
		usernameToken.addProperty("Password", config.getValue("ups_password"));
		upsSecurity.add("UsernameToken", usernameToken);
		JsonObject serviceAccessToken = new JsonObject();
		serviceAccessToken.addProperty("AccessLicenseNumber", config.getValue("ups_license"));
		upsSecurity.add("ServiceAccessToken", serviceAccessToken);
		return new Gson().fromJson(upsSecurity.toString(), UPSSecurity.class);
    }

}
