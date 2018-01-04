package com.trend.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;

import com.trend.constants.Queries;
import com.trend.daoinf.AddressDaoInf;
import com.trend.exceptions.ErrorResponseUtil;
import com.trend.exceptions.PersistException;
import com.trend.models.Address;
import com.trend.utils.CommonsUtils;
import com.trend.utils.DBHelper;

public class AddressDaoImpl implements AddressDaoInf {

	private Logger logger = Logger.getLogger(AddressDaoImpl.class);
	private String genId = null;

	public void add(Address address) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ADDRESS_INSERT);
			genId = "ADR" + CommonsUtils.getID();
			pstmt.setString(1, genId);
			pstmt.setString(2, address.getFirstName());
			pstmt.setString(3, address.getLastName());
			pstmt.setString(4, address.getAddressLine1());
			pstmt.setString(5, address.getAddressLine2());
			pstmt.setString(6, address.getCity());
			pstmt.setString(7, address.getState());
			pstmt.setString(8, address.getZip());
			pstmt.setString(9, address.getCountry());
			pstmt.setString(10, address.getPhoneNumber());
			pstmt.setString(11, address.getStatus());
			pstmt.setString(12, address.getFirstName());
			pstmt.setString(13, address.getShippingImage());
			pstmt.setString(14, address.getUserId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}

	}

	public void update(Address address) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ADDRESS_UPDATE);
			pstmt.setString(1, address.getAddressLine1());
			pstmt.setString(2, address.getAddressLine2());
			pstmt.setString(3, address.getCity());
			pstmt.setString(4, address.getState());
			pstmt.setString(5, address.getZip());
			pstmt.setString(6, address.getCountry());
			pstmt.setString(7, address.getPhoneNumber());
			pstmt.setString(8, address.getShippingImage());
			pstmt.setString(9, address.getUpdatedBy());
			pstmt.setString(10, address.getId());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);
		} finally {
			DBHelper.closeConnection(null, pstmt, conn);
		}
	}

	public ArrayList<Address> retrieve(String addressId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Address> retrievedList = new ArrayList<Address>();
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ADDRESS_RETRIEVE_SELECTED);
			pstmt.setString(1, addressId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Address address = new Address();
				address.setAddressLine1(rs.getString("ADDRESS_LINE1"));
				address.setAddressLine2(rs.getString("ADDRESS_LINE2"));
				address.setCity(rs.getString("CITY"));
				address.setState(rs.getString("STATE"));
				address.setZip(rs.getString("ZIPCODE"));
				address.setCountry(rs.getString("COUNTRY"));
				address.setShippingImage(rs.getString("SHIPPING_IMAGE"));
				retrievedList.add(address);
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
	public ArrayList<Address> retrieveAll(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Address> retrievedList = new ArrayList<Address>();

		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			pstmt = conn.prepareStatement(Queries.ADDRESS_RETRIEVE_ALL);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Address address = new Address();
				address.setId(rs.getString("ID"));
				address.setFirstName(rs.getString("FIRST_NAME"));
				address.setLastName(rs.getString("LAST_NAME"));
				address.setAddressLine1(rs.getString("ADDRESS_LINE1"));
				address.setAddressLine2(rs.getString("ADDRESS_LINE2"));
				address.setCity(rs.getString("CITY"));
				address.setState(rs.getString("STATE"));
				address.setZip(rs.getString("ZIPCODE"));
				address.setCountry(rs.getString("COUNTRY"));
				address.setShippingImage(rs.getString("SHIPPING_IMAGE"));
				address.setPhoneNumber(rs.getString("PHONE_NUMBER"));
				address.setStatus(rs.getString("STATUS"));
				retrievedList.add(address);
			}
			return retrievedList;

		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}
		return retrievedList;

	}

	@Override
	public void delete(String addressIdList) throws PersistException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConn();
			logger.info("connection" + conn);
			String[] DeleteAdIDs = addressIdList.split(",");
			for(int i = 0; i<DeleteAdIDs.length; i++){
				pstmt = conn.prepareStatement(Queries.ADDRESS_DELETE);
				pstmt.setString(1, DeleteAdIDs[i]);
				pstmt.executeUpdate();
			}
			//conn.commit();
		} catch (SQLException e) {
			logger.error(e.toString());
			ErrorResponseUtil.sendErrorResponse("Bad request", Response.Status.BAD_REQUEST);

		} finally {
			DBHelper.closeConnection(rs, pstmt, conn);
		}
		
	}

}
