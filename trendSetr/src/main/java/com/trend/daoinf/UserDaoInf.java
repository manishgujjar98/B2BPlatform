package com.trend.daoinf;

import java.util.ArrayList;

import com.trend.exceptions.PersistException;
import com.trend.models.User;

public interface UserDaoInf {

	public void add(User user) throws PersistException;

	public void update(User user) throws PersistException;

	public User updateAdminPassword(User user) throws PersistException;

	public User userSettings(User user) throws PersistException;

	public void delete(User user) throws PersistException;

	public User userLogin(User user) throws PersistException;

	public ArrayList<User> allUsers() throws PersistException;

	public ArrayList<User> allMerchants(String roleId) throws PersistException;

}
