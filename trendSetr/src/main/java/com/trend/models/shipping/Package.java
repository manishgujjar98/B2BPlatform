
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Package {

    @SerializedName("Description")
    @Expose
    private String description;
    @SerializedName("Packaging")
    @Expose
    private Packaging packaging;
    @SerializedName("Dimensions")
    @Expose
    private Dimensions dimensions;
    @SerializedName("PackageWeight")
    @Expose
    private PackageWeight packageWeight;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Packaging getPackaging() {
        return packaging;
    }

    public void setPackaging(Packaging packaging) {
        this.packaging = packaging;
    }

    public Dimensions getDimensions() {
        return dimensions;
    }

    public void setDimensions(Dimensions dimensions) {
        this.dimensions = dimensions;
    }

    public PackageWeight getPackageWeight() {
        return packageWeight;
    }

    public void setPackageWeight(PackageWeight packageWeight) {
        this.packageWeight = packageWeight;
    }

}
