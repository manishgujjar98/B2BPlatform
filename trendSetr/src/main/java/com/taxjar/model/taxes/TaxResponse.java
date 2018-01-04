package com.taxjar.model.taxes;

public class TaxResponse {
    public Tax tax;

	public Tax getTax() {
		return tax;
	}

	public void setTax(Tax tax) {
		this.tax = tax;
	}

	@Override
	public String toString() {
		return "TaxResponse [tax=" + tax + ", getTax()=" + getTax() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
