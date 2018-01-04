package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.Category;

public interface CategoryServiceInf {
	
	String add(Category category);

	String update(Category category);

	ArrayList<Category> retrieve(String categoryName);

	ArrayList<Category> retrieveAll();
}
