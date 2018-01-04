package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.enums.MessageEnum;
import com.trend.models.Product;

public interface ProductServiceInf {

	MessageEnum add(Product product);

	MessageEnum update(Product product);

	ArrayList<Product> retrieve(String productId);

	ArrayList<Product> retrieveAll();

}
