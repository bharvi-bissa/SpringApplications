/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */
package com.techaspect.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;
import java.sql.PreparedStatement;
import com.techaspect.entity.Product;
import com.techaspect.entity.Vendor;

import com.techaspect.dao.Dao;
import org.apache.log4j.Logger;

/**
 * The VendorDao class contains the database operations
 * related code.
 * 
 * This class belongs to Vendor Module. 
 * 
 * @author  Bharvi Bissa
 */


public class VendorDao extends Dao{
	
	private final static Logger LOGGER = Logger.getLogger(VendorDao.class);
	
	private static VendorDao vendorDao;
	
	private VendorDao(){
			System.out.println("VendorDao");
	}
	
	public static VendorDao getInstance() {
		if(vendorDao==null) {
			vendorDao=new VendorDao();
		}
		return vendorDao;
	}
	/**
     * Searches for a existing Vendor Record in the Table.
     * 
     * Searching is done on the basis of Email Address & Password.
     *
 	 * @param   vendor
     *          A vendor object containing data.
     *
     * @return  boolean
     * 		    true if matching record found otherwise else.
     */
	public boolean loginVendor(Vendor vendor) {
		LOGGER.debug("loginVendor execution started");
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			stmt = con.createStatement();
			
			String sql = "SELECT * from vendor_information WHERE vendor_email='"+vendor.getEmail()+"'AND vendor_password='"+vendor.getPassword()+"'";
			
			 rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				vendor.setName(rs.getString("vendor_name"));
				vendor.setEmail(rs.getString("vendor_email"));
				vendor.setId(rs.getInt("vendor_id"));
				status=true;
				
			}else {
				status= false;
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closeResultSet(rs);
			closeStatement(stmt);
			closeConnection(con);
		}
		LOGGER.debug("loginVendor execution ended");
		return status;
	}
	
	
	/**
     * Add product in the Table.
     *
 	 * @param   product
     *          A product object containing product data.
     *
     * @return  boolean
     * 		    true if product successfully inserted.
     */
	public boolean addProduct(Product product) {
		LOGGER.debug(" addProduct execution started");
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			stmt = con.createStatement();
			String sqlInsertProduct = "INSERT INTO product_information"
					+ "(vendor_id,product_name,product_price,product_quantity,product_description,product_image1,product_image2,"
					+ "product_image3,product_image4,product_image5,product_category,product_sub_category) VALUES"
					+ "('"+product.getVendorId()+"','"+product.getName()+"','"+product.getPrice()+"',"
							+ "'"+product.getQuantity()+"','"+product.getDescription()+"','"+product.getImage1()+"','"+product.getImage2()+"',"
									+ "'"+product.getImage3()+"','"+product.getImage4()+"','"+product.getImage5()+"','"+product.getCategory()+"','"+product.getSubcategory()+"')";
			int ifInserted = stmt.executeUpdate(sqlInsertProduct);
			if(ifInserted !=0){
				String pId = "SELECT MAX(product_id) FROM product_information";
				rs = stmt.executeQuery(pId);
				if(rs.next()) {
					int prodId = rs.getInt(1);
					boolean done = addDescriptionAndSpecs(prodId,product);
					if(done)
						status = true;
					else status = false;
				}		
			}else{
				status = false;
			}
	} catch(SQLException sqle) {
		LOGGER.error("Exception Occured.", sqle);
	} finally {
		closeResultSet(rs);
		closeStatement(stmt);
		closeConnection(con);
		}
		LOGGER.debug("addProduct execution ended");
		return status;
	}
	
	/**
     * Add product description and specification in the Table.
     *
 	 * @param   productId
 	 * 			int productId returned from the addProduct method.
 	 * 			product
     *          A product object containing product data.
     *
     * @return  boolean
     * 		    true if product successfully inserted.
     */
	
	public boolean addDescriptionAndSpecs(int prodId,Product product) {
		LOGGER.debug(" addDescriptionAndSpecs execution started");
		boolean status = false;
		Connection con = null;
		PreparedStatement pStmt = null;
		PreparedStatement pStmt2 = null;
		ResultSet rs = null;
		
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			String sqlDescription = "INSERT INTO product_description(pro_id,descp_1_title,descp_1_content,"
					+ "descp_2_title,descp_2_content,descp_3_title,descp_3_content,descp_4_title,descp_4_content,"
					+ "descp_5_title,descp_5_content,descp_6_title,descp_6_content,descp_7_title,descp_7_content,descp_8_title,descp_8_content,"
					+ "descp_9_title,descp_9_content,descp_10_title,descp_10_content) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pStmt = openPreparedStatement(con,sqlDescription);
			pStmt.setInt(1,prodId);
			pStmt.setString(2,product.getProductDescriptionTitle1());
			pStmt.setString(3, product.getProdouctDescription1());
			pStmt.setString(4,product.getProductDescriptionTitle2());
			pStmt.setString(5, product.getProdouctDescription2());
			pStmt.setString(6,product.getProductDescriptionTitle3());
			pStmt.setString(7, product.getProdouctDescription3());
			pStmt.setString(8,product.getProductDescriptionTitle4());
			pStmt.setString(9, product.getProdouctDescription4());
			pStmt.setString(10,product.getProductDescriptionTitle5());
			pStmt.setString(11, product.getProdouctDescription5());
			pStmt.setString(12,product.getProductDescriptionTitle6());
			pStmt.setString(13, product.getProdouctDescription6());
			pStmt.setString(14,product.getProductDescriptionTitle7());
			pStmt.setString(15, product.getProdouctDescription7());
			pStmt.setString(16,product.getProductDescriptionTitle8());
			pStmt.setString(17, product.getProdouctDescription8());
			pStmt.setString(18,product.getProductDescriptionTitle9());
			pStmt.setString(19, product.getProdouctDescription9());
			pStmt.setString(20,product.getProductDescriptionTitle10());
			pStmt.setString(21,product.getProdouctDescription10());
			
			String sqlSpecs = 
			"INSERT INTO product_specification(product_id,spec_in_the_box,spec_model_number,spec_model_name,spec_color,spec_browse_type,spec_sim_type,spec_touch_screen,"
			+ "spec_display_size,spec_resolution,spec_resolution_type,spec_display_type,spec_display_colors,"
			+ "spec_operating_system,spec_processor_type,spec_processor_core,spec_primary_clockspeed,"
			+ "spec_secondary_clockspeed,spec_operating_frequency,spec_internal_storage,spec_ram,"
			+ "spec_expandable_storage,spec_supported_memorycardtype,spec_calllog_memory,spec_primarycamera_available,"
			+ "spec_primarycamera,spec_primarycamera_features,spec_secondarycamera_available,spec_secondarycamera,"
			+ "spec_secondarycamera_features,spec_flash,spec_hdrecording,spec_full_hdrecording,spec_video_recording,"
			+ "spec_videorecording_resolution,spec_frame_rate,spec_phonebook,spec_network_type,spec_supported_networks,"
			+ "spec_internet_connectivity,spec_3g,spec_gprs,spec_preinstalled_browser,spec_bluetooth_support,"
			+ "spec_bluetooth_version,spec_wifi,spec_wifi_version,spec_nfc,spec_usb_connectivity,spec_audio_jack,"
			+ "spec_smart_phone,spec_sim_size,spec_removable_battery,spec_sms,spec_sensors,spec_other_features,"
			+ "spec_important_apps,spec_audio_formats,spec_video_formats,spec_battery_capacity,spec_battery_type,spec_width,spec_height,spec_depth,"
			+ "spec_weight,spec_warranty_summary) "
			+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pStmt2 = openPreparedStatement(con,sqlSpecs);
			pStmt2.setInt(1, prodId);
			pStmt2.setString(2,product.getBox());
			pStmt2.setString(3,product.getModelNumber());
			pStmt2.setString(4,product.getName());
			pStmt2.setString(5, product.getModelColor());
			pStmt2.setString(6, product.getBrowseType());
			pStmt2.setString(7, product.getSimType());
			
			pStmt2.setString(8, product.getTouchScreen());
			pStmt2.setString(9, product.getDisplaySize());
			pStmt2.setString(10, product.getResolution());
			pStmt2.setString(11, product.getResoType());
			pStmt2.setString(12, product.getDisplayType());
			pStmt2.setString(13,product.getDisplayColors());
			
			pStmt2.setString(14, product.getOs());
			pStmt2.setString(15, product.getProcessorType());
			pStmt2.setString(16, product.getProcessorCore());
			pStmt2.setString(17, product.getpClockspeed());
			pStmt2.setString(18, product.getsClockspeed());
			pStmt2.setString(19, product.getOpFreq());
			
			pStmt2.setString(20,product.getInternalStorage());
			pStmt2.setString(21, product.getRam());
			pStmt2.setString(22, product.getExpStorage());
			pStmt2.setString(23, product.getSuppMemCardType());
			pStmt2.setString(24, product.getCallLogMemory());
			pStmt2.setString(25, product.getpCameraAvailable());
			pStmt2.setString(26, product.getpCamera());
			pStmt2.setString(27, product.getpCameraFeatures());
			pStmt2.setString(28, product.getsCameraAvail());
			pStmt2.setString(29, product.getsCamera());
			pStmt2.setString(30, product.getsCameraFeatures());
			pStmt2.setString(31, product.getFlash());
			pStmt2.setString(32, product.getHdRecording());
			pStmt2.setString(33, product.getFhdRecording());
			pStmt2.setString(34, product.getvRecording());
			pStmt2.setString(35, product.getVrResolution());
			pStmt2.setString(36, product.getFrameRate());
			pStmt2.setString(37, product.getPhoneBook());
			pStmt2.setString(38, product.getNetworkType());
			pStmt2.setString(39, product.getSuppNetworks());
			pStmt2.setString(40,product.getiConn());
			pStmt2.setString(41, product.getThreeG());
			pStmt2.setString(42, product.getGprs());
			pStmt2.setString(43, product.getPreInstalledBrowser());
			pStmt2.setString(44, product.getBluetoothSupp());
			pStmt2.setString(45, product.getBluetoothVer());
			pStmt2.setString(46, product.getWifi());
			pStmt2.setString(47, product.getWifiVer());
			pStmt2.setString(48, product.getUsbConn());
			pStmt2.setString(49, product.getAudioJack());
			pStmt2.setString(50, product.getNfc());
			pStmt2.setString(51, product.getSmartPhone());
			pStmt2.setString(52, product.getSimSize());
			pStmt2.setString(53, product.getRemoBattery());
			pStmt2.setString(54, product.getSms());
			pStmt2.setString(55, product.getSensors());
			pStmt2.setString(56, product.getOtherFeatures());
			pStmt2.setString(57, product.getImpApps());
			pStmt2.setString(58, product.getAudioFormats());
			pStmt2.setString(59, product.getVideoFormats());
			pStmt2.setString(60, product.getBattCapacity());
			pStmt2.setString(61, product.getBattType());
			pStmt2.setString(62, product.getWidth());
			pStmt2.setString(63, product.getHeight());
			pStmt2.setString(64, product.getDepth());
			pStmt2.setString(65, product.getWeight());
			pStmt2.setString(66, product.getWarrantySum());
		
			int row1 = pStmt.executeUpdate();
			int row2 = pStmt2.executeUpdate();
			
			if(row1 !=0 && row2!=0) {
				return true;
			}else {
				return false;
			}
			
		}catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closePreparedStatement(pStmt2);
			closePreparedStatement(pStmt);
			closeResultSet(rs);
			closeConnection(con);
		}
		LOGGER.debug("addDescriptionAndSpecs execution ended");
		return status;
		
	}
	
	
	/**
     * Retrieves all the products on the basis of vendorId.
     *
     *@return   List
     * 			List of all the products of vendor.
     */
	public List<Product> displayAllProducts(int id) {
		LOGGER.debug(" displayAllProducts execution started");
		ArrayList<Product> productList = new ArrayList<>();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			stmt = con.createStatement();
			String sql = "SELECT product_specification.product_id,product_information.vendor_id,product_name,product_description,product_price,product_quantity,product_category,product_sub_category,product_image1,product_image2,product_image3,product_image4,product_image5,spec_in_the_box,spec_id,spec_model_number,spec_model_name,spec_color,spec_browse_type,descp_1_title,descp_2_title,descp_3_title,descp_4_title,descp_5_title,spec_sim_type,spec_touch_screen,spec_display_size,spec_resolution,spec_resolution_type,descp_6_title,descp_7_title,descp_8_title,descp_9_title,descp_10_title,spec_display_type,spec_display_colors,spec_operating_system,spec_processor_type,spec_processor_core,descp_6_content,descp_7_content,descp_8_content,descp_9_content,descp_10_content,spec_primary_clockspeed,spec_secondary_clockspeed,spec_operating_frequency,spec_internal_storage,spec_ram,spec_expandable_storage,spec_supported_memorycardtype,spec_calllog_memory,spec_primarycamera_available,descp_1_content,descp_2_content,descp_3_content,descp_4_content,descp_5_content,spec_primarycamera,spec_primarycamera_features,spec_secondarycamera_available,spec_secondarycamera,spec_secondarycamera_features,spec_flash,spec_hdrecording,spec_full_hdrecording,spec_video_recording,spec_videorecording_resolution,spec_frame_rate,spec_phonebook,spec_network_type,spec_supported_networks,spec_internet_connectivity,spec_3g,spec_gprs,spec_preinstalled_browser,spec_bluetooth_support,spec_bluetooth_version,spec_wifi,spec_wifi_version,spec_nfc,spec_usb_connectivity,spec_audio_jack,spec_smart_phone,spec_sim_size,spec_removable_battery,spec_sms,spec_sensors,spec_other_features,spec_important_apps,spec_audio_formats,spec_video_formats,spec_battery_capacity,spec_battery_type,spec_width,spec_height,spec_depth,spec_weight,spec_warranty_summary"+
					" from product_information,product_description,product_specification"+ 
					" WHERE"+
					" product_information.product_id=product_description.pro_id AND "+
					" product_information.product_id=product_specification.product_id"+ 
					" AND product_information.vendor_id="+id;
			
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt(1));
				product.setName(rs.getString("product_name"));
				product.setDescription(rs.getString("product_description"));
				product.setQuantity(rs.getString("product_quantity"));
				product.setPrice(rs.getString("product_price"));
				product.setVendorId(rs.getInt("vendor_id"));
				product.setCategory(rs.getString("product_category"));
				product.setSubcategory(rs.getString("product_sub_category"));
				product.setImage1(rs.getString("product_image1"));
				product.setImage2(rs.getString("product_image2"));
				product.setImage3(rs.getString("product_image3"));
				product.setImage4(rs.getString("product_image4"));
				product.setImage5(rs.getString("product_image5"));
				
				product.setProdouctDescription1(rs.getString("descp_1_content"));
				product.setProdouctDescription2(rs.getString("descp_2_content"));
				product.setProdouctDescription3(rs.getString("descp_3_content"));
				product.setProdouctDescription4(rs.getString("descp_4_content"));
				product.setProdouctDescription5(rs.getString("descp_5_content"));
				product.setProdouctDescription6(rs.getString("descp_6_content"));
				product.setProdouctDescription7(rs.getString("descp_7_content"));
				product.setProdouctDescription8(rs.getString("descp_8_content"));
				product.setProdouctDescription9(rs.getString("descp_9_content"));
				product.setProdouctDescription10(rs.getString("descp_10_content"));
				product.setProductDescriptionTitle1(rs.getString("descp_1_title"));
				product.setProductDescriptionTitle2(rs.getString("descp_2_title"));
				product.setProductDescriptionTitle3(rs.getString("descp_3_title"));
				product.setProductDescriptionTitle4(rs.getString("descp_4_title"));
				product.setProductDescriptionTitle5(rs.getString("descp_5_title"));
				product.setProductDescriptionTitle6(rs.getString("descp_6_title"));
				product.setProductDescriptionTitle7(rs.getString("descp_7_title"));
				product.setProductDescriptionTitle8(rs.getString("descp_8_title"));
				product.setProductDescriptionTitle9(rs.getString("descp_9_title"));
				product.setProductDescriptionTitle10(rs.getString("descp_10_title"));
				
				product.setBox(rs.getString("spec_in_the_box"));
				product.setModelColor(rs.getString("spec_color"));
				product.setModelNumber(rs.getString("spec_model_number"));
				product.setModelName(rs.getString("spec_model_name"));
				product.setBrowseType(rs.getString("spec_browse_type"));
				product.setSimType(rs.getString("spec_sim_type"));
				product.setTouchScreen(rs.getString("spec_touch_screen"));
				
				product.setDisplaySize(rs.getString("spec_display_size"));
				product.setResolution(rs.getString("spec_resolution"));
				product.setResoType(rs.getString("spec_resolution_type"));
				product.setDisplayType(rs.getString("spec_display_type"));
				product.setDisplayColors(rs.getString("spec_display_colors"));
				
				product.setOs(rs.getString("spec_operating_system"));
				product.setProcessorType(rs.getString("spec_processor_type"));
				product.setProcessorCore(rs.getString("spec_processor_core"));
				product.setpClockspeed(rs.getString("spec_primary_clockspeed"));
				product.setsClockspeed(rs.getString("spec_secondary_clockspeed"));
				product.setOpFreq(rs.getString("spec_operating_frequency"));
				
				product.setInternalStorage(rs.getString("spec_internal_storage"));
				product.setRam(rs.getString("spec_ram"));
				product.setExpStorage(rs.getString("spec_expandable_storage"));
				product.setSuppMemCardType(rs.getString("spec_supported_memorycardtype"));
				product.setCallLogMemory(rs.getString("spec_calllog_memory"));
				
				product.setpCameraAvailable(rs.getString("spec_primarycamera_available"));
				product.setpCamera(rs.getString("spec_primarycamera"));
				product.setpCameraFeatures(rs.getString("spec_primarycamera_features"));
				product.setsCamera(rs.getString("spec_secondarycamera_available"));
				product.setsCameraAvail(rs.getString("spec_secondarycamera"));
				product.setsCameraFeatures(rs.getString("spec_secondarycamera_features"));
				product.setFlash(rs.getString("spec_flash"));
				product.setFhdRecording(rs.getString("spec_full_hdrecording"));
				product.setHdRecording(rs.getString("spec_hdrecording"));
				product.setvRecording(rs.getString("spec_video_recording"));
				product.setVrResolution(rs.getString("spec_videorecording_resolution"));
				product.setFrameRate(rs.getString("spec_frame_rate"));
				
				product.setPhoneBook(rs.getString("spec_phonebook")); 
				
				product.setNetworkType(rs.getString("spec_network_type"));
				product.setSuppNetworks(rs.getString("spec_supported_networks"));
				product.setThreeG(rs.getString("spec_3g"));
				product.setGprs(rs.getString("spec_gprs"));
				product.setPreInstalledBrowser(rs.getString("spec_preinstalled_browser"));
				product.setBluetoothSupp(rs.getString("spec_bluetooth_support"));
				product.setBluetoothVer(rs.getString("spec_bluetooth_version"));
				product.setWifi(rs.getString("spec_wifi"));
				product.setWifiVer(rs.getString("spec_wifi_version"));
				product.setiConn(rs.getString("spec_internet_connectivity"));
				product.setNfc(rs.getString("spec_nfc"));
				product.setUsbConn(rs.getString("spec_usb_connectivity"));
				product.setAudioJack(rs.getString("spec_audio_jack"));
				
				product.setSmartPhone(rs.getString("spec_smart_phone"));
				product.setSimSize(rs.getString("spec_sim_size"));
				product.setRemoBattery(rs.getString("spec_removable_battery"));
				product.setSms(rs.getString("spec_sms"));
				product.setSensors(rs.getString("spec_sensors"));
				product.setOtherFeatures(rs.getString("spec_other_features"));
				product.setImpApps(rs.getString("spec_important_apps"));
				
				product.setAudioFormats(rs.getString("spec_audio_formats"));
				product.setVideoFormats(rs.getString("spec_video_formats"));
				
				product.setBattCapacity(rs.getString("spec_battery_capacity"));
				product.setBattType(rs.getString("spec_battery_type"));
				
				product.setWidth(rs.getString("spec_width"));
				product.setHeight(rs.getString("spec_height"));
				product.setDepth(rs.getString("spec_depth"));
				product.setWeight(rs.getString("spec_weight"));
				
				product.setWarrantySum(rs.getString("spec_warranty_summary"));
				
				productList.add(product);
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closeResultSet(rs);
			closeStatement(stmt);
			closeConnection(con);
		}
		LOGGER.debug(" displayAllProducts execution ended");
		return productList;
	}
	
	/**
	 * delete product from the product table on the basis of id
	 * 
	 * @param product
	 * 			product object containing the product data including its id
	 * @return	true
	 * 				if product is deleted successfully from the products table else otherwise
	 * 		
	 */
	public boolean deleteProduct(Product product) {
		LOGGER.debug("deleteProduct execution started");
		boolean status = false;
		Connection con = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			String sql = "DELETE FROM product_information WHERE product_id=?";
			
			pStmt = openPreparedStatement(con,sql);
			pStmt.setInt(1,product.getId());
			pStmt.executeUpdate();
		
		}catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closePreparedStatement(pStmt);
			closeResultSet(rs);
			closeConnection(con);
		}
		LOGGER.debug("deleteProduct execution ended");
		return status;
	}
	
	
	/**
     * Edit product information,description and specification in the Table.
     *
 	 * @param   product
     *          A product object containing product data.
 	 * 
 	 * 			productId
 	 * 			int productId having id of the product.
 	 * 			
     *
     * @return  boolean
     * 		    true if product successfully edited.
     */
	public boolean editProduct(Product product,int id) {
		LOGGER.debug(" editProduct execution started");
		Connection con = null;
		PreparedStatement pStmt1 = null;
		PreparedStatement pStmt2 = null;
		PreparedStatement pStmt3 = null;

		boolean status = false;
		
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			String sql1="UPDATE product_information SET product_name=?,product_price=?,product_quantity=?,product_description=?,product_category=?,product_sub_category=?,product_image1=?,product_image2=?,product_image3=?,product_image4=?,product_image5=? WHERE product_id=?";
			
			pStmt1 = openPreparedStatement(con,sql1);
			
			pStmt1.setString(1, product.getName());
			pStmt1.setString(2, product.getPrice());
			pStmt1.setString(3,product.getQuantity());
			pStmt1.setString(4, product.getDescription());
			pStmt1.setString(5,product.getCategory());
			pStmt1.setString(6, product.getSubcategory());
			pStmt1.setString(7, product.getImage1());
			pStmt1.setString(8, product.getImage2());
			pStmt1.setString(9, product.getImage3());
			pStmt1.setString(10, product.getImage4());
			pStmt1.setString(11, product.getImage5());
			pStmt1.setInt(12, id);
			
			String sql2 = "UPDATE product_description SET descp_1_title=?,descp_1_content=?,descp_2_title=?,descp_2_content=?,descp_3_title=?,descp_3_content=?,"
					+ "descp_4_title=?,descp_4_content=?,descp_5_title=?,descp_5_content=?,descp_6_title=?,descp_6_content=?,descp_7_title=?,descp_7_content=?,"
					+ "descp_8_title=?,descp_8_content=?,descp_9_title=?,descp_9_content=?,descp_10_title=?,descp_10_content=? WHERE pro_id=?";
			
			pStmt2 = openPreparedStatement(con,sql2);
			
			pStmt2.setString(1,product.getProductDescriptionTitle1());
			pStmt2.setString(2, product.getProdouctDescription1());
			pStmt2.setString(3,product.getProductDescriptionTitle2());
			pStmt2.setString(4, product.getProdouctDescription2());
			pStmt2.setString(5,product.getProductDescriptionTitle3());
			pStmt2.setString(6, product.getProdouctDescription3());
			pStmt2.setString(7,product.getProductDescriptionTitle4());
			pStmt2.setString(8, product.getProdouctDescription4());
			pStmt2.setString(9,product.getProductDescriptionTitle5());
			pStmt2.setString(10, product.getProdouctDescription5());
			pStmt2.setString(11,product.getProductDescriptionTitle6());
			pStmt2.setString(12, product.getProdouctDescription6());
			pStmt2.setString(13,product.getProductDescriptionTitle7());
			pStmt2.setString(14, product.getProdouctDescription7());
			pStmt2.setString(15,product.getProductDescriptionTitle8());
			pStmt2.setString(16, product.getProdouctDescription8());
			pStmt2.setString(17,product.getProductDescriptionTitle9());
			pStmt2.setString(18, product.getProdouctDescription9());
			pStmt2.setString(19,product.getProductDescriptionTitle10());
			pStmt2.setString(20,product.getProdouctDescription10());
			pStmt2.setInt(21, id);
			
			String sql3 ="UPDATE product_specification SET spec_in_the_box=?,spec_model_number=?,spec_model_name=?,spec_color=?,spec_browse_type=?,spec_sim_type=?,spec_touch_screen=?,"
					+ "spec_display_size=?,spec_resolution=?,spec_resolution_type=?,spec_display_type=?,spec_display_colors=?,"
					+ "spec_operating_system=?,spec_processor_type=?,spec_processor_core=?,spec_primary_clockspeed=?,"
					+ "spec_secondary_clockspeed=?,spec_operating_frequency=?,spec_internal_storage=?,spec_ram=?,"
					+ "spec_expandable_storage=?,spec_supported_memorycardtype=?,spec_calllog_memory=?,spec_primarycamera_available=?,"
					+ "spec_primarycamera=?,spec_primarycamera_features=?,spec_secondarycamera_available=?,spec_secondarycamera=?,"
					+ "spec_secondarycamera_features=?,spec_flash=?,spec_hdrecording=?,spec_full_hdrecording=?,spec_video_recording=?,"
					+ "spec_videorecording_resolution=?,spec_frame_rate=?,spec_phonebook=?,spec_network_type=?,spec_supported_networks=?,"
					+ "spec_internet_connectivity=?,spec_3g=?,spec_gprs=?,spec_preinstalled_browser=?,spec_bluetooth_support=?,"
					+ "spec_bluetooth_version=?,spec_wifi=?,spec_wifi_version=?,spec_nfc=?,spec_usb_connectivity=?,spec_audio_jack=?,"
					+ "spec_smart_phone=?,spec_sim_size=?,spec_removable_battery=?,spec_sms=?,spec_sensors=?,spec_other_features=?,"
					+ "spec_important_apps=?,spec_audio_formats=?,spec_video_formats=?,spec_battery_capacity=?,spec_battery_type=?,spec_width=?,spec_height=?,spec_depth=?,"
					+ "spec_weight=?,spec_warranty_summary=? WHERE product_id=?";
			
			pStmt3 = openPreparedStatement(con,sql3);
			
			pStmt3.setString(1,product.getBox());
			pStmt3.setString(2,product.getModelNumber());
			pStmt3.setString(3,product.getModelName());
			pStmt3.setString(4, product.getModelColor());
			pStmt3.setString(5, product.getBrowseType());
			pStmt3.setString(6, product.getSimType());
			
			pStmt3.setString(7, product.getTouchScreen());
			pStmt3.setString(8, product.getDisplaySize());
			pStmt3.setString(9, product.getResolution());
			pStmt3.setString(10, product.getResoType());
			pStmt3.setString(11, product.getDisplayType());
			pStmt3.setString(12,product.getDisplayColors());
			
			pStmt3.setString(13, product.getOs());
			pStmt3.setString(14, product.getProcessorType());
			pStmt3.setString(15, product.getProcessorCore());
			pStmt3.setString(16, product.getpClockspeed());
			pStmt3.setString(17, product.getsClockspeed());
			pStmt3.setString(18, product.getOpFreq());
			
			pStmt3.setString(19,product.getInternalStorage());
			pStmt3.setString(20, product.getRam());
			pStmt3.setString(21, product.getExpStorage());
			pStmt3.setString(22, product.getSuppMemCardType());
			pStmt3.setString(23, product.getCallLogMemory());
			pStmt3.setString(24, product.getpCameraAvailable());
			pStmt3.setString(25, product.getpCamera());
			pStmt3.setString(26, product.getpCameraFeatures());
			pStmt3.setString(27, product.getsCameraAvail());
			pStmt3.setString(28, product.getsCamera());
			pStmt3.setString(29, product.getsCameraFeatures());
			pStmt3.setString(30, product.getFlash());
			pStmt3.setString(31, product.getHdRecording());
			pStmt3.setString(32, product.getFhdRecording());
			pStmt3.setString(33, product.getvRecording());
			pStmt3.setString(34, product.getVrResolution());
			pStmt3.setString(35, product.getFrameRate());
			pStmt3.setString(36, product.getPhoneBook());
			pStmt3.setString(37, product.getNetworkType());
			pStmt3.setString(38, product.getSuppNetworks());
			pStmt3.setString(39,product.getiConn());
			pStmt3.setString(40, product.getThreeG());
			pStmt3.setString(41, product.getGprs());
			pStmt3.setString(42, product.getPreInstalledBrowser());
			pStmt3.setString(43, product.getBluetoothSupp());
			pStmt3.setString(44, product.getBluetoothVer());
			pStmt3.setString(45, product.getWifi());
			pStmt3.setString(46, product.getWifiVer());
			pStmt3.setString(47, product.getUsbConn());
			pStmt3.setString(48, product.getAudioJack());
			pStmt3.setString(49, product.getNfc());
			pStmt3.setString(50, product.getSmartPhone());
			pStmt3.setString(51, product.getSimSize());
			pStmt3.setString(52, product.getRemoBattery());
			pStmt3.setString(53, product.getSms());
			pStmt3.setString(54, product.getSensors());
			pStmt3.setString(55, product.getOtherFeatures());
			pStmt3.setString(56, product.getImpApps());
			pStmt3.setString(57, product.getAudioFormats());
			pStmt3.setString(58, product.getVideoFormats());
			pStmt3.setString(59, product.getBattCapacity());
			pStmt3.setString(60, product.getBattType());
			pStmt3.setString(61, product.getWidth());
			pStmt3.setString(62, product.getHeight());
			pStmt3.setString(63, product.getDepth());
			pStmt3.setString(64, product.getWeight());
			pStmt3.setString(65, product.getWarrantySum());
			pStmt3.setInt(66, id);
			
			
			int row1 = pStmt1.executeUpdate();
			int row2 = pStmt2.executeUpdate();
			int row3 = pStmt3.executeUpdate();
			
			if(row1 !=0 && row2 !=0 && row3!=0) {
				status = true;
			}
		} catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closeStatement(pStmt3);
			closeStatement(pStmt2);
			closeStatement(pStmt1);
			closeConnection(con);
		}
		LOGGER.debug(" editProduct execution ended");
		return status;
	}
}

