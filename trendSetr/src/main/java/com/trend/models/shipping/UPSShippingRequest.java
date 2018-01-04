
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class UPSShippingRequest {

    @SerializedName("UPSSecurity")
    @Expose
    private UPSSecurity uPSSecurity;
    @SerializedName("ShipmentRequest")
    @Expose
    private ShipmentRequest shipmentRequest;

    public UPSSecurity getUPSSecurity() {
        return uPSSecurity;
    }

    public void setUPSSecurity(UPSSecurity uPSSecurity) {
        this.uPSSecurity = uPSSecurity;
    }

    public ShipmentRequest getShipmentRequest() {
        return shipmentRequest;
    }

    public void setShipmentRequest(ShipmentRequest shipmentRequest) {
        this.shipmentRequest = shipmentRequest;
    }

}
