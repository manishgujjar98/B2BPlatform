
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class PaymentInformation {

    @SerializedName("ShipmentCharge")
    @Expose
    private ShipmentCharge shipmentCharge;

    public ShipmentCharge getShipmentCharge() {
        return shipmentCharge;
    }

    public void setShipmentCharge(ShipmentCharge shipmentCharge) {
        this.shipmentCharge = shipmentCharge;
    }

}
