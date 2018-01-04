package com.trend.constants;

public interface Queries {

	//Queries for Config @adding by manesh 11/30/2017 not using
	String CONFIG_RETERIVE = "SELECT NAME,VALUE,CREATED_AT,LAST_MODIFIED_AT FROM CONFIG_KEYS WHERE NAME="+"?";
	// Queries for Address
	// entity****************************************************************************************************************************

	String ADDRESS_INSERT = "INSERT INTO ADDRESS"
			+ "(ID,FIRST_NAME,LAST_NAME,ADDRESS_LINE1,ADDRESS_LINE2, CITY , STATE, ZIPCODE, COUNTRY, PHONE_NUMBER,"
			+ " STATUS,CREATED_BY,SHIPPING_IMAGE,CREATED_TIME,MODIFIED_TIME, USER_ID)" + " VALUES "
			+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE(),SYSDATE(),(SELECT USER_ID FROM USERS WHERE USER_ID=?))";

	String ADDRESS_UPDATE = "UPDATE ADDRESS" + "SET "
			+ "ADDRESS_LINE1 = ?, ADDRESS_LINE2 = ?, CITY= ?, STATE = ?, ZIPCODE = ?, COUNTRY = ?, "
			+ "PHONE_NUMBER = ?, SHIPPING_IMAGE = ? ,UPDATED_BY = ?, MODIFIED_TIME = SYSDATE() " + "WHERE id = ?";

	String ADDRESS_DELETE = "DELETE FROM ADDRESS WHERE ID=?";

	String ADDRESS_RETRIEVE_SELECTED = "SELECT "
			+ "ADDRESS_LINE1,ADDRESS_LINE2,CITY,STATE,ZIPCODE,COUNTRY,SHIPPING_IMAGE " + "FROM "
			+ "ADDRESS WHERE ID = ?";

	String ADDRESS_RETRIEVE_ALL = "SELECT "
			+ "ID, FIRST_NAME, LAST_NAME, PHONE_NUMBER, STATUS,ADDRESS_LINE1,ADDRESS_LINE2,CITY,STATE,ZIPCODE,COUNTRY,SHIPPING_IMAGE "
			+ "FROM " + "ADDRESS WHERE ID IS NOT NULL AND USER_ID=?  ORDER BY CREATED_TIME DESC";

	// Queries for Category
	// entity****************************************************************************************************************************

	String CATEGORY_INSERT = "INSERT INTO CATEGORIES"
			+ " (id,category_name,parent_id,description,men_image,women_image, created_by,created_time) " + "VALUES "
			+ "(?,?,?,?,?,?,?,SYSDATE())";

	String CATEGORY_UPDATE = "UPDATE CATEGORIES " + "SET "
			+ "CATEGORY_NAME = ?, MEN_IMAGE = ?, WOMEN_IMAGE = ?, DESCRIPTION = ?, UPDATED_BY = ?,MODIFIED_TIME = SYSDATE() "
			+ "WHERE id = ?";

	String CATEGORY_DELETE = "";

	String CATEGORY_RETRIEVE_SELECTED = "SELECT " + "CATEGORY_NAME,MEN_IMAGE,WOMEN_IMAGE " + "FROM "
			+ "CATEGORIES WHERE CATEGORY_NAME = ? ";

	String CATEGORY_RETRIEVE_ALL = "SELECT " + "CATEGORY_NAME, MEN_IMAGE, WOMEN_IMAGE " + "FROM "
			+ "CATEGORIES WHERE PARENT_ID IS NULL";

	// Queries for Product
	// entity****************************************************************************************************************************

	String PRODUCT_INSERT = "INSERT INTO PRODUCTS "
			+ "(id,name,subcategory_id,gender,description, created_by, created_time, modified_time,category_id)"
			+ " VALUES " + "(?,?,?,?,?,?,SYSDATE(),SYSDATE(),(SELECT id from categories WHERE category_name=?))";

	String PRODUCT_UPDATE = "UPDATE PRODUCTS " + "SET "
			+ "NAME = ?, subcategory_id = ?, gender= ?, DESCRIPTION = ?, UPDATED_BY = ?,"
			+ " MODIFIED_TIME = SYSDATE(), category_id = (SELECT id from categories WHERE category_name=?) "
			+ " WHERE id = ?";

	String PRODUCT_DELETE = "";

	/*
	 * String PRODUCT_DETAILS_SELECTED =
	 * "SELECT P.NAME, C.CATEGORY_NAME,P.DESCRIPTION,PV.PRICE, PV.SIZE,PV.COLOUR,PV.QUANTITY,GROUP_CONCAT(PI.IMAGE) IMAGE "
	 * + "FROM CATEGORIES C " + "JOIN PRODUCTS P ON(C.ID=P.CATEGORY_ID)" +
	 * "JOIN PRODUCT_VARIANT PV ON(P.ID=PV.PRODUCT_ID) " +
	 * "JOIN PRODUCT_IMAGES PI ON(PV.PRODUCT_ID=PI.PRODUCT_ID)" +
	 * "WHERE P.ID = ?" + "GROUP BY P.ID";
	 */

	String PRODUCT_DETAILS_SELECTED = "SELECT P.ID, P.NAME, C.CATEGORY_NAME CNAME, C.ID CID,P.DESCRIPTION, P.GENDER, P.SUBCATEGORY_ID FROM CATEGORIES C JOIN PRODUCTS P ON(C.ID=P.CATEGORY_ID) WHERE P.ID = ?";

	String PRODUCT_VARIANT_DETAILS = "SELECT ID, SKU_ID, PRICE, SIZE, COLOUR,QUANTITY FROM PRODUCT_VARIANT WHERE PRODUCT_ID = ?";
	/*
	 * String PRODUCT_DETAILS_ALL =
	 * "SELECT P.NAME, C.CATEGORY_NAME,P.DESCRIPTION,PV.PRICE, PV.SIZE,PV.COLOUR,PV.QUANTITY,GROUP_CONCAT(PI.IMAGE) IMAGE "
	 * + "FROM CATEGORIES C " + "JOIN PRODUCTS P ON(C.ID=P.CATEGORY_ID)" +
	 * "JOIN PRODUCT_VARIANT PV ON(P.ID=PV.PRODUCT_ID) " +
	 * "JOIN PRODUCT_IMAGES PI ON(PV.PRODUCT_ID=PI.PRODUCT_ID)" +
	 * "WHERE P.ID IS NOT NULL " + "GROUP BY P.ID";
	 * 
	 * SELECT P.ID, P.NAME, C.ID CID,P.DESCRIPTION,PV.PRICE,
	 * PV.SIZE,PV.COLOUR,PV.QUANTITY,GROUP_CONCAT(PI.IMAGE) IMAGE FROM
	 * CATEGORIES C JOIN PRODUCTS P ON(C.ID=P.CATEGORY_ID) JOIN PRODUCT_VARIANT
	 * PV ON(P.ID=PV.PRODUCT_ID) JOIN PRODUCT_IMAGES PI
	 * ON(PV.PRODUCT_ID=PI.PRODUCT_ID) WHERE P.ID IS NOT NULL and
	 * PI.TYPE="Primary" and P.CREATED_BY = "lucy#gmail.com";
	 */
	// String PRODUCT_DETAILS_ALL = "SELECT P.ID, P.NAME, C.ID
	// CID,P.DESCRIPTION,PV.PRICE, PV.SIZE,PV.COLOUR,PV.QUANTITY FROM CATEGORIES
	// C JOIN PRODUCTS P ON(C.ID=P.CATEGORY_ID) JOIN PRODUCT_VARIANT PV
	// ON(P.ID=PV.PRODUCT_ID) WHERE P.ID IS NOT NULL and P.CREATED_BY = ? ";
	// String PRODUCT_DETAILS_ALL = "SELECT P.ID, P.NAME, C.ID
	// CID,P.DESCRIPTION,PV.PRICE, PV.SIZE,PV.COLOUR,PV.QUANTITY FROM CATEGORIES
	// C JOIN PRODUCTS P ON(C.ID=P.CATEGORY_ID) JOIN PRODUCT_VARIANT PV
	// ON(P.ID=PV.PRODUCT_ID) WHERE P.ID IS NOT NULL and P.CREATED_BY = ? ";
	String PRODUCT_DETAILS_ALL = "SELECT P.ID, P.NAME, C.ID CID,P.DESCRIPTION,PV.PRICE, PV.SIZE,PV.COLOUR,PV.QUANTITY,PV.WEIGHT,PI.IMAGE IMAGE FROM CATEGORIES C JOIN PRODUCTS P ON(C.ID=P.CATEGORY_ID) JOIN PRODUCT_VARIANT PV ON(P.ID=PV.PRODUCT_ID) JOIN PRODUCT_IMAGES PI ON(PV.PRODUCT_ID=PI.PRODUCT_ID) WHERE P.ID IS NOT NULL and PI.TYPE='Primary' and P.CREATED_BY = ?";
	// Queries for Product Variant
	// entity****************************************************************************************************************************

	String PRODUCT_VARIANT_INSERT = "INSERT INTO PRODUCT_VARIANT"
			+ "(ID,SKU_ID,PRICE,SIZE,COLOUR, QUANTITY, CREATED_BY, CREATED_TIME,MODIFIED_TIME,PRODUCT_ID,WEIGHT)"
			+ "VALUES " + "(?,?,?,?,?,?,?,SYSDATE(),SYSDATE(),(SELECT ID from PRODUCTS WHERE ID=?),?)";

	String PRODUCT_VARIANT_UPDATE = "UPDATE  PRODUCT_VARIANT " + "SET "
			+ "SKU_ID = ?,PRICE = ?, COLOUR= ?, SIZE=?, UPDATED_BY = ?, QUANTITY=?, MODIFIED_TIME = SYSDATE(), WEIGHT = ?"
			+ "WHERE ID = ?";

	String PRODUCT_VARIANT_RETRIEVE_SELECTED = "SELECT "
			+ "PRICE, SIZE, COLOUR, QUANTITY,WEIGHT CREATED_BY,UPDATED_BY, CREATED_TIME, MODIFIED_TIME " + "FROM "
			+ "PRODUCT_VARIANT WHERE ID = ?";

	String PRODUCT_VARIANT_RETRIEVE_ALL = "SELECT "
			+ "PRICE, SIZE, COLOUR, QUANTITY, CREATED_BY,UPDATED_BY, CREATED_TIME, MODIFIED_TIME " + "FROM "
			+ "PRODUCT_VARIANT WHERE ID IS NOT NULL";

	// Queries for Product images
	// entity****************************************************************************************************************************

	String PRODUCT_IMAGES_INSERT = "INSERT INTO PRODUCT_IMAGES"
			+ "(ID,IMAGE,TYPE,  CREATED_BY, CREATED_TIME,modified_time,PRODUCT_ID)" + "VALUES "
			+ "(?,?,?,?,SYSDATE(),SYSDATE(),(SELECT ID FROM PRODUCTS WHERE ID=?))";

	String PRODUCT_IMAGES_UPDATE = "UPDATE PRODUCT_IMAGES " + "SET "
			+ "IMAGE = ?, TYPE= ?, UPDATED_BY = ?, MODIFIED_TIME = SYSDATE() " + "WHERE ID = ?";

	String PRODUCT_IMAGES_RETRIEVE_SELECTED = "SELECT " + "ID, IMAGE, TYPE" + " FROM "
			+ "PRODUCT_IMAGES WHERE PRODUCT_ID = ?";

	String PRODUCT_IMAGES_RETRIEVE_ALL = "SELECT "
			+ "PRICE, SIZE, COLOUR, QUANTITY, CREATED_BY,UPDATED_BY, CREATED_TIME, MODIFIED_TIME " + "FROM "
			+ "PRODUCT_VARIANT WHERE ID IS NOT NULL";

	String PRODUCT_VARIANTS_LIST = "SELECT ID FROM PRODUCT_VARIANT WHERE PRODUCT_ID = ? ";

	String DELETE_PRODUCT_VARIANTS_LIST = "DELETE FROM PRODUCT_VARIANT WHERE ID = ?";

	String GENDER_CATEGORY_LIST = "SELECT ID, CATEGORY_NAME FROM CATEGORIES WHERE GENDER = ? ";

	// Queries for Merchant
	// entity****************************************************************************************************************************

	/*
	 * String MERCHANT_INSERT = "INSERT INTO MERCHANTS " +
	 * "(ID,STORE_NAME,UPLOAD_IMAGE,PROFILE_IMAGE,BANNER_IMAGE,PRIORITIES,CREATED_BY,CREATED_TIME,USER_ID) "
	 * + "VALUES " +
	 * "(?,?,?,?,?,?,?,SYSDATE(),(SELECT USER_ID FROM USERS WHERE USER_ID=?))";
	 */
	String MERCHANT_INSERT = "INSERT INTO MERCHANTS " + "(ID,STORE_NAME,CREATED_BY,CREATED_TIME,MODIFIED_TIME,USER_ID) "
			+ "VALUES " + "(?,?,?,SYSDATE(),SYSDATE(),(SELECT USER_ID FROM USERS WHERE USER_ID=?))";

	String MERCHANT_shipping_settings = "INSERT INTO shipping_settings "
			+ "(ID,BOX_TITLE,LENGTH,WIDTH,HEIGHT,merchant_percent,CREATED_date,LAST_UPDATED_AT,USER_ID) " + "VALUES "
			+ "(?,?,?,?,?,?,SYSDATE(),SYSDATE(),?)";

	String MERCHANT_RETRIEVE_SHIPPING_DETAILS = "SELECT ID,BOX_TITLE,LENGTH,WIDTH,HEIGHT,merchant_percent,USER_ID "
			+ "FROM " + "shipping_settings WHERE USER_ID = ? ORDER BY CREATED_DATE";

	String MERCHANT_SHIPPING_LIST = "SELECT ID FROM shipping_settings WHERE USER_ID = ? ";

	//String MERCHANT_SHIPPING_SIZES = "SELECT DISTINCT BOX_TITLE FROM shipping_settings WHERE USER_ID = ? ";
	//manesh
	String MERCHANT_SHIPPING_SIZES = "SELECT box_title,length, width,height, weight, merchant_percent FROM shipping_settings WHERE USER_ID = ? ";
	String MERCHANT_SHIPPING_UPDATE = "UPDATE  shipping_settings " + "SET "
			+ "BOX_TITLE = ?,LENGTH = ?, WIDTH= ?, HEIGHT=?, merchant_percent=? " + "WHERE ID = ?";

	String DELETE_MERCHANT_SHIPPING_LIST = "DELETE FROM shipping_settings WHERE ID = ?";

	String MERCHANT_UPDATE = " UPDATE MERCHANTS " + "SET "
			+ "STORE_NAME = ?, UPLOAD_IMAGE = ?, PROFILE_IMAGE = ?, BANNER_IMAGE = ?,UPDATED_BY = ?,PRIORITIES  = ?,"
			+ " MODIFIED_TIME = SYSDATE() " + "WHERE ID = ?";

	String MERCHANT_DELETE = "";

	String MERCHANT_RETRIEVE_SELECTED = "SELECT  "
			+ "STORE_NAME, UPLOAD_IMAGE, PROFILE_IMAGE, BANNER_IMAGE,priorities,about_images,"
			+ "CREATED_BY,UPDATED_BY,CREATED_TIME,MODIFIED_TIME " + "FROM " + "MERCHANTS WHERE ID = ?";

	String MERCHANT_RETRIEVE_ALL = "SELECT"
			+ "STORE_NAME, UPLOAD_IMAGE, PROFILE_IMAGE, BANNER_IMAGE,priorities,about_images, "
			+ "CREATED_BY,UPDATED_BY,CREATED_TIME,MODIFIED_TIME " + "FROM " + "MERCHANTS WHERE ID IS NOT NULL";

	// Queries for Merchant-Products
	// entity****************************************************************************************************************************

	String MERCHANT_PRODUCTS_INSERT = "INSERT INTO MERCHANT_PRODUCTS " + "(ID,MERCHANT_ID,PRODUCT_ID) " + "VALUES "
			+ "(?,(SELECT ID FROM MERCHANTS WHERE ID =?),(SELECT ID FROM PRODUCTS WHERE ID =?))";

	String MERCHANT_PRODUCTS_UPDATE = "";

	String MERCHANT_PRODUCTS_DELETE = "";

	String MERCHANT_PRODUCTS_RETRIEVE_SELECTED = "SELECT P.NAME,PV.PRICE " + "FROM MERCHANT_PRODUCTS MP "
			+ "JOIN PRODUCTS P ON(P.ID=MP.PRODUCT_ID)" + "JOIN PRODUCT_VARIANT PV ON(P.ID= PV.PRODUCT_ID)"
			+ "WHERE MP.MERCHANT_ID = ?";

	String MERCHANT_PRODUCTS_RETRIEVE_ALL = "SELECT P.NAME,PV.PRICE " + "FROM MERCHANT_PRODUCTS MP "
			+ "JOIN PRODUCTS P ON(P.ID=MP.PRODUCT_ID)" + "JOIN PRODUCT_VARIANT PV ON(P.ID= PV.PRODUCT_ID)"
			+ "WHERE MP.MERCHANT_ID IS NOT NULL";

	// Queries for Bank-account
	// entity****************************************************************************************************************************

	String ACCOUNT_INSERT = "INSERT INTO BANK_ACCOUNTS "
			+ "(ID,USER_ID, CREATED_BY,account_id,bank_name,routing_number,name,default_account,CREATED_TIME, MODIFIED_TIME) "
			+ "VALUES" + " (?,?,?,?,?,?,?,?,SYSDATE(),SYSDATE())";

	String ACCOUNT_UPDATE = "UPDATE BANK_ACCOUNTS " + "SET "
			+ "BANK_NAME = ?, ACCOUNT_NUMBER = ?, ROUTING_NUMBER = ?, NAME = ?,DEFAULT_ACCOUNT  = ?, "
			+ "UPDATED_BY = ?, MODIFIED_TIME = SYSDATE() " + "WHERE ID = ?";

	String ACCOUNT_DELETE = "";

	String ACCOUNT_RETRIEVE_SELECTED = " SELECT " + " BANK_NAME, ACCOUNT_ID, ROUTING_NUMBER, NAME, DEFAULT_NUMBER,"
			+ "CREATED_BY,UPDATED_BY,CREATED_TIME,MODIFIED_TIME" + " FROM " + "BANK_ACCOUNTS WHERE ID = ?";

	String ACCOUNT_RETRIEVE_ALL = "SELECT " + " BANK_NAME, ACCOUNT_ID, ROUTING_NUMBER, NAME, DEFAULT_NUMBER,"
			+ "CREATED_BY,UPDATED_BY,CREATED_TIME,MODIFIED_TIME " + "FROM " + "BANK_ACCOUNTS WHERE ID IS NOT NULL";

	// Queries for Payment-types
	// entity****************************************************************************************************************************

	String PAYMENT_TYPE_INSERT = "INSERT INTO PAYMENT_TYPES "
			+ "(ID,USER_ID,CARD_NAME,CARD_NUMBER,EXPIRATION_DATE,CARD_TYPE,BILLING_ADDRESS, CREATED_BY, CREATED_TIME) "
			+ "VALUES " + "(?,?,?,?,?,?,?,?,SYSDATE())";

	String PAYMENT_TYPE_UPDATE = "UPDATE PAYMENT_TYPES " + "SET "
			+ "CARD_NAME = ?, CARD_NUMBER = ?, EXPIRATION_DATE = ?, CARD_TYPE = ?, "
			+ "BILLING_ADDRESS  = ?, UPDATED_BY = ?, MODIFIED_TIME = SYSDATE()" + " WHERE ID = ?";

	String PAYMENT_TYPE_DELETE = "";

	String PAYMENT_TYPE_RETRIEVE_SELECTED = " SELECT  "
			+ "CARD_NAME, CARD_NUMBER, EXPIRATION_DATE, CARD_TYPE, billing_address,CREATED_BY,"
			+ "UPDATED_BY,CREATED_TIME,MODIFIED_TIME" + " FROM " + "PAYMENT_TYPES WHERE ID = ?";

	String PAYMENT_TYPE_RETRIEVE_ALL = "SELECT  "
			+ "CARD_NAME, CARD_NUMBER, EXPIRATION_DATE, CARD_TYPE,billing_address,CREATED_BY,"
			+ "UPDATED_BY,CREATED_TIME,MODIFIED_TIME " + "FROM " + "PAYMENT_TYPES WHERE ID IS NOT NULL";

	// Queries for Earnings
	// entity****************************************************************************************************************************

	String EARNINGS_INSERT = "INSERT INTO EARNINGS "
			+ "(ID,USER_ID,AMOUNT,EARNED_FROM,PRODUCT_ID,EARNED_SHARE, CREATED_BY,CREATED_TIME) "
			+ "VALUES (?,?,?,?,?,?,?,SYSDATE())";

	String EARNINGS_UPDATE = "UPDATE PAYMENT_TYPES" + " SET "
			+ "CARD_NAME = ?, CARD_NUMBER = ?, EXPIRATION_DATE = ?, CARD_TYPE = ?, "
			+ "BILLING_ADDRESS  = ?, UPDATED_BY = ?, MODIFIED_TIME = SYSDATE()" + " WHERE ID = ?";

	String EARNINGS_DELETE = "";

	String EARNINGS_RETRIEVE_SELECTED = " SELECT  "
			+ "AMOUNT,EARNED_FROM,PRODUCT_ID,EARNED_SHARE,CREATED_BY,CREATED_TIME" + " FROM" + " EARNINGS WHERE ID = ?";

	String EARNINGS_RETRIEVE_ALL = "SELECT " + " AMOUNT,EARNED_FROM,PRODUCT_ID,EARNED_SHARE,CREATED_BY,CREATED_TIME"
			+ " FROM " + "EARNINGS WHERE ID IS NOT NULL";

	// Queries for user-wallet
	// entity****************************************************************************************************************************

	String USER_WALLET_INSERT = "INSERT INTO USER_WALLET " + "(ID,USER_ID,TOTAL_EARNINGS,CREATED_TIME) " + "VALUES "
			+ "(?,(SELECT USER_ID FROM USERS WHERE USER_ID = ?),(SELECT AMOUNT FROM EARNINGS WHERE ID = ?),SYSDATE())";

	String USER_WALLET_UPDATE = "UPDATE USER_WALLET " + "SET " + "TOTAL_EARNINGS = ?,MODIFIED_TIME = SYSDATE() "
			+ "WHERE USER_ID = ?";

	String USER_WALLET_RETRIEVE_SELECTED = " SELECT  " + "USER_ID,TOTAL_EARNINGS,CREATED_TIME,MODIFIED_TIME" + " FROM"
			+ " USER_WALLET WHERE USER_ID = ?";

	String USER_WALLET_RETRIEVE_ALL = "SELECT  "
			+ "USER_ID,TOATAL_EARNINGS,CREATED_BY,CREATED_TIME,UPDATED_BY,MODIFIED_TIME" + " FROM"
			+ " USER_WALLET WHERE USER_ID IS NOT NULL";

	// Queries for Transactions entity
	// *******************************************************************************************************************************

	String TRANSACTION_INSERT = "INSERT INTO TRANSACTIONS"
			+ "(ID,USER_ID,SOURCE_ID,SOURCE_TYPE,TYPE,DESTINATION_ID,DESTINATION_TYPE,"
			+ "STATUS,STATUS_RESPONSE,AMOUNT)" + "VALUES"
			+ "(?,(SELECT USER_ID FROM USERS WHERE USER_ID = ?),?,?,?,?,?,?,?,?)";

	String TRANSACTION_UPDATE = "UPDATE TRANSACTIONS " + "SET" + "STATUS = ?" + "WHERE ID = ?";

	String TRANSACTION_RETRIEVE = "SELECT " + "SOURCE_ID,SOURCE_TYPE,TYPE,DESTINATION_ID,DESTINATION_TYPE,STATUS,"
			+ "STATUS_RESPONSE,TRANSACTION_DATE,AMOUNT" + "FROM" + "TRANSACTIONS WHERE ID = ?";

	String TRANSACTION_RETRIEVE_ALL = "SELECT " + "SOURCE_ID,SOURCE_TYPE,TYPE,DESTINATION_ID,DESTINATION_TYPE,STATUS,"
			+ "STATUS_RESPONSE,TRANSACTION_DATE,AMOUNT" + "FROM" + "TRANSACTIONS WHERE ID IS NOT NULL";

	// Queries for Merchant-Bid entity
	// *******************************************************************************************************************************

	String MERCHANT_BID_INSERT = "INSERT INTO MERCHANT_BIDS "
			+ "(ID,USER_ID,BID_ID,BID_PRICE,BID_APPROVAL,BIDDED_ON,APPROVED_ON,MERCHANT_BID_IMAGE) " + "VALUES "
			+ "(?,(SELECT USER_ID FROM USERS WHERE USER_ID = ?),(SELECT BID_ID FROM BID WHERE BID_ID =?),?,?,?,?,?)";

	String MERCHANT_BID_UPDATE = "";

	String MERCHANT_BID_RETRIEVE = "SELECT USER_ID,BID_ID,BID_PRICE,BID_APPROVAL,BIDDED_ON"
			+ "APPROVED_ON,MERCHANT_BID_IMAGE" + "FROM MERCHANT_BIDS" + "WHERE ID = ?";

	String MERCHANT_BID_RETRIEVE_ALL = "SELECT USER_ID,BID_ID,BID_PRICE,BID_APPROVAL,BIDDED_ON"
			+ "APPROVED_ON,MERCHANT_BID_IMAGE" + "FROM MERCHANT_BIDS" + "WHERE ID IS NOT NULL";

	// Queries for collections and
	// bid*************************************************************************************************************************************

	String COLL_INSERT = "INSERT INTO COLLECTIONS " + "(NAME,BANNER_IMAGE,PRIORITY_LIST, CREATED_BY,CREATED_TIME,ID)"
			+ " VALUES " + "(?,?,?,?,SYSDATE(),?)";

	String COLL_UPDATE = "UPDATE COLLECTIONS " + "SET"
			+ "NAME =?,BANNER_IMAGE=?,PRIORITY_LIST=?,LAST_UPDATED_BY=?,LAST_MODIFIED_TIME=SYSDATE() " + "WHERE ID=?";

	String COLL_RETRIEVE = "SELECT "
			+ "NAME,BANNER_IMAGE,PRIORITY_LIST,CREATED_BY,UPDATED_BY,CREATED_TIME,MODIFIED_TIME" + "FROM COLLECTIONS "
			+ "WHERE ID =? ";

	String COLL_RETRIEVE_ALL = "SELECT "
			+ "NAME,BANNER_IMAGE,PRIORITY_LIST,CREATED_BY,UPDATED_BY,CREATED_TIME,MODIFIED_TIME" + "FROM COLLECTIONS "
			+ "WHERE ID IS NOT NULL ";

	String BID_INSERT = "INSERT INTO BID" + "(USER_ID,FROM_DATE,TO_DATE,BID_AMOUNT,CREATED_ON,ACTIVE_STATUS,ID)"
			+ " VALUES " + "(?,?,?,?,SYSDATE(),?,?)";

	String BID_UPDATE = "";

	String BID_RETRIEVE = "SELECT" + "USER_ID,FROM_DATE,TO_DATE,BID_AMOUNT,CREATED_BY,CREATED_ON,ACTIVE_STATUS"
			+ "FROM BID " + "WHERE ID = ?";

	String BID_RETRIEVE_ALL = "SELECT" + "USER_ID,FROM_DATE,TO_DATE,BID_AMOUNT,CREATED_BY,CREATED_ON,ACTIVE_STATUS"
			+ "FROM BID " + "WHERE ID IS NOT NULL";

	// Queries from Abhishek
	// *********************************************************************************************************************************************

	String USER_INSERT = "INSERT INTO users"
			+ " (first_name, last_name, email, phone_number, user_id, password, gender, date_of_birth,"
			+ " status, created_by, created_time, modified_time)" + " VALUES "
			+ "(?,?,?,?,?,?,?,?,?,?,SYSDATE(),SYSDATE())";

	String USER_INFLUENCER = "INSERT INTO influencers"
			+ " (id, employee_id, date_of_birth, name, phone_number, email, status, facebook_id, twitter_id, instagram_id "
			+ " )" + " VALUES " + "(?,(SELECT user_id from users where user_id=?),?,?,?,?,?,?,?,?)";
	String USER_INSERT_ROLE = "INSERT INTO user_roles " + "(user_id, role_id) " + "VALUES" + "(?,?)";

	String USER_INSERT_PROFILE = "INSERT INTO PROFILES"
			+ "(ID,USER_ID,UPLOAD_IMAGE,PROFILE_IMAGE,BANNER_IMAGE,POSITION_HELD,STORE_NAME,CREATED_BY,CREATED_TIME,MODIFIED_TIME) "
			+ "VALUES" + "(?,?,?,?,?,?,?,?,SYSDATE(),SYSDATE())";

	String USER_UPDATE = "UPDATE users" + " SET " + "first_name=?, last_name=?, email=?,phone_number=?,"
			+ "date_of_birth=?,status=?,created_by=?,modified_time=SYSDATE() " + "WHERE user_id=?;";

	String USER_UPDATE_PASSWORD = "UPDATE users" + " SET " + "password=?" + "WHERE user_id=?;";

	String UPDATE_INFLUENCER = "UPDATE influencers" + " SET " + "name=?, phone_number=?, email=?,"
			+ "status=?,facebook_id=?, twitter_id=?, instagram_id=? " + "WHERE employee_id=?;";
	/*
	 * String USER_UPDATE = "UPDATE users" + " SET " +
	 * "first_name=?, last_name=?, email=?,phone_number=?,password=?," +
	 * "date_of_birth=?,status=?,created_by=?,last_modified_time=SYSDATE() " +
	 * "WHERE user_id=?;";
	 */

	String USER_UPDATE_PROFILE = "UPDATE profiles " + "SET "
			+ "banner_image=?, profile_image=?,store_name=?,position_held=?,modified_time=SYSDATE() "
			+ "WHERE user_id=?;";

	String USER_UPDATE_PROFILESTORE = "UPDATE profiles " + "SET " + "store_name=?,modified_time=SYSDATE() "
			+ "WHERE user_id=?;";

	String USER_UPDATE_ADDRESS = "UPDATE address set address_line1=?, city=?, state=?, zipcode=?, country=?, modified_time=SYSDATE() where user_id = ?";

	String USER_LOGIN = "SELECT U.FIRST_NAME,U.LAST_NAME,U.PASSWORD,UR.ROLE_ID,U.USER_ID, U.date_of_birth FROM users U "
			+ "JOIN user_roles UR ON (U.USER_ID= UR.USER_ID)" + "WHERE U.USER_ID=?";

	String USER_LOGIN_EMAIL = "SELECT U.FIRST_NAME,U.LAST_NAME,U.PASSWORD,UR.ROLE_ID,U.USER_ID, U.date_of_birth FROM users U "
			+ "JOIN user_roles UR ON (U.USER_ID= UR.USER_ID)" + "WHERE U.EMAIL=?";
	/*
	 * this is for merchant store name retrieving at the time of login String
	 * USER_LOGIN =
	 * "SELECT U.FIRST_NAME,U.LAST_NAME,U.PASSWORD,UR.ROLE_ID,U.USER_ID, P.STORE_NAME FROM USERS U "
	 * +
	 * ", USER_ROLES UR, PROFILES P WHERE U.USER_ID=? and U.USER_ID= UR.USER_ID and U.USER_ID= P.USER_ID "
	 * ;
	 * 
	 * String USER_LOGIN_EMAIL =
	 * "SELECT U.FIRST_NAME,U.LAST_NAME,U.PASSWORD,UR.ROLE_ID,U.USER_ID, P.STORE_NAME FROM USERS U "
	 * +
	 * ", USER_ROLES UR, PROFILES P  WHERE U.EMAIL=? and  U.USER_ID= UR.USER_ID and U.USER_ID= P.USER_ID "
	 * ;
	 */

	String USER_SETTINGS = "SELECT " + "first_name, last_name, email, phone_number, date_of_birth " + "from "
			+ "users where user_id = ?";

	String USERS_ALL = "SELECT u.first_name firstName, u.last_name lastName, u.email eMail, u.phone_number phoneNumber, r.role_id roleID, u.status status, u.user_id userId, u.created_by createdBy, u.created_time createdTime from users u, user_roles r where u.user_id=r.user_id";
	String ADMIN_PASSWORD_SETTINGS = "UPDATE users" + "SET" + "password=?" + " where user_id = ?";
	/* "first_name=?, last_name=?, phone_number=?, date_of_birth=?, */
	/*
	 * String MERCHANT_DATA =
	 * "SELECT first_name, last_name, email, phone_number,user_id from users where user_id = ?"
	 * ;
	 */
	String MERCHANT_DATA = "select u.first_name firstName, u.last_name lastName, u.user_id userID, u.email eMail, u.phone_number phoneNumber,u.date_of_birth,a.state state, a.address_line1 address, a.city city, a.zipcode zip, a.country country, p.store_name storeName,p.position_held from users u join address a ON(u.user_id=a.user_id) join profiles p ON(a.user_id=p.user_id) where u.user_id=?";
	String INFLUENCER_DATA = "SELECT u.first_name firstName,u.last_name lastName,u.user_id userId,u.email eMail,u.phone_number phoneNumber,u.date_of_birth,i.facebook_id facebook,i.twitter_id twitter,i.instagram_id instagram, p.profile_image profileImage from users u, influencers i, profiles p where i.employee_id = u.user_id and u.user_id = p.user_id and u.user_id=?";

	String MERCHANT_STORE_NAME = "select store_name from profiles where user_id= ?";

	String MERCHANTS_ALL = "SELECT U.FIRST_NAME,U.LAST_NAME,U.CREATED_BY,U.CREATED_TIME,U.STATUS,U.USER_ID,u.email eMail FROM USERS U "
			+ "JOIN user_roles UR ON(U.USER_ID = UR.USER_ID)" + "WHERE U.USER_ID IS NOT NULL AND UR.ROLE_ID = ?";

	String CART_INSERT = "INSERT INTO cart (id, user_id, total_amount, created_time, modified_time) VALUES(?,?,?,SYSDATE(),SYSDATE())";
	String CART_DETAILS_INSERT = "INSERT INTO cart_details(id,cart_id,product_id,quantity,date_added)  VALUES (?,?,?,?,SYSDATE())";
	String CART_DETAILS_DELETE = "DELETE from trendsetr.cart_details where id = ?;";
	String CART_UPDATE_SELECT = "SELECT id FROM trendsetr.cart_details WHERE cart_id=?";
	String CART_UPDATE = "UPDATE cart_details cd SET cd.quantity = ? WHERE cd.id = ?;";
	String CART_PRODUCT_PRICE = "SELECT price FOM trendsetr.product_variant tp WHERE tp.product_id =?";
	String CART_DETAILS_UPDATE = "UPDATE trendsetr.cart_details cd SET quantity = ?, date_added = SYSDATE() WHERE cd.id = ? AND cd.product_id=?";
	String CART_SELECT = "SELECT id, total_amount FROM cart WHERE user_id = ?";

	String CART_DETAILS_SELECT = "select p.name, cd.quantity, pv.price, pi.image,pv.product_id, m.store_name, m.profile_image from cart c "
			+ "JOIN cart_details cd ON (c.id=cd.cart_id) " + "JOIN products p ON (cd.product_id=p.id) "
			+ "JOIN product_variant pv " + "ON  " + "(p.id=pv.product_id) " + "JOIN product_images pi " + "ON "
			+ "(p.id=pi.product_id) " + "JOIN merchant_products mp " + "ON " + "(p.id=mp.product_id) "
			+ "JOIN merchants m " + "ON " + "(mp.merchant_id=m.id) where c.user_id= ?";

	String NOTIFICATION_SETTINGS = "INSERT INTO merhcant_notification_settings"
			+ "(MERCHANT_ID, DAILY_PERFORMANCE, ACCOUNT_CHANGES, TRENDSETR_PROMOS, CUSTOMER_DIRECT_MESSAGES )"
			+ " VALUES " + "(?,?,?,?,?)";

	String NOTIFICATION_DATA = "select DAILY_PERFORMANCE, ACCOUNT_CHANGES, TRENDSETR_PROMOS, CUSTOMER_DIRECT_MESSAGES from merhcant_notification_settings where MERCHANT_ID = ?";

	String NOTIFICATION_MERCHANT = "select count(*) from merhcant_notification_settings where MERCHANT_ID = ?";

	String NOTIFICATION_UPDATE_SETTINGS = "UPDATE merhcant_notification_settings set DAILY_PERFORMANCE = ?, ACCOUNT_CHANGES = ?, TRENDSETR_PROMOS = ?, CUSTOMER_DIRECT_MESSAGES = ? where MERCHANT_ID = ?";

