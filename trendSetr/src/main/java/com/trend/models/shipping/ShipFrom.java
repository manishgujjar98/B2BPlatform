
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ShipFrom {

    @SerializedName("Name")
    @Expose
    private String name;
    @SerializedName("AttentionName")
    @Expose
    private String attentionName;
    @SerializedName("Phone")
    @Expose
    private Phone phone;
    @SerializedName("FaxNumber")
    @Expose
    private String faxNumber;
    @SerializedName("Address")
    @Expose
    private Address address;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAttentionName() {
        return attentionName;
    }

    public void setAttentionName(String attentionName) {
        this.attentionName = attentionName;
    }

    public Phone getPhone() {
        return phone;
    }

    public void setPhone(Phone phone) {
        this.phone = phone;
    }

    public String getFaxNumber() {
        return faxNumber;
    }

    public void setFaxNumber(String faxNumber) {
        this.faxNumber = faxNumber;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

}
