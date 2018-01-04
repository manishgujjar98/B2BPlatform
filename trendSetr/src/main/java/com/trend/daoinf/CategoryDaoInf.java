package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.Category;

public interface CategoryDaoInf {

	public void add(Category category) throws PersistException;

	public void update(Category category) throws PersistException;


	public ArrayList<Category> retrieve(String categoryName) throws PersistException;

	public ArrayList<Category> retrieveAll() throws PersistException;

}
