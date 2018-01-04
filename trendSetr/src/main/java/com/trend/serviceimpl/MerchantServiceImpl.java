package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONException;

import com.trend.daoimpl.MerchantDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Merchant;
import com.trend.models.Product;
import com.trend.models.ProductVariant;
import com.trend.models.Shipping;
import com.trend.models.ShippingBean;
import com.trend.models.TaxRequestBean;
import com.trend.serviceinf.MerchantServiceInf;
import com.trend.utils.TaxValidator;
import com.trendset.util.services.ShipingAddressValidator;

public class MerchantServiceImpl implements MerchantServiceInf {
	MerchantDaoImpl merchantDaoImpl = new MerchantDaoImpl();
	private Logger logger = Logger.getLogger(MerchantServiceImpl.class);

	
	public String add(Merchant merchant) {
		try {
			merchantDaoImpl.add(merchant);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}
	
	public String update(Merchant merchant) {
		try {
			merchantDaoImpl.update(merchant);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public ArrayList<Merchant> retrieve(String merchantId) {
		ArrayList<Merchant> list = new ArrayList<Merchant>();
		try {
			list = merchantDaoImpl.retrieve(merchantId);
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}
	}

	public ArrayList<Merchant> retrieveAll() {
		ArrayList<Merchant> list = new ArrayList<Merchant>();
		try {
			list = merchantDaoImpl.retrieveAll();
			return list;
		} catch (PersistException e) {
			logger.info(e.toString());
			return list;
		}
	}

	@Override
	public String addShippingMerchantDetails(ShippingBean shippingBean) {
		try {
			merchantDaoImpl.addShippingMerchantDetails(shippingBean);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public String updateShippingMerchantDetails(ShippingBean shippingBean) {
		try {
			updateMerchantShipping(shippingBean);
			return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
	}

	public ShippingBean retrieveMerShipDetails(String userId) {
		ShippingBean shippingBean = null;
		try {
			shippingBean = merchantDaoImpl.retrieveMerShipDetails(userId);
			return shippingBean;
		} catch (PersistException e) {
			logger.info(e.toString());
			return shippingBean;
		}
	}

	public ArrayList<Shipping> retrieveAllShippingSizes(String userId) {
		ArrayList<Shipping> shippingSizes = null;
		try {
			shippingSizes = merchantDaoImpl.retrieveAllShippingSizes(userId);
			return shippingSizes;
		} catch (PersistException e) {
			logger.info(e.toString());
			return shippingSizes;
		}
	}

	public void updateMerchantShipping(ShippingBean shippingBean) {
		try {

			ArrayList<String> deleteMSIDList = findDeleteMSList(shippingBean);

			System.out.println(deleteMSIDList);

			if (deleteMSIDList.size() > 0) {
				merchantDaoImpl.deAssociateMechantShippingDetails(deleteMSIDList);
			}
			if (shippingBean.getShipping().size() > 0) {
				ShippingBean tempShippingBean = new ShippingBean();
				tempShippingBean.setUserId(shippingBean.getUserId());
				merchantDaoImpl.populateMerchantShippingDetails(tempShippingBean);
				ArrayList<Shipping> existpvList = (ArrayList<Shipping>) tempShippingBean.getShipping();
				ArrayList<Shipping> addpvList = findaddpvList((ArrayList<Shipping>) shippingBean.getShipping(),
						existpvList);
				merchantDaoImpl.updateMerchantShipping(shippingBean, addpvList);
			}

		} catch (Exception e) {
			logger.info(e.toString());
		}
	}

	public ArrayList<String> findDeleteMSList(ShippingBean shippingBean) {
		try {
			ShippingBean tempShippingBean = new ShippingBean();
			tempShippingBean.setUserId(shippingBean.getUserId());
			merchantDaoImpl.populateMerchantShippingDetails(tempShippingBean);
			ArrayList<Shipping> newpvList = (ArrayList<Shipping>) shippingBean.getShipping();
			ArrayList<Shipping> existpvList = (ArrayList<Shipping>) tempShippingBean.getShipping();
			ArrayList<String> deletepvList = new ArrayList<String>();
			for (Shipping epv : existpvList) {
				boolean found = false;
				for (Shipping npv : newpvList) {
					if (npv.getId().equals(epv.getId())) {
						found = true;
					}
				}
				if (!found) {
					deletepvList.add(epv.getId());
				}
			}
			return deletepvList;
		} catch (Exception e) {
			logger.info(e.toString());
		}
		return null;
	}

	public ArrayList<Shipping> findaddpvList(ArrayList<Shipping> merShipList, ArrayList<Shipping> existMSList) {
		try {
			ArrayList<Shipping> createmsList = new ArrayList<Shipping>();
			for (Shipping ms : merShipList) {
				boolean found = false;
				for (Shipping ems : existMSList) {
					if (ms.getId().equals(ems.getId())) {
						ms.setId(ems.getId());
						found = true;
					}
				}
				if (!found)
					createmsList.add(ms);
			}
			return createmsList;
		} catch (Exception e) {
			logger.info(e.toString());
		}
		return null;
	}



}
