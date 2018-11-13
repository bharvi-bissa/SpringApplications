package com.tadigital.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.tadigital.mvc.entity.Product;
import com.tadigital.mvc.entity.Vendor;

@Repository
public class ProductDaoImpl implements ProductDao {

	private final static Logger LOGGER = Logger.getLogger(ProductDaoImpl.class);
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setJdbcTemplate(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<Product> loadProductsAction() {
		LOGGER.debug("getAllProducts execution started");
		String sql = "SELECT product_specification.product_id,product_information.vendor_id,product_name,product_description,product_price,product_quantity,product_category,product_sub_category,product_image1,product_image2,product_image3,product_image4,product_image5,spec_in_the_box,spec_id,spec_model_number,spec_model_name,spec_color,spec_browse_type,descp_1_title,descp_2_title,descp_3_title,descp_4_title,descp_5_title,spec_sim_type,spec_touch_screen,spec_display_size,spec_resolution,spec_resolution_type,descp_6_title,descp_7_title,descp_8_title,descp_9_title,descp_10_title,spec_display_type,spec_display_colors,spec_operating_system,spec_processor_type,spec_processor_core,descp_6_content,descp_7_content,descp_8_content,descp_9_content,descp_10_content,spec_primary_clockspeed,spec_secondary_clockspeed,spec_operating_frequency,spec_internal_storage,spec_ram,spec_expandable_storage,spec_supported_memorycardtype,spec_calllog_memory,spec_primarycamera_available,descp_1_content,descp_2_content,descp_3_content,descp_4_content,descp_5_content,spec_primarycamera,spec_primarycamera_features,spec_secondarycamera_available,spec_secondarycamera,spec_secondarycamera_features,spec_flash,spec_hdrecording,spec_full_hdrecording,spec_video_recording,spec_videorecording_resolution,spec_frame_rate,spec_phonebook,spec_network_type,spec_supported_networks,spec_internet_connectivity,spec_3g,spec_gprs,spec_preinstalled_browser,spec_bluetooth_support,spec_bluetooth_version,spec_wifi,spec_wifi_version,spec_nfc,spec_usb_connectivity,spec_audio_jack,spec_smart_phone,spec_sim_size,spec_removable_battery,spec_sms,spec_sensors,spec_other_features,spec_important_apps,spec_audio_formats,spec_video_formats,spec_battery_capacity,spec_battery_type,spec_width,spec_height,spec_depth,spec_weight,spec_warranty_summary"+
				" from product_information,product_description,product_specification"+ 
				" WHERE"+
				" product_information.product_id=product_description.pro_id AND "+
				" product_information.product_id=product_specification.product_id";
		
		
		ArrayList<Product> productList = new ArrayList<>();
		Product product = jdbcTemplate.execute(sql,new PreparedStatementCallback<Product>() {
			@Override
			public Product doInPreparedStatement(PreparedStatement ps) throws SQLException, DataAccessException {
				ResultSet rs = ps.executeQuery();
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
				return null;
			}

		});
	
		LOGGER.debug("getAllProducts execution ended");
		return productList;
	}
}
