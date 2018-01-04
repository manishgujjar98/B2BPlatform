package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.OrderDAO;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.exceptions.PersistException;
import com.trend.models.Address;
import com.trend.models.OrderItems;
import com.trend.models.Orders;
import com.trend.models.Product;
import com.trend.models.ProductImages;
import com.trend.models.ProductVariant;
import com.trend.models.Profiles;
import com.trend.models.User;
import com.trend.utils.DBHelper;

public class OrderDaoImpl implements OrderDAO {
	private Logger logger = Logger.getLogger(OrderDaoImpl.class);

	public ArrayList<Orders> getOrders(String merchnatId) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		ArrayList<Orders> ordersList = new ArrayList<Orders>();
		List<Product> proList = null;
		Set<String> oList = new HashSet<String>();
		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.ORDERS_LIST);
			pstmt.setString(1, merchnatId);
			pstmt.setString(2, merchnatId);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {

				Orders orders = new Orders();
				List<OrderItems> oiList = new ArrayList<OrderItems>();
				orders.setMerchantId(rs.getString("MID"));
				//orders.setPrice(rs.getString("OPRICE"));
				orders.setId(rs.getString("OID"));
				pstmt1 = conn.prepareStatement(Queries.ORDER_LIST);
				pstmt1.setString(1, merchnatId);
				pstmt1.setString(2, orders.getId());
				rs1 = pstmt1.executeQuery();
				while (rs1.next()){
					OrderItems oi = new OrderItems();
					oi.setProductPrice(rs1.getString("OPRICE"));
					oi.setCreatedTime(rs1.getDate("OCD"));
					oi.setOrderStatus(rs1.getString("OS"));
					Product product = new Product();
					product.setName(rs1.getString("PNAME"));
					oi.setProduct(product);
					oiList.add(oi);
				}
				orders.setOrderItemList(oiList);
				//orders.setCreatedTime(rs.getDate("OCD"));
				//orders.setOrderStatus(rs.getString("OS"));
				/*Product pro = null;
				if(oList.add(orders.getId())){
					proList = new ArrayList<Product>();
					pro = new Product();
					pro.setName(rs.getString("PNAME"));
					proList.add(pro);
					orders.setProductsList(proList);
				}else {
					pro = new Product();
					pro.setName(rs.getString("PNAME"));
					proList.add(pro);
					orders.setProductsList(proList);
				}*/
				ordersList.add(orders);
			}

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return ordersList;

	}
	
	public List<Orders> getOrder(String orderId) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Orders> dbOrderList = new ArrayList<Orders>();
		try {
			conn = DBHelper.getConn();
			pstmt = conn.prepareStatement(Queries.ORDER_DATA);
			pstmt.setString(1, orderId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Orders dbOrder = new Orders();
				Address address = new Address();
				Product pro = new Product();
				Profiles profile = new Profiles();
				ProductVariant pv = new ProductVariant();
				pv.setQuantity(rs.getInt("quantity"));	
				pv.setPrice(rs.getDouble("quantityprice"));
				pv.setId(rs.getString("variantid"));
				pv.setSkuId(rs.getString("skuid"));
				pro.setName(rs.getString("productname"));
				ProductImages pi = new ProductImages();
				pi.setImage(rs.getString("image"));
				pro.setProductVariant(pv);
				pro.setProductImages(pi);
				User u = new User();
				u.setFirstName(rs.getString("firstname"));
				u.setLastName(rs.getString("lastname"));
				profile.setProfileImage(rs.getString("profileImage"));
				u.setProfile(profile);
				address.setAddressLine1(rs.getString("Line1"));
				address.setAddressLine2(rs.getString("Line2"));
				address.setCity(rs.getString("city"));
				address.setState(rs.getString("state"));
				address.setZip(rs.getString("zip"));
				address.setPhoneNumber(rs.getString("phone"));
				address.setCountry(rs.getString("country"));
				dbOrder.setProduct(pro);
				dbOrder.setUser(u);
				dbOrder.setAddress(address);
				
				dbOrderList.add(dbOrder);
			}
			if(dbOrderList.size() > 0)
				return dbOrderList;
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);

		}
		return null;

	}

}