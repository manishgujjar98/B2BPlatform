
package com.trend.models.shipping;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class BillShipper {

    @SerializedName("AccountNumber")
    @Expose
    private String accountNumber;

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

}
