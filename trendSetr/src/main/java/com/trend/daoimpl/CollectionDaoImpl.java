package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trend.constants.Queries;
import com.trend.daoinf.CollectionDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.Collection;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class CollectionDaoImpl implements CollectionDaoInf {

	private Logger logger = Logger.getLogger(CollectionDaoImpl.class);
	private String genId = null;
	private Gson gson = new Gson();

	public void add(Collection collection) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("Success");
		logger.debug("Success");
		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.COLL_INSERT);
			genId = "COL" + CommonsUtils.getID();
			pstmt.setString(1, collection.getName());
			pstmt.setBytes(2, collection.getBannerImage().getBytes());
			pstmt.setObject(3, new Gson().toJson(collection.getPriorityList()));
			;
			pstmt.setString(4, collection.getCreatedBy());
			pstmt.setString(5, genId);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public void update(Collection collection) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.println("Success");
		logger.debug("Success");
		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.COLL_UPDATE);
			pstmt.setString(1, collection.getName());
			pstmt.setBytes(2, collection.getBannerImage().getBytes());
			pstmt.setObject(3, new Gson().toJson(collection.getPriorityList()));
			pstmt.setString(4, collection.getUpdatedBy());
			pstmt.setString(5, collection.getCreatedBy());//once check not seen in query
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public void delete(Collection collection) {

	}

	public ArrayList<Collection> retrieve(String collectionId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Collection> retrievedList = new ArrayList<Collection>();
		ArrayList<Object> prioritiesList = new ArrayList<Object>();

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.COLL_RETRIEVE);
			pstmt.setString(1, collectionId);
			rs = pstmt.executeQuery();
			TypeToken<ArrayList<Object>> token = new TypeToken<ArrayList<Object>>() {
			};
			while (rs.next()) {
				Collection collection = new Collection();
				collection.setName(rs.getString("name"));
				collection.setBannerImage(rs.getString("banner_image"));
				prioritiesList = gson.fromJson(rs.getString("priorityList"), token.getType());
				collection.setPriorityList(prioritiesList);
				collection.setCreatedBy(rs.getString("created_by"));
				collection.setUpdatedBy(rs.getString("updated_by"));
				collection.setCreatedTime(rs.getDate("created_time"));
				collection.setModifiedTime(rs.getDate("modified_time"));
				retrievedList.add(collection);
			}

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}

		return retrievedList;
	}

	public ArrayList<Collection> retrieveAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<Collection> retrievedList = new ArrayList<Collection>();
		ArrayList<Object> prioritiesList = new ArrayList<Object>();

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.COLL_RETRIEVE);
			rs = pstmt.executeQuery();
			TypeToken<ArrayList<Object>> token = new TypeToken<ArrayList<Object>>() {
			};
			while (rs.next()) {
				Collection collection = new Collection();
				collection.setName(rs.getString("name"));
				collection.setBannerImage(rs.getString("banner_image"));
				prioritiesList = gson.fromJson(rs.getString("priorityList"), token.getType());
				collection.setPriorityList(prioritiesList);
				collection.setCreatedBy(rs.getString("created_by"));
				collection.setUpdatedBy(rs.getString("updated_by"));
				collection.setCreatedTime(rs.getDate("created_time"));
				collection.setModifiedTime(rs.getDate("modified_time"));
				retrievedList.add(collection);
			}

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		return retrievedList;
	}

}