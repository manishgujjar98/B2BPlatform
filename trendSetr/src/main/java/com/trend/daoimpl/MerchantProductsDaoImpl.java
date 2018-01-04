package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.MerchantProductsDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.exceptions.PersistException;
import com.trend.models.MerchantProducts;
import com.trend.models.Product;
import com.trend.models.ProductVariant;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class MerchantProductsDaoImpl implements MerchantProductsDaoInf {
	private final Logger logger = Logger.getLogger(MerchantProductsDaoImpl.class);
	private String idGen = null;

	public void add(MerchantProducts merchantProducts) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_PRODUCTS_INSERT);
			idGen = "MPD" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, merchantProducts.getMerchantId());
			pstmt.setString(3, merchantProducts.getProductId());
			pstmt.executeUpdate();
		}  catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}
	/*
	 * public void update(MerchantProducts merchantProducts) { }
	 */

	public ArrayList<MerchantProducts> retrieve(MerchantProducts merchantProducts) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MerchantProducts> retrievedList = new ArrayList<MerchantProducts>();
		ArrayList<Product> productList = new ArrayList<Product>();
		ArrayList<ProductVariant> productVariantList = new ArrayList<ProductVariant>();
		Product product = new Product();
		ProductVariant productVariant = new ProductVariant();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_PRODUCTS_RETRIEVE_SELECTED);
			pstmt.setString(1, merchantProducts.getMerchantId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product.setName(rs.getString("NAME"));
				productVariant.setPrice(rs.getDouble("PRICE"));
				productList.add(product);
				productVariantList.add(productVariant);
				product.setProductVariantList(productVariantList);
				merchantProducts.setProductList(productList);
				retrievedList.add(merchantProducts);
			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return retrievedList;

	}

	public ArrayList<MerchantProducts> retrieveAll() throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MerchantProducts> retrievedList = new ArrayList<MerchantProducts>();
		ArrayList<Product> productList = new ArrayList<Product>();
		ArrayList<ProductVariant> productVariantList = new ArrayList<ProductVariant>();

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_PRODUCTS_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				MerchantProducts merchantProducts = new MerchantProducts();
				Product product = new Product();
				ProductVariant productVariant = new ProductVariant();
				product.setName(rs.getString("NAME"));
				productVariant.setPrice(rs.getDouble("PRICE"));
				productList.add(product);
				productVariantList.add(productVariant);
				product.setProductVariantList(productVariantList);
				merchantProducts.setProductList(productList);
				retrievedList.add(merchantProducts);
			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return retrievedList;
	}

}
