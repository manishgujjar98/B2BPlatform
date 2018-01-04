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
import com.trend.daoinf.MerchantDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.exceptions.PersistException;
import com.trend.models.Merchant;
import com.trend.models.Product;
import com.trend.models.ProductVariant;
import com.trend.models.Shipping;
import com.trend.models.ShippingBean;
import com.trend.models.TaxRequestBean;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;
import com.trend.utils.TaxValidator;

public class MerchantDaoImpl implements MerchantDaoInf {

	private Logger logger = Logger.getLogger(MerchantDaoImpl.class);
	private String idGen = null;
	private Gson gson = new Gson();

	public void add(Merchant merchant) throws PersistException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_INSERT);
			idGen = "MER" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, merchant.getStoreName());
			pstmt.setString(3, merchant.getUploadImage());
			pstmt.setString(4, merchant.getProfileImage());
			pstmt.setString(5, merchant.getBannerImage());
			pstmt.setObject(6, new Gson().toJson(merchant.getPriorities()));
			pstmt.setString(7, merchant.getCreatedBy());
			pstmt.setString(8, merchant.getUserId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

	}

	public void update(Merchant merchant) throws PersistException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_UPDATE);

			pstmt.setString(1, merchant.getStoreName());
			pstmt.setString(2, merchant.getUploadImage());
			pstmt.setString(3, merchant.getProfileImage());
			pstmt.setString(4, merchant.getBannerImage());
			pstmt.setString(5, merchant.getUpdatedBy());
			pstmt.setObject(6, new Gson().toJson(merchant.getPriorities()));
			pstmt.setString(7, merchant.getId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

	}

	public ArrayList<Merchant> retrieve(String merchantId) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Merchant> retrievedList = new ArrayList<Merchant>();
		ArrayList<Object> prioritiesList = new ArrayList<Object>();
		ArrayList<Object> aboutImagesList = new ArrayList<Object>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_RETRIEVE_SELECTED);
			pstmt.setString(1, merchantId);
			rs = pstmt.executeQuery();
			TypeToken<ArrayList<Object>> token = new TypeToken<ArrayList<Object>>() {
			};
			while (rs.next()) {
				Merchant merchant = new Merchant();
				merchant.setStoreName(rs.getString("STORE_NAME"));
				merchant.setUploadImage(rs.getString("UPLOAD_IMAGE"));
				merchant.setProfileImage(rs.getString("PROFILE_IMAGE"));
				merchant.setBannerImage(rs.getString("BANNER_IMAGE"));
				prioritiesList = gson.fromJson(rs.getString("priorities"), token.getType());
				merchant.setPriorities(prioritiesList);
				aboutImagesList = gson.fromJson(rs.getString("about_images"), token.getType());
				merchant.setAboutImages(aboutImagesList);
				merchant.setCreatedBy(rs.getString("CREATED_BY"));
				merchant.setCreatedTime(rs.getDate("CREATED_TIME"));
				merchant.setUpdatedBy(rs.getString("UPDATED_BY"));
				merchant.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(merchant);
			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		return retrievedList;

	}

	public ArrayList<Merchant> retrieveAll() throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Merchant> retrievedList = new ArrayList<Merchant>();
		ArrayList<Object> prioritiesList = new ArrayList<Object>();
		ArrayList<Object> aboutImagesList = new ArrayList<Object>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_RETRIEVE_ALL);
			rs = pstmt.executeQuery();
			TypeToken<ArrayList<Object>> token = new TypeToken<ArrayList<Object>>() {
			};
			while (rs.next()) {
				Merchant merchant = new Merchant();
				merchant.setStoreName(rs.getString("STORE_NAME"));
				merchant.setUploadImage(rs.getString("UPLOAD_IMAGE"));
				merchant.setProfileImage(rs.getString("PROFILE_IMAGE"));
				merchant.setBannerImage(rs.getString("BANNER_IMAGE"));
				prioritiesList = gson.fromJson(rs.getString("priorities"), token.getType());
				merchant.setPriorities(prioritiesList);
				aboutImagesList = gson.fromJson(rs.getString("about_images"), token.getType());
				merchant.setAboutImages(aboutImagesList);
				merchant.setCreatedBy(rs.getString("CREATED_BY"));
				merchant.setCreatedTime(rs.getDate("CREATED_TIME"));
				merchant.setUpdatedBy(rs.getString("UPDATED_BY"));
				merchant.setModifiedTime(rs.getDate("MODIFIED_TIME"));
				retrievedList.add(merchant);

			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		return retrievedList;

	}

	@Override
	public void addShippingMerchantDetails(ShippingBean shippingBean) throws PersistException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			logger.info("connection" + conn);
			if (shippingBean.getShipping() != null) {
				pstmt = conn.prepareStatement(Queries.MERCHANT_shipping_settings);
				for (Shipping shipping : shippingBean.getShipping()) {
					idGen = "SHP" + CommonsUtils.getID();
					pstmt.setString(1, idGen);
					pstmt.setString(2, shipping.getTitle());
					pstmt.setString(3, shipping.getLenght());
					pstmt.setString(4, shipping.getWidth());
					pstmt.setString(5, shipping.getHeight());
					pstmt.setString(6, shippingBean.getUserId());
					pstmt.addBatch();
				}

				pstmt.executeBatch();
			}
			conn.commit();
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}

	public ShippingBean retrieveMerShipDetails(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Shipping> retrievedList = new ArrayList<Shipping>();
		ShippingBean shippingBean = new ShippingBean();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_RETRIEVE_SHIPPING_DETAILS);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Shipping shipping = new Shipping();
				shipping.setId(rs.getString("ID"));
				shipping.setTitle(rs.getString("BOX_TITLE"));
				shipping.setLenght(rs.getString("LENGTH"));
				shipping.setWidth(rs.getString("WIDTH"));
				shipping.setHeight(rs.getString("HEIGHT"));
				shippingBean.setMerchantPercent(rs.getString("merchant_percent"));
				retrievedList.add(shipping);

			}
			shippingBean.setShipping(retrievedList);

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		return shippingBean;

	}

	public ArrayList<Shipping> retrieveAllShippingSizes(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//adding by manesh
		
		ArrayList<Shipping> retrievedList = new ArrayList<Shipping>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.MERCHANT_SHIPPING_SIZES);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Shipping shippingBox = new Shipping();
				shippingBox.setTitle(rs.getString("BOX_TITLE"));
				shippingBox.setLenght(rs.getString("LENGTH"));
				shippingBox.setHeight(rs.getString("HEIGHT"));
				shippingBox.setWidth(rs.getString("WIDTH"));
				shippingBox.setMerchant_percent(rs.getString("MERCHANT_PERCENT"));
				retrievedList.add(shippingBox);

			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}

		return retrievedList;

	}
	
	
	public void populateMerchantShippingDetails(ShippingBean shippingBean) throws PersistException {
		ArrayList<Shipping> msList = new ArrayList<Shipping>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(Queries.MERCHANT_SHIPPING_LIST);
			pstmt.setString(1, shippingBean.getUserId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Shipping ms = new Shipping();
				ms.setId(rs.getString("id"));
				msList.add(ms);
			}
			shippingBean.setShipping(msList);
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}

	public void deAssociateMechantShippingDetails(ArrayList<String> deleteMSIDList) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(Queries.DELETE_MERCHANT_SHIPPING_LIST);
			for (String msID : deleteMSIDList) {
				pstmt.setString(1, msID);
				pstmt.addBatch();
			}
			pstmt.executeBatch();
			conn.commit();
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}

	public void updateMerchantShipping(ShippingBean shippingBean, ArrayList<Shipping> addmsList) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Shipping> shippingMSList = null;
		
		System.out.println("Merchant Precent : "+shippingBean.getMerchantPercent());
		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			/*
			 * This code is to update in values for product variant table with
			 * respective fields
			 */

			shippingMSList = (ArrayList<Shipping>) shippingBean.getShipping();
			if (shippingMSList != null && shippingMSList.size()>0) {
				pstmt = conn.prepareStatement(Queries.MERCHANT_SHIPPING_UPDATE);
				for (Shipping shipping : shippingMSList) {
					pstmt.setString(1, shipping.getTitle());
					pstmt.setString(2, shipping.getLenght());
					pstmt.setString(3, shipping.getWidth());
					pstmt.setString(4, shipping.getLenght());
					pstmt.setString(5, shippingBean.getMerchantPercent());
					pstmt.setString(6, shipping.getId());
					
					pstmt.addBatch();
				}

				pstmt.executeBatch();
			}
			pstmt.close();

			if (addmsList != null && addmsList.size() >0) {
				pstmt = conn.prepareStatement(Queries.MERCHANT_shipping_settings);
				for (Shipping shipping : addmsList) {
					idGen = "SHP" + CommonsUtils.getID();
					pstmt.setString(1, idGen);
					pstmt.setString(2, shipping.getTitle());
					pstmt.setString(3, shipping.getLenght());
					pstmt.setString(4, shipping.getWidth());
					pstmt.setString(5, shipping.getHeight());
					pstmt.setString(6, shippingBean.getMerchantPercent());
					pstmt.setString(7, shippingBean.getUserId());
					pstmt.addBatch();
				}

				pstmt.executeBatch();
			}

			conn.commit();
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}

	

}
