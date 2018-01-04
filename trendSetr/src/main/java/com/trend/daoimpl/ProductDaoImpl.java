/*

*/
package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.commons.dbutils.DbUtils;
import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.ProductDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.exceptions.PersistException;
import com.trend.models.Category;
import com.trend.models.Merchant;
import com.trend.models.MerchantProducts;
import com.trend.models.Product;
import com.trend.models.ProductImages;
import com.trend.models.ProductVariant;
import com.trend.serviceimpl.MerchantProductsServiceImpl;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class ProductDaoImpl implements ProductDaoInf {

	private Logger logger = Logger.getLogger(ProductDaoImpl.class);
	MerchantProductsServiceImpl merchantProductsServiceImpl = new MerchantProductsServiceImpl();
	Merchant merchant = new Merchant();
	private String idGen = null;
	private String idGen1 = null;
	private String idGen2 = null;
	private String idGen3 = null;

	public void add(Product product) throws PersistException {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<MerchantProducts> merchantProductList = null;
		ArrayList<ProductVariant> productVariantList = null;
		ArrayList<ProductImages> productImagesList = null;

		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PRODUCT_INSERT);
			idGen = "PRD" + CommonsUtils.getID();
			pstmt.setString(1, idGen);
			pstmt.setString(2, product.getName());
			pstmt.setString(3, product.getSubcategoryId());
			pstmt.setString(4, product.getGender());
			pstmt.setString(5, product.getDescription());
			pstmt.setString(6, product.getCreatedBy());
			pstmt.setString(7, product.getCategoryName());
			//pstmt.setString(8, product.getCategoryId());
			
			pstmt.executeUpdate();
			pstmt.close();
			conn.commit();

			/*
			 * This code is to fill in values for product variant table with
			 * respective fields
			 */

			productVariantList = product.getProductVariantList();
			if (productVariantList != null) {
				pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANT_INSERT);
				for (ProductVariant productVariant : productVariantList) {
					idGen1 = "PDV"+CommonsUtils.getID();
					pstmt.setString(1,idGen1);
					pstmt.setString(2, productVariant.getSkuId());
					pstmt.setDouble(3, productVariant.getPrice());
					pstmt.setString(4, productVariant.getSize());
					pstmt.setString(5, productVariant.getColour());
					pstmt.setInt(6, productVariant.getAddStock());
					pstmt.setString(7, product.getCreatedBy());
					//pstmt.setInt(6, 1);
					//pstmt.setString(7, "user");
					pstmt.setString(8, idGen);
					pstmt.setDouble(9, productVariant.getWeight());

					pstmt.addBatch();
				}

				pstmt.executeBatch();
			}
			conn.commit();

			/*
			 * This code is to fill in values for product images table with
			 * respective fields */
			 

			productImagesList = product.getProductImagesList();
			if (productImagesList != null) {
				pstmt = conn.prepareStatement(Queries.PRODUCT_IMAGES_INSERT);
				for (ProductImages productImages : productImagesList) {
					idGen2 = "PDI"+CommonsUtils.getID();
					pstmt.setString(1, idGen2);
					//pstmt.setString(2, idGen1);
					pstmt.setString(2, productImages.getImage());
					pstmt.setString(3, productImages.getType());
					pstmt.setString(4, product.getCreatedBy());
					pstmt.setString(5, idGen);
					pstmt.addBatch();
				}

				pstmt.executeBatch();
			}
			conn.commit();

			
			/* * This code is to fill in values for merchant-products table with
			 * productId & merchantId*/
			 

			/*merchantProductList = product.getMerchantProductList();
			if (merchantProductList != null) {
				pstmt = conn.prepareStatement(Queries.MERCHANT_PRODUCTS_INSERT);
				for (MerchantProducts merchantProducts : merchantProductList) {
					idGen3 = "MPD"+CommonsUtils.getID();
					pstmt.setString(1, idGen3);
					pstmt.setString(2,merchantProducts.getMerchantId());
					pstmt.setString(3,idGen );
					pstmt.addBatch();
				}

				pstmt.executeBatch();
			}
			conn.commit();*/

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}

	public void update(Product product) throws PersistException {

		// ArrayList<MerchantProducts> merchantProductList = null;
		ArrayList<ProductVariant> productVariantList = null;
		ArrayList<ProductImages> productImagesList = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PRODUCT_UPDATE);
			pstmt.setString(1, product.getName());
			pstmt.setString(2, product.getSubcategoryId());
			pstmt.setString(3, product.getGender());
			pstmt.setString(4, product.getDescription());
			pstmt.setString(5, product.getUpdatedBy());
			pstmt.setString(6, product.getCategoryName());
			pstmt.setString(7, product.getId());
			pstmt.executeUpdate();
			pstmt.close();

			/*
			 * This code is to update in values for product images table with
			 * respective fields
			 */

			productImagesList = product.getProductImagesList();
			if (productImagesList != null) {
				pstmt = conn.prepareStatement(Queries.PRODUCT_IMAGES_UPDATE);
				for (ProductImages productImages : productImagesList) {
					pstmt.setString(1, productImages.getImage());
					pstmt.setString(2, productImages.getType());
					pstmt.setString(3, productImages.getUpdatedBy());
					pstmt.setString(4, productImages.getId());
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
	
	public void populateProductVariants(Product product) throws PersistException{
		ArrayList<ProductVariant> pvList = new ArrayList<ProductVariant>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANTS_LIST);
			pstmt.setString(1, product.getId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ProductVariant pv = new ProductVariant();
				pv.setId(rs.getString("id"));
				pvList.add(pv);
			}
			product.setProductVariantList(pvList);
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
	}
	
	public void deAssociateProductVariants(ArrayList<String> productpvList) throws PersistException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(Queries.DELETE_PRODUCT_VARIANTS_LIST);
			for(String pvID : productpvList){
				pstmt.setString(1, pvID);
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
	
	public void updateProductVarients(Product product, ArrayList<ProductVariant> addpvList) throws PersistException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ProductVariant> productVariantList = null;
		try{
			conn = DBHelper.getConn();
			conn.setAutoCommit(false);
			/*
			 * This code is to update in values for product variant table with
			 * respective fields
			 */

			productVariantList = product.getProductVariantList();
			if (productVariantList != null) {
				pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANT_UPDATE);
				for (ProductVariant productVariant : productVariantList) {
					int quantity = productVariant.getQuantity();
					if( productVariant.getAddStock() != 0)
						quantity += productVariant.getAddStock();
					if( productVariant.getRemoveStock() != 0)
						quantity -= productVariant.getRemoveStock();
					System.out.println("Test Quantity : "+quantity);
					pstmt.setString(1, productVariant.getSkuId());
					pstmt.setDouble(2, productVariant.getPrice());
					pstmt.setString(3, productVariant.getColour());
					pstmt.setString(4, productVariant.getSize());
					pstmt.setString(5, productVariant.getUpdatedBy());
					pstmt.setInt(6, quantity);
					pstmt.setDouble(7, productVariant.getWeight());
					pstmt.setString(8, productVariant.getId());

					pstmt.addBatch();
				}

				pstmt.executeBatch();
			}
			pstmt.close();
			
			if (addpvList != null) {
				pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANT_INSERT);
				for (ProductVariant productVariant : addpvList) {
					idGen1 = "PDV"+CommonsUtils.getID();
					pstmt.setString(1,idGen1);
					pstmt.setString(2, productVariant.getSkuId());
					pstmt.setDouble(3, productVariant.getPrice());
					pstmt.setString(4, productVariant.getSize());
					pstmt.setString(5, productVariant.getColour());
					/*pstmt.setInt(6, productVariant.getQuantity());
					pstmt.setString(7, productVariant.getCreatedBy());*/
					pstmt.setInt(6, 1);
					pstmt.setString(7, "user");
					pstmt.setString(8, product.getId());
					pstmt.setDouble(9, productVariant.getWeight());

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

	public ArrayList<Product> retrieve(String productId) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Product> retrievedList = new ArrayList<Product>();
		Product productData = null;
		ProductVariant productVariant = null;
		ProductImages productImages = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PRODUCT_DETAILS_SELECTED);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productData = new Product();
				productImages = new ProductImages();
				productData.setId(rs.getString("ID"));
				productData.setName(rs.getString("NAME"));
				productData.setGender(rs.getString("GENDER"));
				productData.setCategoryName(rs.getString("CNAME"));
				productData.setCategoryId(rs.getString("CID"));
				productData.setDescription(rs.getString("description"));
				productData.setSubcategoryId(rs.getString("SUBCATEGORY_ID"));
				
			}
			pstmt.close();
			ArrayList<ProductVariant> pvList = new ArrayList<ProductVariant>();
			pstmt = conn.prepareStatement(Queries.PRODUCT_VARIANT_DETAILS);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productVariant = new ProductVariant();
				productImages = new ProductImages();
				productVariant.setId(rs.getString("ID"));
				productVariant.setSkuId(rs.getString("SKU_ID"));
				productVariant.setPrice(rs.getDouble("PRICE"));
				productVariant.setColour(rs.getString("COLOUR"));
				productVariant.setSize(rs.getString("SIZE"));
				productVariant.setQuantity(rs.getInt("QUANTITY"));
				productVariant.setWeight(rs.getDouble("WEIGHT"));
				productVariant.setAddStock(0);
				pvList.add(productVariant);
			}
			productData.setProductVariantList(pvList);
			
			ArrayList<ProductImages> piList = new ArrayList<ProductImages>();
			pstmt = conn.prepareStatement(Queries.PRODUCT_IMAGES_RETRIEVE_SELECTED);
			pstmt.setString(1, productId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productImages = new ProductImages();
				productImages.setId(rs.getString("ID"));
				productImages.setImage(rs.getString("IMAGE"));
				productImages.setType(rs.getString("TYPE"));
				
				piList.add(productImages);
			}
			productData.setProductImagesList(piList);
			retrievedList.add(productData);

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}		return retrievedList;

	}

	
	public ArrayList<Category> retrieveGenderCategory(String genderID) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Category category = null;
		ArrayList<Category> retrievedList = new ArrayList<Category>();
		try{
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			//manish code
			if(genderID.equals("1")){
				genderID = "male";
			}
			else{
				genderID= "female";
			}
			
			pstmt = conn.prepareStatement(Queries.GENDER_CATEGORY_LIST);
			pstmt.setString(1, genderID);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				category = new Category();
				category.setId(rs.getString("ID"));
				category.setCategoryName(rs.getString("CATEGORY_NAME"));
				
				retrievedList.add(category);
			}
			
			if(retrievedList.size() > 0){
				return retrievedList;
			}
		} catch (SQLException e) {
			logger.info(e.toString());
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);

		}
		return retrievedList;
	}
	
	
	public ArrayList<Product> retrieveAll(String userId) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Product> retrievedList = new ArrayList<Product>();
		ArrayList<Product> uniqueRetrievedList = new ArrayList<Product>();
		Product product = null;
		ProductVariant productVariant = null;
		ProductImages productImages = null;
		try{
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.PRODUCT_DETAILS_ALL);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product = new Product();
				productVariant = new ProductVariant();
				productImages = new ProductImages();
				product.setId(rs.getString("ID"));
				product.setName(rs.getString("NAME"));
				product.setCategoryName(rs.getString("CID"));
				product.setDescription(rs.getString("description"));
				productVariant.setPrice(rs.getDouble("PRICE"));
				productVariant.setSize(rs.getString("SIZE"));
				productVariant.setColour(rs.getString("COLOUR"));
				productVariant.setWeight(rs.getDouble("WEIGHT"));
				productVariant.setQuantity(rs.getInt("QUANTITY"));
				product.setProductVariant(productVariant);
				productImages.setImage(rs.getString("IMAGE"));
				//product.setProductVariant(productVariant);
				product.setProductImages(productImages);
				System.out.println("*****product*****");
				retrievedList.add(product);
			}
			HashSet<Product> uproList = new HashSet<Product>();
			
			if(retrievedList.size() >0 ){
				uproList.addAll(retrievedList);
				retrievedList.clear();
				retrievedList.addAll(uproList);
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
	public List<Product> get(List<String> productIds) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Product> products = new ArrayList<>();
		try {
			StringBuilder queryBuilder = new StringBuilder("SELECT * from products where id in ( ");
			for(String productId : productIds){
				queryBuilder.append("'" + productId + "',");
			}
			queryBuilder = queryBuilder.deleteCharAt(queryBuilder.length() - 1);
			queryBuilder = queryBuilder.append(")") ;
			conn = DBHelper.getConn();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(queryBuilder.toString());
			while (rs.next()) {
				Product product = new Product();
				product.setId(rs.getString("id"));
				product.setName(rs.getString("name"));
				product.setCategoryName(rs.getString("category_id"));
				product.setDescription(rs.getString("description"));
				product.setWeight(rs.getInt("weight"));
				products.add(product);
			}
		}  finally {
			DbUtils.closeQuietly(conn, stmt, rs);
		}
		return null;
	}

}



