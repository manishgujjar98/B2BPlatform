package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Collection;

import org.apache.log4j.Logger;

import com.trend.utils.DBHelper;


public class ShippingProductsDAO {
	
private static Logger LOGGER = Logger.getLogger(ShippingProductsDAO.class);
	
	public boolean save(Connection connection,String shippingID, Collection<String> productIds ) throws Exception {
		LOGGER.debug(" saves shipping Product details [ " + shippingID + " ] products " + productIds);

		boolean result = false;
		PreparedStatement pstmt = null;
		try {
			pstmt = connection.prepareStatement("INSERT INTO shipping_products (`shipping_id`, `product_id`) VALUES (?,?)");
			for(String productID : productIds){
				pstmt.setString(1,shippingID);
				pstmt.setString(2,productID);
				pstmt.addBatch();
			}
			int[] batchResult = pstmt.executeBatch();
			for(int i : batchResult){
				if(i >=0){
				} else {
					throw new Exception("Error while performing batch insert");
				}
			}
			int rowCount = pstmt.executeUpdate();
			result = rowCount != 0;
		}  finally {
			DBHelper.closeConnection(null, pstmt, null);
		}
		return result;
	}

}