//	String ORDERS_LIST = "SELECT m.id as MID,ord.id orderid, O.ID as OID, P.NAME as PNAME, O.PRODUCT_PRICE as OPRICE, O.CREATED_TIME as OCD, O.ORDER_STATUS AS OS FROM merchants M, PRODUCTS P, ORDER_ITEMS O, ORDERS ord WHERE O.PRODUCT_ID = P.ID and ord.id = o.order_id and P.CREATED_BY = ? and M.user_id=?";
	String ORDERS_LIST ="SELECT DISTINCT ord.id as OID, m.id as MID FROM merchants M, PRODUCTS P,order_items o, ORDERS ord WHERE ord.id = o.order_id and p.id= o.product_id and P.CREATED_BY = ? and M.user_id=?";
	String ORDER_DATA = "select a.address_line1 as Line1,a.address_line2 as Line2,a.city as city,a.state as state,a.zipcode as zip,a.country as country,a.phone_number as phone,oi.quantity quantity, oi.quantity_price quantityprice, p.name productname, pi.image image, pv.id variantid, u.first_name firstname, u.last_name lastname, pv.sku_id skuid, prof.profile_image as profileImage from trendsetr.order_items oi, trendsetr.orders o, trendsetr.address a, trendsetr.products p, trendsetr.product_images pi, trendsetr.product_variant pv, trendsetr.users u , trendsetr.profiles prof where oi.order_id=o.id and oi.order_status='2' and o.address_id = a.id and oi.product_id= p.id and p.id=pi.product_id and pi.type='primery' and oi.product_variant_id=pv.id and o.user_id=u.user_id and a.id = o.address_id and u.user_id= prof.user_id and o.id = ?";
	String ORDER_LIST = "SELECT O.ID as OID, P.NAME as PNAME, O.PRODUCT_PRICE as OPRICE, O.CREATED_TIME as OCD, O.ORDER_STATUS AS OS FROM  PRODUCTS P, ORDER_ITEMS O, Orders ord WHERE ord.id = o.order_id and O.PRODUCT_ID = P.ID and P.CREATED_BY = ? and ord.id =?";
}
