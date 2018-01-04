
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Phone {

    @SerializedName("Number")
    @Expose
    private String number;
    @SerializedName("Extension")
    @Expose
    private String extension;

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getExtension() {
        return extension;
    }

    public void setExtension(String extension) {
        this.extension = extension;
    }

}
