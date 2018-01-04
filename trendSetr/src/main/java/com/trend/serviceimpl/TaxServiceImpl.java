package com.trend.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;

import com.taxjar.TaxJarClient;
import com.taxjar.exception.TaxjarException;
import com.taxjar.model.taxes.TaxResponse;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.TaxRequestBean;
import com.trend.serviceinf.TaxServiceInf;
import com.taxjar.model.taxes.TaxResponse;

public class TaxServiceImpl implements TaxServiceInf {
	TaxJarClient tarJarClient = new TaxJarClient();
	private Logger logger = Logger.getLogger(TaxServiceImpl.class);
	public TaxResponse getTax(TaxRequestBean taxRequest) throws JSONException, TaxjarException {
		// TODO Auto-generated method stub
		try {

			TaxResponse response = prepareRequest(taxRequest);
			System.out.println(response.getTax().getAmountToCollect());
			return response;
			// return MessageEnum.MESSAGE_SUCCESS.getMessage();
		} catch (PersistException e) {
			 logger.info(e.toString());
			// return MessageEnum.MESSAGE_FAILUR.getMessage();
		}
		return null;
	}

	public TaxResponse prepareRequest(TaxRequestBean request) throws JSONException, TaxjarException {

		TaxResponse tax = null;

		Map<String, Object> params = new HashMap<String, Object>();
		com.trend.models.TaxRequestAddress address = request.getAddress();
		params.put("from_country", address.getFrom_country());
		params.put("from_zip", address.getFrom_zip());
		params.put("from_state", address.getFrom_state());
		params.put("from_city", address.getFrom_city());
		params.put("from_street", address.getFrom_street());
		params.put("to_country", address.getTo_country());
		params.put("to_zip", address.getTo_zip());
		params.put("to_state", address.getTo_state());
		params.put("to_city", address.getTo_city());
		params.put("to_street", address.getTo_street());
		params.put("amount", request.getAmount());
		params.put("shipping", request.getShipping());

		List<Map<String, Object>> lineItems = new ArrayList<Map<String, Object>>();
		for (com.trend.models.TaxRequestLineItem taxReqLineItem : request.getLineItems()) {

			Map<String, Object> lineItem = new HashMap<>();
			lineItem.put("id", taxReqLineItem.getId());
			lineItem.put("quantity", taxReqLineItem.getQuantity());
			lineItem.put("product_tax_code", taxReqLineItem.getProduct_tax_code());
			lineItem.put("unit_price", taxReqLineItem.getUnit_price());
			lineItem.put("discount", taxReqLineItem.getDiscount());
			lineItems.add(lineItem);
		}

		params.put("line_items", lineItems);

		tax = tarJarClient.getClient().taxForOrder(params);

		// tax = taxForOrder(params);

		return tax;
	}

}
