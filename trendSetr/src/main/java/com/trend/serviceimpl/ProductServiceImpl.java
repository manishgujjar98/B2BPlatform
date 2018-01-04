package com.trend.serviceimpl;

import java.util.ArrayList;

import org.apache.log4j.Logger;

import com.trend.daoimpl.ProductDaoImpl;
import com.trend.enums.MessageEnum;
import com.trend.exceptions.PersistException;
import com.trend.models.Category;
import com.trend.models.Product;
import com.trend.models.ProductVariant;
import com.trend.serviceinf.ProductServiceInf;

public class ProductServiceImpl implements ProductServiceInf {

	private Logger logger = Logger.getLogger(ProductServiceImpl.class);
	ProductDaoImpl productDaoImpl = new ProductDaoImpl();

	public MessageEnum add(Product product) {
		try {
			productDaoImpl.add(product);
			return MessageEnum.MESSAGE_SUCCESS;
		} catch (PersistException e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR;
		}
	}

	public MessageEnum update(Product product) {
		try {
			productDaoImpl.update(product);
			updateProductVarients(product);
			return MessageEnum.MESSAGE_SUCCESS;

		} catch (Exception e) {
			logger.info(e.toString());
			return MessageEnum.MESSAGE_FAILUR;

		}

	}
	
	public void updateProductVarients(Product product) {
		try {
			ArrayList<ProductVariant> productVariants = product.getProductVariantList();

			ArrayList<String> deletePVIDList = findDeletePVList(product);

			if (deletePVIDList.size() > 0) {
				productDaoImpl.deAssociateProductVariants(deletePVIDList);
			}
			if (product.getProductVariantList().size() > 0) {
				Product tempProduct = new Product();
				tempProduct.setId(product.getId());
				productDaoImpl.populateProductVariants(tempProduct);
				ArrayList<ProductVariant> existpvList = tempProduct.getProductVariantList();
				ArrayList<ProductVariant> addpvList = findaddpvList(product.getProductVariantList(), existpvList);
				productDaoImpl.updateProductVarients(product, addpvList);
			}

			

		} catch (Exception e) {
			logger.info(e.toString());
		}
	}

