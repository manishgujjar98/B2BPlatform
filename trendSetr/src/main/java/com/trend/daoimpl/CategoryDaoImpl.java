package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import com.sun.istack.logging.Logger;
import com.trend.constants.Queries;
import com.trend.daoinf.CategoryDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.models.Category;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class CategoryDaoImpl implements CategoryDaoInf {

	private Logger logger = Logger.getLogger(CategoryDaoImpl.class);
	private String idGen = null;

	public void add(Category category) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.CATEGORY_INSERT);
			idGen = "CAT" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, category.getCategoryName());
			pstmt.setString(3, category.getParentId());
			pstmt.setString(4, category.getDescription());
			pstmt.setString(5, category.getMenImage());
			pstmt.setString(6, category.getWomenImage());
			pstmt.setString(7, category.getCreatedBy());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public void update(Category category) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.CATEGORY_UPDATE);
			pstmt.setString(1, category.getCategoryName());
			pstmt.setString(4, category.getDescription());
			pstmt.setString(2, category.getMenImage());
			pstmt.setString(3, category.getWomenImage());
			pstmt.setString(5, category.getUpdatedBy());
			pstmt.setString(6, category.getId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}
	}

	public ArrayList<Category> retrieve(String categoryName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Category> retrievedList = new ArrayList<Category>();

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.CATEGORY_RETRIEVE_SELECTED);
			pstmt.setString(1, categoryName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Category category = new Category();
				category.setCategoryName(rs.getString("CATEGORY_NAME"));
				category.setMenImage(rs.getString("MEN_IMAGE"));
				category.setWomenImage(rs.getString("WOMEN_IMAGE"));
				retrievedList.add(category);
			}
			// return retrievedList;

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}

		return retrievedList;

	}

	public ArrayList<Category> retrieveAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Category> retrievedList = new ArrayList<Category>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.CATEGORY_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Category category = new Category();
				category.setCategoryName(rs.getString("CATEGORY_NAME"));
				category.setMenImage(rs.getString("MEN_IMAGE"));
				category.setWomenImage(rs.getString("WOMEN_IMAGE"));
				retrievedList.add(category);
			}
			return retrievedList;

		} catch (SQLException e) {
			logger.info(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}

		return retrievedList;

	}

}
