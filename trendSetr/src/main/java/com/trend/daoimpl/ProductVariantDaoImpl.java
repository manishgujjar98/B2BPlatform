package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.ProductVariantDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.exceptions.PersistException;
import com.trend.models.ProductVariant;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class ProductVariantDaoImpl implements ProductVariantDaoInf {

	private final Logger logger = Logger.getLogger(getClass());
	private String idGen = null;

	public void add(ProductVariant productVariant) throws PersistException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANT_INSERT);
			idGen = "PDV" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, productVariant.getSkuId());
			pstmt.setDouble(3, productVariant.getPrice());
			pstmt.setString(4, productVariant.getSize());
			pstmt.setString(5, productVariant.getColour());
			pstmt.setInt(6, productVariant.getQuantity());
			pstmt.setString(7, productVariant.getCreatedBy());
			pstmt.setString(8, productVariant.getProductId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}

	public void update(ProductVariant productVariant) throws PersistException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANT_UPDATE);

			pstmt.setDouble(1, productVariant.getPrice());
			pstmt.setInt(2, productVariant.getQuantity());
			pstmt.setString(3, productVariant.getUpdatedBy());
			pstmt.setString(4, productVariant.getId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

	}

	public ArrayList<ProductVariant> retrieve(String productVariantId) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductVariant> retrievedList = new ArrayList<ProductVariant>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANT_RETRIEVE_SELECTED);
			pstmt.setString(1, productVariantId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVariant productVariant = new ProductVariant();
				productVariant.setPrice(rs.getDouble("PRICE"));
				productVariant.setSize(rs.getString("SIZE"));
				productVariant.setColour(rs.getString("COLOUR"));
				productVariant.setQuantity(rs.getInt("QUANTITY"));
				productVariant.setCreatedBy(rs.getString("CREATED_BY"));
				productVariant.setCreatedTime(rs.getDate("CREATED_TIME"));
				productVariant.setUpdatedBy(rs.getString("UPDATED_BY"));
				productVariant.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(productVariant);
			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		
		}
		return retrievedList;

	}

	public ArrayList<ProductVariant> retrieveAll() throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductVariant> retrievedList = new ArrayList<ProductVariant>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANT_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVariant productVariant = new ProductVariant();
				productVariant.setPrice(rs.getDouble("PRICE"));
				productVariant.setSize(rs.getString("SIZE"));
				productVariant.setColour(rs.getString("COLOUR"));
				productVariant.setQuantity(rs.getInt("QUANTITY"));
				productVariant.setCreatedBy(rs.getString("CREATED_BY"));
				productVariant.setCreatedTime(rs.getDate("CREATED_TIME"));
				productVariant.setUpdatedBy(rs.getString("UPDATED_BY"));
				productVariant.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(productVariant);
			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}		return retrievedList;

	}

}
