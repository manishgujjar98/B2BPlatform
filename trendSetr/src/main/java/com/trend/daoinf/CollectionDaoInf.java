package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.Collection;

public interface CollectionDaoInf {
	
	public void add(Collection collection) throws PersistException;
	
	public void update(Collection user) throws PersistException;
	
	public void delete(Collection user) throws PersistException;
	
	public ArrayList<Collection> retrieve(String collectionId) throws PersistException;

	public ArrayList<Collection> retrieveAll() throws PersistException;

}
