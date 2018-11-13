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

package com.techaspect.entity;

import java.io.Serializable;

/**
 * The Customer class represents a Customer Record.
 * It includes properties for storing data and methods for
 * retrieving & setting values in the properties.
 * 
 * @author  Bharvi Bissa
 */
public class Product implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** The value is used for int storage representing Products ID. */
	private int id;
	/** The value is used for string storage representing Products name. */
	private String name;
	/** The value is used for int storage representing vendor id. */
	private int vendorId;
	/** The value is used for string storage representing Products price. */
	private String price;
	/** The value is used for string storage representing Products quantity. */
	private String quantity;
	/** The value is used for string storage representing Products description. */
	private String description;
	/** The value is used for string storage representing Products category. */
	private String category;
	/** The value is used for string storage representing Products subcategory. */
	private String subcategory;
	/** The value is used for string storage representing Products image1. */
	private String image1;
	/** The value is used for string storage representing Products image2. */
	private String image2;
	/** The value is used for string storage representing Products image3. */
	private String image3;
	/** The value is used for string storage representing Products image4. */
	private String image4;
	/** The value is used for string storage representing Products image5. */
	private String image5;
	/** The value is used for int storage representing Products descriptionId. */
	private int descriptionId;
	/** The value is used for string storage representing Products description1. */
	private String prodouctDescription1;
	/** The value is used for string storage representing Products description2. */
	private String prodouctDescription2;
	/** The value is used for string storage representing Products description3. */
	private String prodouctDescription3;
	/** The value is used for string storage representing Products description4. */
	private String prodouctDescription4;
	/** The value is used for string storage representing Products description5. */
	private String prodouctDescription5;
	/** The value is used for string storage representing Products description6. */
	private String prodouctDescription6;
	/** The value is used for string storage representing Products description7. */
	private String prodouctDescription7;
	/** The value is used for string storage representing Products description8. */
	private String prodouctDescription8;
	/** The value is used for string storage representing Products description9. */
	private String prodouctDescription9;
	/** The value is used for string storage representing Products description10. */
	private String prodouctDescription10;
	/** The value is used for string storage representing Products description title 1 . */
	private String productDescriptionTitle1;
	/** The value is used for string storage representing Products description title 2 . */
	private String productDescriptionTitle2;
	/** The value is used for string storage representing Products description title 3 . */
	private String productDescriptionTitle3;
	/** The value is used for string storage representing Products description title 4 . */
	private String productDescriptionTitle4;
	/** The value is used for string storage representing Products description title 5 . */
	private String productDescriptionTitle5;
	/** The value is used for string storage representing Products description title 6 . */
	private String productDescriptionTitle6;
	/** The value is used for string storage representing Products description title 7 . */
	private String productDescriptionTitle7;
	/** The value is used for string storage representing Products description title 8 . */
	private String productDescriptionTitle8;
	/** The value is used for string storage representing Products description title 9 . */
	private String productDescriptionTitle9;
	/** The value is used for string storage representing Products description title 10 . */
	private String productDescriptionTitle10;
	/** The value is used for int storage representing Products specificationId . */
	private int specId;
	/** The value is used for String storage representing Products specification box. */
	private String box ;
	/** The value is used for String storage representing Products specification model number . */
	private String modelNumber ;
	/** The value is used for String storage representing Products specification model name . */
	private String modelName ;
	/** The value is used for String storage representing Products specification model color . */
	private String modelColor ;
	/** The value is used for String storage representing Products specification browser type . */
	private String browseType ;
	/** The value is used for String storage representing Products specification sim type . */
	private String simType ;
	
	/** The value is used for String storage representing Products specification touch screen . */
	private String touchScreen ;
	/** The value is used for String storage representing Products specification display size . */
	private String displaySize;
	/** The value is used for String storage representing Products specification resolution . */
	private String resolution;
	/** The value is used for String storage representing Products specification resolution type . */
	private String resoType;
	/** The value is used for String storage representing Products specification display type . */
	private String displayType;
	/** The value is used for String storage representing Products specification display colors . */
	private String displayColors;
	/** The value is used for String storage representing Products specification operating System . */
	private String os;
	/** The value is used for String storage representing Products specification processor type . */
	private String processorType;
	/** The value is used for String storage representing Products specification processor core type . */
	private String processorCore ;
	/** The value is used for String storage representing Products specification primary clock speed . */
	private String pClockspeed ;
	/** The value is used for String storage representing Products specification secondary clock speed . */
	private String sClockspeed ;
	/** The value is used for String storage representing Products specification operating frequency . */
	private String opFreq ;
	
	/** The value is used for String storage representing Products specification internal storage . */
	private String internalStorage ;
	/** The value is used for String storage representing Products specification RAM . */
	private String ram ;
	/** The value is used for String storage representing Products specification expandable storage . */
	private String expStorage ;
	/** The value is used for String storage representing Products specification supported memory card type. */
	private String suppMemCardType ;
	/** The value is used for String storage representing Products specification call log memory. */
	private String callLogMemory ;
	
	/** The value is used for String storage representing Products specification primary camera available . */
	private String pCameraAvailable;
	/** The value is used for String storage representing Products specification primary camera . */
	private String pCamera;
	/** The value is used for String storage representing Products specification primary camera features . */
	private String pCameraFeatures ;
	/** The value is used for String storage representing Products specification secondary camera available . */
	private String sCameraAvail ;
	/** The value is used for String storage representing Products specification secondary camera . */
	private String sCamera ;
	/** The value is used for String storage representing Products specification secondary camera features . */
	private String sCameraFeatures ;
	/** The value is used for String storage representing Products specification flash . */
	private String flash ;
	/** The value is used for String storage representing Products specification hdrecording . */
	private String hdRecording ;
	/** The value is used for String storage representing Products specification full hd recording . */
	private String fhdRecording ;
	/** The value is used for String storage representing Products specification video recording . */
	private String vRecording ;
	/** The value is used for String storage representing Products specification video recording resolution. */
	private String vrResolution ;
	/** The value is used for String storage representing Products specification frame rate . */
	private String frameRate ;
	
	/** The value is used for String storage representing Products specification phone book . */
	private String phoneBook ;
	/** The value is used for String storage representing Products specification network type . */
	private String networkType ;
	/** The value is used for String storage representing Products specification supported networks . */
	private String suppNetworks ;
	/** The value is used for String storage representing Products specification 3G . */
	private String threeG;
	/** The value is used for String storage representing Products specification GPRS . */
	private String gprs;
	/** The value is used for String storage representing Products specification pre installed browser . */
	private String preInstalledBrowser;
	
	/** The value is used for String storage representing Products specification bluetooth support . */
	private String bluetoothSupp;
	/** The value is used for String storage representing Products specification bluetooth version . */
	private String bluetoothVer ;
	/** The value is used for String storage representing Products specification wifi . */
	private String wifi ;
	/** The value is used for String storage representing Products specification internet connectivity . */
	private String iConn ;
	/** The value is used for String storage representing Products specification wifi version. */
	private String wifiVer ;
	/** The value is used for String storage representing Products specification NFC . */
	private String nfc ;
	/** The value is used for String storage representing Products specification USB connectivity. */
	private String usbConn;
	/** The value is used for String storage representing Products specification audio jack . */
	private String audioJack ;
	/** The value is used for String storage representing Products specification smart phone . */
	private String smartPhone;
	/** The value is used for String storage representing Products specification sim size . */
	private String simSize ;
	/** The value is used for String storage representing Products specification removable battery . */
	private String remoBattery ;
	/** The value is used for String storage representing Products specification sms . */
	private String sms ;
	/** The value is used for String storage representing Products specification sensors . */
	private String sensors ;
	/** The value is used for String storage representing Products specification other features . */
	private String otherFeatures;
	/** The value is used for String storage representing Products specification important apps . */
	private String impApps;
	/** The value is used for String storage representing Products specification audio formats . */
	private String audioFormats;
	/** The value is used for String storage representing Products specification video formats . */
	private String videoFormats ;
	/** The value is used for String storage representing Products specification battery capacity . */
	private String battCapacity ;
	/** The value is used for String storage representing Products specification battery type . */
	private String battType ;
	/** The value is used for String storage representing Products specification width . */
	private String width  ;
	/** The value is used for String storage representing Products specification height . */
	private String height ;
	/** The value is used for String storage representing Products specification depth . */
	private String depth; 
	/** The value is used for String storage representing Products specification weight . */
	private String weight ;
	/** The value is used for String storage representing Products specification warranty summary . */
	private String warrantySum ;
	
	/**
     * Retrieves the value of the property id.
     *
     * @return     A code int value.
     *             The ID of Product.
     */
	public int getId() {
		return id;
	}
	/**
     * Sets a value to the property id.
     *
     * @param      A int value.
     *              The ID of Product.
     */
	public void setId(int id) {
		this.id = id;
	}
	/**
	* Sets a value to the property name.
    *
    * @param      A string value.
    *             The Password of Product.
    */
	public String getName() {
		return name;
	}
	
	/**
	* Sets a value to the property name.
    *
    * @param      A string value.
    *             The Password of Product.
    */
	public void setName(String name) {
		this.name = name;
	}
	/**
	* Sets a value to the property price.
    *
    * @param      A string value.
    *             The price of Product.
    */
	public String getPrice() {
		return price;
	}
	/**
	* Sets a value to the property price.
    *
    * @param      A string value.
    *             The price of Product.
    */
	public void setPrice(String price) {
		this.price = price;
	}
	/**
	* retrieves a value to the property vendor id.
    *
    * @return      An int value.
    *             The vendorId of Product.
    */
	public int getVendorId() {
		return vendorId;
	}
	/**
	* Sets a value to the property vendor id.
    *
    * @param      An int value.
    *             The vendorId of Product.
    */
	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}
	/**
	* retrieves a value to the property quantity.
    *
    * @return      A string value.
    *             The quantity of Product.
    */
	public String getQuantity() {
		return quantity;
	}
	/**
	* Sets a value to the property product quantity.
    *
    * @param      A string value.
    *             The quantity of Product.
    */
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	/**
	* retrieves a value to the property description.
    *
    * @return      A string value.
    *             The description of Product.
    */
	public String getDescription() {
		return description;
	}
	/**
	* Sets a value to the property product description.
    *
    * @param      A string value.
    *             The description of Product.
    */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	* Sets a value to the property product image1.
    *
    * @param      A string value.
    *             The image1 of Product.
    */
	public String getImage1() {
		return image1;
	}
	/**
	* retrieves a value to the property description.
    *
    * @return      A string value.
    *             The description of Product.
    */
	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}
	/**
	* Sets a value to the property product image2.
    *
    * @param      A string value.
    *             The image2 of Product.
    */
	public void setImage2(String image2) {
		this.image2 = image2;
	}
	public String getImage3() {
		return image3;
	}
	/**
	* Sets a value to the property product image3.
    *
    * @param      A string value.
    *             The image3 of Product.
    */
	public void setImage3(String image3) {
		this.image3 = image3;
	}
	public String getImage4() {
		return image4;
	}
	/**
	* Sets a value to the property product image4.
    *
    * @param      A string value.
    *             The image4 of Product.
    */
	public void setImage4(String image4) {
		this.image4 = image4;
	}
	public String getImage5() {
		return image5;
	}
	/**
	* Sets a value to the property product image5.
    *
    * @param      A string value.
    *             The image5 of Product.
    */
	public void setImage5(String image5) {
		this.image5 = image5;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public int getDescriptionId() {
		return descriptionId;
	}
	public void setDescriptionId(int descriptionId) {
		this.descriptionId = descriptionId;
	}
	public String getProdouctDescription1() {
		return prodouctDescription1;
	}
	public void setProdouctDescription1(String prodouctDescription1) {
		this.prodouctDescription1 = prodouctDescription1;
	}
	public String getProdouctDescription2() {
		return prodouctDescription2;
	}
	public void setProdouctDescription2(String prodouctDescription2) {
		this.prodouctDescription2 = prodouctDescription2;
	}
	public String getProdouctDescription3() {
		return prodouctDescription3;
	}
	public void setProdouctDescription3(String prodouctDescription3) {
		this.prodouctDescription3 = prodouctDescription3;
	}
	public String getProdouctDescription4() {
		return prodouctDescription4;
	}
	public void setProdouctDescription4(String prodouctDescription4) {
		this.prodouctDescription4 = prodouctDescription4;
	}
	public String getProdouctDescription5() {
		return prodouctDescription5;
	}
	public void setProdouctDescription5(String prodouctDescription5) {
		this.prodouctDescription5 = prodouctDescription5;
	}
	public String getProdouctDescription6() {
		return prodouctDescription6;
	}
	public void setProdouctDescription6(String prodouctDescription6) {
		this.prodouctDescription6 = prodouctDescription6;
	}
	public String getProdouctDescription7() {
		return prodouctDescription7;
	}
	public void setProdouctDescription7(String prodouctDescription7) {
		this.prodouctDescription7 = prodouctDescription7;
	}
	public String getProdouctDescription8() {
		return prodouctDescription8;
	}
	public void setProdouctDescription8(String prodouctDescription8) {
		this.prodouctDescription8 = prodouctDescription8;
	}
	public String getProdouctDescription9() {
		return prodouctDescription9;
	}
	public void setProdouctDescription9(String prodouctDescription9) {
		this.prodouctDescription9 = prodouctDescription9;
	}
	public String getProdouctDescription10() {
		return prodouctDescription10;
	}
	public void setProdouctDescription10(String prodouctDescription10) {
		this.prodouctDescription10 = prodouctDescription10;
	}
	public String getProductDescriptionTitle1() {
		return productDescriptionTitle1;
	}
	public void setProductDescriptionTitle1(String productDescriptionTitle1) {
		this.productDescriptionTitle1 = productDescriptionTitle1;
	}
	public String getProductDescriptionTitle2() {
		return productDescriptionTitle2;
	}
	public void setProductDescriptionTitle2(String productDescriptionTitle2) {
		this.productDescriptionTitle2 = productDescriptionTitle2;
	}
	public String getProductDescriptionTitle3() {
		return productDescriptionTitle3;
	}
	public void setProductDescriptionTitle3(String productDescriptionTitle3) {
		this.productDescriptionTitle3 = productDescriptionTitle3;
	}
	public String getProductDescriptionTitle4() {
		return productDescriptionTitle4;
	}
	public void setProductDescriptionTitle4(String productDescriptionTitle4) {
		this.productDescriptionTitle4 = productDescriptionTitle4;
	}
	public String getProductDescriptionTitle5() {
		return productDescriptionTitle5;
	}
	public void setProductDescriptionTitle5(String productDescriptionTitle5) {
		this.productDescriptionTitle5 = productDescriptionTitle5;
	}
	public String getProductDescriptionTitle6() {
		return productDescriptionTitle6;
	}
	public void setProductDescriptionTitle6(String productDescriptionTitle6) {
		this.productDescriptionTitle6 = productDescriptionTitle6;
	}
	public String getProductDescriptionTitle7() {
		return productDescriptionTitle7;
	}
	public void setProductDescriptionTitle7(String productDescriptionTitle7) {
		this.productDescriptionTitle7 = productDescriptionTitle7;
	}
	public String getProductDescriptionTitle8() {
		return productDescriptionTitle8;
	}
	public void setProductDescriptionTitle8(String productDescriptionTitle8) {
		this.productDescriptionTitle8 = productDescriptionTitle8;
	}
	public String getProductDescriptionTitle9() {
		return productDescriptionTitle9;
	}
	public void setProductDescriptionTitle9(String productDescriptionTitle9) {
		this.productDescriptionTitle9 = productDescriptionTitle9;
	}
	public String getProductDescriptionTitle10() {
		return productDescriptionTitle10;
	}
	public void setProductDescriptionTitle10(String productDescriptionTitle10) {
		this.productDescriptionTitle10 = productDescriptionTitle10;
	}
	public int getSpecId() {
		return specId;
	}
	public void setSpecId(int specId) {
		this.specId = specId;
	}
	public String getBox() {
		return box;
	}
	public void setBox(String box) {
		this.box = box;
	}
	public String getModelNumber() {
		return modelNumber;
	}
	public void setModelNumber(String modelNumber) {
		this.modelNumber = modelNumber;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getModelColor() {
		return modelColor;
	}
	public void setModelColor(String modelColor) {
		this.modelColor = modelColor;
	}
	public String getBrowseType() {
		return browseType;
	}
	public void setBrowseType(String browseType) {
		this.browseType = browseType;
	}
	public String getSimType() {
		return simType;
	}
	public void setSimType(String simType) {
		this.simType = simType;
	}
	public String getTouchScreen() {
		return touchScreen;
	}
	public void setTouchScreen(String touchScreen) {
		this.touchScreen = touchScreen;
	}
	public String getDisplaySize() {
		return displaySize;
	}
	public void setDisplaySize(String displaySize) {
		this.displaySize = displaySize;
	}
	public String getResolution() {
		return resolution;
	}
	public void setResolution(String resolution) {
		this.resolution = resolution;
	}
	public String getResoType() {
		return resoType;
	}
	public void setResoType(String resoType) {
		this.resoType = resoType;
	}
	public String getDisplayType() {
		return displayType;
	}
	public void setDisplayType(String displayType) {
		this.displayType = displayType;
	}
	public String getDisplayColors() {
		return displayColors;
	}
	public void setDisplayColors(String displayColors) {
		this.displayColors = displayColors;
	}
	public String getOs() {
		return os;
	}
	public void setOs(String os) {
		this.os = os;
	}
	public String getProcessorCore() {
		return processorCore;
	}
	public void setProcessorCore(String processorCore) {
		this.processorCore = processorCore;
	}
	public String getpClockspeed() {
		return pClockspeed;
	}
	public void setpClockspeed(String pClockspeed) {
		this.pClockspeed = pClockspeed;
	}
	public String getsClockspeed() {
		return sClockspeed;
	}
	public void setsClockspeed(String sClockspeed) {
		this.sClockspeed = sClockspeed;
	}
	public String getOpFreq() {
		return opFreq;
	}
	public void setOpFreq(String opFreq) {
		this.opFreq = opFreq;
	}
	public String getInternalStorage() {
		return internalStorage;
	}
	public void setInternalStorage(String internalStorage) {
		this.internalStorage = internalStorage;
	}
	public String getExpStorage() {
		return expStorage;
	}
	public void setExpStorage(String expStorage) {
		this.expStorage = expStorage;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getSuppMemCardType() {
		return suppMemCardType;
	}
	public void setSuppMemCardType(String suppMemCardType) {
		this.suppMemCardType = suppMemCardType;
	}
	public String getCallLogMemory() {
		return callLogMemory;
	}
	public void setCallLogMemory(String callLogMemory) {
		this.callLogMemory = callLogMemory;
	}
	public String getpCameraAvailable() {
		return pCameraAvailable;
	}
	public void setpCameraAvailable(String pCameraAvailable) {
		this.pCameraAvailable = pCameraAvailable;
	}
	public String getsCameraAvail() {
		return sCameraAvail;
	}
	public void setsCameraAvail(String sCameraAvail) {
		this.sCameraAvail = sCameraAvail;
	}
	public String getpCamera() {
		return pCamera;
	}
	public void setpCamera(String pCamera) {
		this.pCamera = pCamera;
	}
	public String getpCameraFeatures() {
		return pCameraFeatures;
	}
	public void setpCameraFeatures(String pCameraFeatures) {
		this.pCameraFeatures = pCameraFeatures;
	}
	public String getsCamera() {
		return sCamera;
	}
	public void setsCamera(String sCamera) {
		this.sCamera = sCamera;
	}
	public String getsCameraFeatures() {
		return sCameraFeatures;
	}
	public void setsCameraFeatures(String sCameraFeatures) {
		this.sCameraFeatures = sCameraFeatures;
	}
	public String getFlash() {
		return flash;
	}
	public void setFlash(String flash) {
		this.flash = flash;
	}
	public String getHdRecording() {
		return hdRecording;
	}
	public void setHdRecording(String hdRecording) {
		this.hdRecording = hdRecording;
	}
	public String getFhdRecording() {
		return fhdRecording;
	}
	public void setFhdRecording(String fhdRecording) {
		this.fhdRecording = fhdRecording;
	}
	public String getvRecording() {
		return vRecording;
	}
	public void setvRecording(String vRecording) {
		this.vRecording = vRecording;
	}
	public String getVrResolution() {
		return vrResolution;
	}
	public void setVrResolution(String vrResolution) {
		this.vrResolution = vrResolution;
	}
	public String getFrameRate() {
		return frameRate;
	}
	public void setFrameRate(String frameRate) {
		this.frameRate = frameRate;
	}
	public String getPhoneBook() {
		return phoneBook;
	}
	public void setPhoneBook(String phoneBook) {
		this.phoneBook = phoneBook;
	}
	public String getNetworkType() {
		return networkType;
	}
	public void setNetworkType(String networkType) {
		this.networkType = networkType;
	}
	public String getSuppNetworks() {
		return suppNetworks;
	}
	public void setSuppNetworks(String suppNetworks) {
		this.suppNetworks = suppNetworks;
	}
	public String getThreeG() {
		return threeG;
	}
	public void setThreeG(String threeG) {
		this.threeG = threeG;
	}
	public String getGprs() {
		return gprs;
	}
	public void setGprs(String gprs) {
		this.gprs = gprs;
	}
	public String getPreInstalledBrowser() {
		return preInstalledBrowser;
	}
	public void setPreInstalledBrowser(String preInstalledBrowser) {
		this.preInstalledBrowser = preInstalledBrowser;
	}
	public String getBluetoothSupp() {
		return bluetoothSupp;
	}
	public void setBluetoothSupp(String bluetoothSupp) {
		this.bluetoothSupp = bluetoothSupp;
	}
	public String getBluetoothVer() {
		return bluetoothVer;
	}
	public void setBluetoothVer(String bluetoothVer) {
		this.bluetoothVer = bluetoothVer;
	}
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
	}
	public String getiConn() {
		return iConn;
	}
	public void setiConn(String iConn) {
		this.iConn = iConn;
	}
	public String getWifiVer() {
		return wifiVer;
	}
	public void setWifiVer(String wifiVer) {
		this.wifiVer = wifiVer;
	}
	public String getNfc() {
		return nfc;
	}
	public void setNfc(String nfc) {
		this.nfc = nfc;
	}
	public String getUsbConn() {
		return usbConn;
	}
	public void setUsbConn(String usbConn) {
		this.usbConn = usbConn;
	}
	public String getAudioJack() {
		return audioJack;
	}
	public void setAudioJack(String audioJack) {
		this.audioJack = audioJack;
	}
	public String getSmartPhone() {
		return smartPhone;
	}
	public void setSmartPhone(String smartPhone) {
		this.smartPhone = smartPhone;
	}
	public String getSimSize() {
		return simSize;
	}
	public void setSimSize(String simSize) {
		this.simSize = simSize;
	}
	public String getRemoBattery() {
		return remoBattery;
	}
	public void setRemoBattery(String remoBattery) {
		this.remoBattery = remoBattery;
	}
	public String getSms() {
		return sms;
	}
	public void setSms(String sms) {
		this.sms = sms;
	}
	public String getSensors() {
		return sensors;
	}
	public void setSensors(String sensors) {
		this.sensors = sensors;
	}
	public String getOtherFeatures() {
		return otherFeatures;
	}
	public void setOtherFeatures(String otherFeatures) {
		this.otherFeatures = otherFeatures;
	}
	public String getImpApps() {
		return impApps;
	}
	public void setImpApps(String impApps) {
		this.impApps = impApps;
	}
	public String getAudioFormats() {
		return audioFormats;
	}
	public void setAudioFormats(String audioFormats) {
		this.audioFormats = audioFormats;
	}
	public String getVideoFormats() {
		return videoFormats;
	}
	public void setVideoFormats(String videoFormats) {
		this.videoFormats = videoFormats;
	}
	public String getBattCapacity() {
		return battCapacity;
	}
	public void setBattCapacity(String battCapacity) {
		this.battCapacity = battCapacity;
	}
	public String getBattType() {
		return battType;
	}
	public void setBattType(String battType) {
		this.battType = battType;
	}
	public String getWidth() {
		return width;
	}
	public void setWidth(String width) {
		this.width = width;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getWarrantySum() {
		return warrantySum;
	}
	public void setWarrantySum(String warrantySum) {
		this.warrantySum = warrantySum;
	}
	public String getProcessorType() {
		return processorType;
	}
	public void setProcessorType(String processorType) {
		this.processorType = processorType;
	}
	
}
