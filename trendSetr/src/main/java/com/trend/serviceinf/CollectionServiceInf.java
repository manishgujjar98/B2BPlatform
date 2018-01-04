package com.trend.serviceinf;

import java.util.ArrayList;

import com.trend.models.Collection;

public interface CollectionServiceInf {
	
	String add(Collection collection);
	String update(Collection collection);
	String delete(Collection collection);
	ArrayList<Collection> retrieve(String collectionId);
	ArrayList<Collection> retrieveAll();
	
	
}
