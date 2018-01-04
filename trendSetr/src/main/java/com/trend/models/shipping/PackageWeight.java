
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class PackageWeight {

    @SerializedName("UnitOfMeasurement")
    @Expose
    private UnitOfMeasurement_ unitOfMeasurement;
    @SerializedName("Weight")
    @Expose
    private String weight;

    public UnitOfMeasurement_ getUnitOfMeasurement() {
        return unitOfMeasurement;
    }

    public void setUnitOfMeasurement(UnitOfMeasurement_ unitOfMeasurement) {
        this.unitOfMeasurement = unitOfMeasurement;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

}
