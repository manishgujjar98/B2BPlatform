
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Shipment {

    @SerializedName("Description")
    @Expose
    private String description;
    @SerializedName("Shipper")
    @Expose
    private Shipper shipper;
    @SerializedName("ShipTo")
    @Expose
    private ShipTo shipTo;
    @SerializedName("ShipFrom")
    @Expose
    private ShipFrom shipFrom;
    @SerializedName("PaymentInformation")
    @Expose
    private PaymentInformation paymentInformation;
    @SerializedName("Service")
    @Expose
    private Service service;
    @SerializedName("Package")
    @Expose
    private Package _package;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Shipper getShipper() {
        return shipper;
    }

    public void setShipper(Shipper shipper) {
        this.shipper = shipper;
    }

    public ShipTo getShipTo() {
        return shipTo;
    }

    public void setShipTo(ShipTo shipTo) {
        this.shipTo = shipTo;
    }

    public ShipFrom getShipFrom() {
        return shipFrom;
    }

    public void setShipFrom(ShipFrom shipFrom) {
        this.shipFrom = shipFrom;
    }

    public PaymentInformation getPaymentInformation() {
        return paymentInformation;
    }

    public void setPaymentInformation(PaymentInformation paymentInformation) {
        this.paymentInformation = paymentInformation;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public Package getPackage() {
        return _package;
    }

    public void setPackage(Package _package) {
        this._package = _package;
    }

}
