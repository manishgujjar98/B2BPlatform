package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.commons.dbutils.DbUtils;
import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.JsonParser;
import com.trend.models.OrderShipment;
import com.trend.utils.DBHelper;

public class OrderShippingDAO {

	private static Logger LOGGER = Logger.getLogger(OrderShippingDAO.class);

	/**
	 * 
	 * @param connection
	 * @param orderShipping
	 * @return
	 * @throws Exception
	 */
	public boolean save(Connection connection, OrderShipment orderShipping) throws Exception {
		LOGGER.debug(" saves Order Shipping details [ " + orderShipping + " ] ");
		boolean result = false;
		PreparedStatement pstmt = null;
		try {
			int qryCtr = 1;
			pstmt = connection.prepareStatement(
					"INSERT INTO `order_shippings` (`id`, `order_id`, `tracking_id`, `status`, `shipping_response`) VALUES (?,?,?,?,?)");
			pstmt.setString(qryCtr++, orderShipping.getId());
			pstmt.setString(qryCtr++, orderShipping.getOrderID());
			pstmt.setString(qryCtr++, orderShipping.getTrackingID());
			pstmt.setString(qryCtr++, orderShipping.getStatus());
			pstmt.setString(qryCtr++, orderShipping.getShippingResponse().toString());
			int rowCount = pstmt.executeUpdate();
			result = rowCount != 0;
		} finally {
			DBHelper.closeConnection(null, pstmt, null);
		}
		return result;
	}
	
	/**
	 * 
	 * @param shippingID
	 * @param orderID
	 * @return
	 */
	public OrderShipment get(String shippingID, String orderID){
		LOGGER.debug("Fetching tracking ID for order [ " + orderID + " ] and shipping ID [ " + shippingID + " ]");
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		OrderShipment orderShipment = null;
		try {
			connection = DBHelper.getConn();
			pstmt = connection.prepareStatement("select * from order_shippings where order_id = ? and id = ?");
			pstmt.setString(1, orderID);
			pstmt.setString(2, shippingID);
			rset = pstmt.executeQuery();
			if(rset.next()){
				orderShipment = new OrderShipment();
				orderShipment.setId(shippingID);
				orderShipment.setOrderID(orderID);
				orderShipment.setStatus(rset.getString("status"));
				orderShipment.setShippingResponse(rset.getString("shipping_response"));
				orderShipment.setTrackingID(rset.getString("tracking_id"));
			}
		} catch (Exception e) {
			LOGGER.error("Error fetching shipment details",e);
		} finally {
			DbUtils.closeQuietly(connection, pstmt, rset);
		}
		return orderShipment;
	}

}