	public ArrayList<String> findDeletePVList(Product product) {
		try {
			Product tempProduct = new Product();
			tempProduct.setId(product.getId());
			productDaoImpl.populateProductVariants(tempProduct);
			ArrayList<ProductVariant> newpvList = product.getProductVariantList();
			ArrayList<ProductVariant> existpvList = tempProduct.getProductVariantList();
			ArrayList<String> deletepvList = new ArrayList<String>();
			for (ProductVariant epv : existpvList) {
				boolean found = false;
				for (ProductVariant npv : newpvList) {
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

	public ArrayList<ProductVariant> findaddpvList(ArrayList<ProductVariant> productpvList, ArrayList<ProductVariant> existpvList){
		try{
			ArrayList<ProductVariant> createpvList = new ArrayList<ProductVariant>();
			for(ProductVariant pv : productpvList){
				boolean found = false;
				for(ProductVariant epv : existpvList){
					if(pv.getId().equals(epv.getId())){
						pv.setId(epv.getId());
						found = true;
					}
				}
				if(!found)
					createpvList.add(pv);
			}
			return createpvList;
		} catch (Exception e){
			logger.info(e.toString());
		}
		return null;
	}


	public ArrayList<Product> retrieve(String productId) {

		ArrayList<Product> list = new ArrayList<Product>();
		ArrayList<ProductVariant> pList = new ArrayList<ProductVariant>();
		try {
			 list = productDaoImpl.retrieve(productId);
			/*if (productId.equalsIgnoreCase("Nike")) {
				Product p1 = new Product();
				p1.setName("Nike");
				p1.setDescription("Nike Product");
				ProductVariant pv1 = new ProductVariant();
				pv1.setPrice(90.12);
				pv1.setColour("black");
				pv1.setSkuId("sku1");
				pv1.setSize("M");
				ProductVariant pv2 = new ProductVariant();
				pv2.setPrice(100.12);
				pv2.setColour("white");
				pv2.setSkuId("sku2");
				pv2.setSize("L");
				ProductVariant pv3 = new ProductVariant();
				pv3.setPrice(110.12);
				pv3.setColour("red");
				pv3.setSkuId("sku3");
				pv3.setSize("S");
				pList.add(pv1);
				pList.add(pv2);
				pList.add(pv3);
				p1.setProductVariantList(pList);
				list.add(p1);
			} else {
				Product p1 = new Product();
				p1.setName("Reebok");
				p1.setDescription("Reebok Product");
				ProductVariant pv1 = new ProductVariant();
				pv1.setPrice(90.12);
				pv1.setColour("black");
				pv1.setSkuId("sku1");
				pv1.setSize("M");
				ProductVariant pv2 = new ProductVariant();
				pv2.setPrice(100.12);
				pv2.setColour("white");
				pv2.setSkuId("sku2");
				pv2.setSize("L");
				ProductVariant pv3 = new ProductVariant();
				pv3.setPrice(110.12);
				pv3.setColour("red");
				pv3.setSkuId("sku3");
				pv3.setSize("S");
				pList.add(pv1);
				pList.add(pv2);
				pList.add(pv3);
				p1.setProductVariantList(pList);
				list.add(p1);
			}
*/
			return list;
		} // catch (PersistException e) {
		catch (Exception e) {
			logger.info(e.toString());
			return list;
		}

	}

	public ArrayList<Product> retrieveAll(String userId) {
		ArrayList<Product> list = new ArrayList<Product>();
		try {
			 list = productDaoImpl.retrieveAll(userId);

			/*Product p1 = new Product();
			ProductVariant pv1 = new ProductVariant();
			pv1.setPrice(100.12);
			p1.setName("Nike");
			p1.setProductVariant(pv1);
			Product p2 = new Product();
			ProductVariant pv2 = new ProductVariant();
			p2.setName("Reebok");
			pv2.setPrice(90.12);
			p2.setProductVariant(pv2);
			list.add(p1);
			list.add(p2);*/
			return list;
		} catch (Exception e) {
			logger.info(e.toString());
			return list;
		}
	}
	
	public ArrayList<Category> retrieveGenderCategory(String genderId) {
		ArrayList<Category> cList = new ArrayList<Category>();
		try {
			
			cList = productDaoImpl.retrieveGenderCategory(genderId);
			
			/*if(genderId.equals("1")){
				Category c1= new Category();
				c1.setId("11");
				c1.setCategoryName("M1");
				
				Category c2 = new Category();
				c2.setId("12");
				c2.setCategoryName("M2");
				
				Category c3= new Category();
				c3.setId("13");
				c3.setCategoryName("M3");
				
				Category c4 = new Category();
				c4.setId("14");
				c4.setCategoryName("M4");
				
				Category c5 = new Category();
				c5.setId("15");
				c5.setCategoryName("M5");
				
				cList.add(c1);
				cList.add(c2);
				cList.add(c3);
				cList.add(c4);
				cList.add(c5);
				
			}else if(genderId.equals("2")){
				
				Category c1= new Category();
				c1.setId("16");
				c1.setCategoryName("F1");
				
				Category c2 = new Category();
				c2.setId("17");
				c2.setCategoryName("F2");
				
				Category c3= new Category();
				c3.setId("18");
				c3.setCategoryName("F3");
				
				Category c4 = new Category();
				c4.setId("19");
				c4.setCategoryName("F4");
				
				Category c5 = new Category();
				c5.setId("20");
				c5.setCategoryName("F5");
				
				cList.add(c1);
				cList.add(c2);
				cList.add(c3);
				cList.add(c4);
				cList.add(c5);
				
			}
*/			return cList;
		} catch (Exception e) {
			logger.info(e.toString());
			return cList;
		}
	} 

	@Override
	public ArrayList<Product> retrieveAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
