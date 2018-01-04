
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ServiceAccessToken {

    @SerializedName("AccessLicenseNumber")
    @Expose
    private String accessLicenseNumber;

    public String getAccessLicenseNumber() {
        return accessLicenseNumber;
    }

    public void setAccessLicenseNumber(String accessLicenseNumber) {
        this.accessLicenseNumber = accessLicenseNumber;
    }

}
