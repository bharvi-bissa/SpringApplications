package com.tadigital.mvc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tadigital.mvc.entity.Product;
import com.tadigital.mvc.entity.Vendor;
import com.tadigital.mvc.service.VendorService;

@Controller
public class VendorController {
	
	@Autowired
	ServletContext context; 
	
	public void setServletContext(ServletContext servletContext) {
	    this.context = servletContext;
	}

	private VendorService vendorService;

	@Autowired
	public VendorController(VendorService vendorService) {
		this.vendorService = vendorService;
	}
	
	
	
	@RequestMapping(value="/vendorloginform",method = RequestMethod.GET)
	public String loginForm() {
		return "VendorLoginForm.jsp";
	}
	
	@RequestMapping(value="/NewProductForm")
	public String showAddProductForm() {
		return "NewProductForm.jsp";
	}
	
	@RequestMapping(value="/vendorlogout",method=RequestMethod.GET)
	public String logoutVendor(HttpSession session) {
		session.invalidate();
		return "redirect:VendorLoginForm.jsp";
	}
	

	@RequestMapping(value="/vendorlogin",method = RequestMethod.POST)
	public String login(HttpServletRequest request) {
		
		Vendor vendor = new Vendor();
		String email = request.getParameter("vendor_email");
		String password = request.getParameter("vendor_password");
		
		vendor.setEmail(email);
		vendor.setPassword(password);

		Vendor status = vendorService.loginService(vendor);
		if (status == null) {
			return "LoginFailure.jsp";
			
		}
		else{
			HttpSession session = request.getSession();
			session.setAttribute("VENDORDATA", status);
			return "VendorHomePage.jsp";
		}
	}
	
	@RequestMapping(value="/deleteproduct{id}",method = RequestMethod.GET)
	public String deleteProduct(@PathVariable int id,HttpSession session) {
		if(vendorService.deleteProduct(id)) {
			List<Product> productList = (List)context.getAttribute("PRODUCTLIST");
			List<Product> productListSess = (List)session.getAttribute("PRODUCTLIST");
			for(Product product : productList) {
				if(product.getId() == id) {
					productList.remove(product);
					productListSess.remove(product);
					session.setAttribute("PRODUCTLIST", productListSess);
					context.setAttribute("PRODUCTLIST", productList);
					break;
				}
			}
		}
			
		return "redirect:/showproducts";
	}
	
	@RequestMapping(value="/showproducts",method = RequestMethod.GET)
	public String showProducts(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Vendor vendor = (Vendor)session.getAttribute("VENDORDATA"); 
		List<Product> productList = vendorService.getProducts(vendor.getId());
		context.setAttribute("PRODUCTLIST", productList);
		session.setAttribute("PRODUCTLIST", productList);
		return "ProductList.jsp";
	}
	
	@RequestMapping(value="/productedit{id}",method = RequestMethod.GET)
	public String editProduct(@PathVariable int id,HttpSession session) {
		
		List<Product> productList =(List) context.getAttribute("PRODUCTLIST");
	
		for(Product product : productList) {
			if(product.getId() == id) {
				session.setAttribute("PRODUCTTOEDIT", product);
				break;
			}
		}
			
		return "ProductEditPage.jsp";
	}
	@RequestMapping(value="producteditaction{id}",method=RequestMethod.POST)
	public String editProductAction(@PathVariable int id,HttpSession session,HttpServletRequest request) throws IOException, ServletException {
		Vendor vendor = new Vendor();
		String productName = "";
		String productPrice = "";
		String productQuantity="";
		String productDescription = "";
		String sd1="";
		String sd1Title="";
		String sd2="";
		String sd2Title="";
		String sd3="";
		String sd3Title="";
		String sd4="";
		String sd4Title="";
		String sd5="";
		String sd5Title="";
		String sd6="";
		String sd6Title="";
		String sd7="";
		String sd7Title="";
		String sd8="";
		String sd8Title="";
		String sd9="";
		String sd9Title="";
		String sd10="";
		String sd10Title="";
		String productCategory="";
		String productSubCategrory="";
		Part image1;
		Part image2;
		Part image3;
		Part image4;
		Part image5; 
		
		String[] fileName = new String[5];
		
		productName = request.getParameter("product_name");
		productPrice = request.getParameter("product_price");
		productQuantity = request.getParameter("product_quantity");
		productDescription = request.getParameter("product_sdescription");
		productCategory = request.getParameter("category");
		productSubCategrory = request.getParameter("subcategory");
		sd1Title=request.getParameter("product_d1_title");
		sd2Title=request.getParameter("product_d2_title");
		sd3Title=request.getParameter("product_d3_title");
		sd4Title=request.getParameter("product_d4_title");
		sd5Title=request.getParameter("product_d5_title");
		sd6Title=request.getParameter("product_d6_title");
		sd7Title=request.getParameter("product_d7_title");
		sd8Title=request.getParameter("product_d8_title");
		sd9Title=request.getParameter("product_d9_title");
		sd10Title=request.getParameter("product_d10_title");
		sd1=request.getParameter("product_d1");
		sd2=request.getParameter("product_d2");
		sd3=request.getParameter("product_d3");
		sd4=request.getParameter("product_d4");
		sd5=request.getParameter("product_d5");
		sd6=request.getParameter("product_d6");
		sd7=request.getParameter("product_d7");
		sd8=request.getParameter("product_d8");
		sd9=request.getParameter("product_d9");
		sd10=request.getParameter("product_d10");
		
		String box = request.getParameter("box");
		String modelNumber = request.getParameter("model_number");
		String modelName = request.getParameter("model_name");
		String modelColor = request.getParameter("model_color");
		String browseType = request.getParameter("browse_type");
		String simType = request.getParameter("sim_type");
		String touchScreen = request.getParameter("touch_screen");
		String displaySize = request.getParameter("display_size");
		String resolution = request.getParameter("resolution");
		String resoType = request.getParameter("reso_type");
		String displayType = request.getParameter("display_type");
		String displayColors = request.getParameter("display_colors");
		String os = request.getParameter("os");
		String processorType = request.getParameter("processor_type");
		String processorCore = request.getParameter("processor_core");
		String pClockspeed = request.getParameter("p_clock_speed");
		String sClockspeed = request.getParameter("s_clock_speed");
		String opFreq = request.getParameter("op_freq");
		String internalStorage = request.getParameter("internal_storage");
		String ram = request.getParameter("ram");
		String expStorage = request.getParameter("exp_storage");
		String suppMemCardType = request.getParameter("supported_memory_card_type");
		String callLogMemory = request.getParameter("call_log_memory");
		String pCameraAvailable = request.getParameter("p_camera_available");
		String pCamera = request.getParameter("p_camera");
		String pCameraFeatures = request.getParameter("p_camera_features");
		String sCameraAvail = request.getParameter("s_camera_available");
		String sCamera = request.getParameter("s_camera");
		String sCameraFeatures = request.getParameter("s_camera_features");
		String flash = request.getParameter("flash");
		String hdRecording = request.getParameter("hd_recording");
		String fhdRecording = request.getParameter("fhd_recording");
		String vRecording = request.getParameter("v_recording");
		String vrResolution = request.getParameter("vr_resolution");
		String frameRate = request.getParameter("frame_rate");
		String phoneBook = request.getParameter("phone_book");
		String networkType = request.getParameter("network_type");
		String suppNetworks = request.getParameter("s_networks");
		String threeG = request.getParameter("3g");
		String gprs = request.getParameter("gprs");
		String preInstalledBrowser = request.getParameter("pre_i_browser");
		String bluetoothSupp = request.getParameter("bluetooth_supp");
		String bluetoothVer = request.getParameter("bluetooth_ver");
		String wifi = request.getParameter("wifi");
		String iConn = request.getParameter("i_conn");
		String wifiVer = request.getParameter("wifi_version");
		String nfc = request.getParameter("nfc");
		String usbConn = request.getParameter("usb_conn");
		String audioJack = request.getParameter("audio_jack");
		String smartPhone = request.getParameter("smart_phone");
		String simSize = request.getParameter("sim_size");
		String remoBattery = request.getParameter("remo_batt");
		String sms = request.getParameter("sms");
		String sensors = request.getParameter("sensors");
		String otherFeatures = request.getParameter("other_features");
		String impApps = request.getParameter("imp_apps");
		String audioFormats = request.getParameter("audio_formats");
		String videoFormats = request.getParameter("video_formats");
		String battCapacity = request.getParameter("batt_capacity");
		String battType = request.getParameter("batt_type");
		String width = request.getParameter("width");
		String height = request.getParameter("height");
		String depth = request.getParameter("depth");
		String weight = request.getParameter("weight");
		String warrantySum = request.getParameter("warranty_summ");
		
		image1 = request.getPart("product_image1");
		image2 = request.getPart("product_image2");
		image3 = request.getPart("product_image3");
		image4 = request.getPart("product_image4");
		image5 = request.getPart("product_image5");
		
		/* Image Upload */
		
		ArrayList<Part> images = new ArrayList<>();
		images.add(image1);
		images.add(image2);
		images.add(image3);
		images.add(image4);
		images.add(image5);
		
		//getting all the imageNames from form
		
		String[] imageNames = new String[5];
		for(int i=0,k=1;i<5;i++,k++){
			imageNames[i]=request.getParameter("img"+k);
		}
		
	int i=0;
		
		for(Part the_part :images){
			if(the_part.getSize() != 0 ) {
				Random rand = new Random();
				Integer n =rand.nextInt(100000000)+1;
				
							
			    for (String content : the_part.getHeader("content-disposition").split(";")) {
			    	
			        if (content.trim().startsWith("filename")) {
			        	
			            fileName[i] = n.toString()+content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			            
			        }
			    }
			    
			    FileOutputStream fos = null;
			    InputStream is = null;
			   
			    try {
			    	File file = new File("D:\\EclipseWorkspace\\TrainingProject_Bharvi_Spring\\WebContent\\images\\uploads" + File.separator + fileName[i]);
			        fos = new FileOutputStream(file);
			        is = the_part.getInputStream();
			
			        int read = 0;
			        final byte[] bytes = new byte[1024];
			
			        while((read = is.read(bytes)) != -1) {
			            fos.write(bytes, 0, read);
			        }
			        
			    } finally {
			        if (fos != null) {
			            fos.close();
			        }
			        if (is != null) {
			        	is.close();
			        }
			    }
	 		}else{
				fileName[i]=imageNames[i];
			}
			i++;
		}
		
		Vendor vendorData = (Vendor)session.getAttribute("VENDORDATA");
		
		Product product = new Product();
		product.setName(productName);
		product.setDescription(productDescription);
		product.setQuantity(productQuantity);
		product.setPrice(productPrice);
		product.setVendorId(vendorData.getId());
		product.setCategory(productCategory);
		product.setSubcategory(productSubCategrory);
		product.setImage1(fileName[0]);
		product.setImage2(fileName[1]);
		product.setImage3(fileName[2]);
		product.setImage4(fileName[3]);
		product.setImage5(fileName[4]);
		
		product.setProdouctDescription1(sd1);
		product.setProdouctDescription2(sd2);
		product.setProdouctDescription3(sd3);
		product.setProdouctDescription4(sd4);
		product.setProdouctDescription5(sd5);
		product.setProdouctDescription6(sd6);
		product.setProdouctDescription7(sd7);
		product.setProdouctDescription8(sd8);
		product.setProdouctDescription9(sd9);
		product.setProdouctDescription10(sd10);
		product.setProductDescriptionTitle1(sd1Title);
		product.setProductDescriptionTitle2(sd2Title);
		product.setProductDescriptionTitle3(sd3Title);
		product.setProductDescriptionTitle4(sd4Title);
		product.setProductDescriptionTitle5(sd5Title);
		product.setProductDescriptionTitle6(sd6Title);
		product.setProductDescriptionTitle7(sd7Title);
		product.setProductDescriptionTitle8(sd8Title);
		product.setProductDescriptionTitle9(sd9Title);
		product.setProductDescriptionTitle10(sd10Title);
		
		product.setBox(box);
		product.setModelColor(modelColor);
		product.setModelNumber(modelNumber);
		product.setModelName(modelName);
		product.setBrowseType(browseType);
		product.setSimType(simType);
		product.setTouchScreen(touchScreen);
		
		product.setDisplaySize(displaySize);
		product.setResolution(resolution);
		product.setResoType(resoType);
		product.setDisplayType(displayType);
		product.setDisplayColors(displayColors);
		
		product.setOs(os);
		product.setProcessorType(processorType);
		product.setProcessorCore(processorCore);
		product.setpClockspeed(pClockspeed);
		product.setsClockspeed(sClockspeed);
		product.setOpFreq(opFreq);
		
		product.setInternalStorage(internalStorage);
		product.setRam(ram);
		product.setExpStorage(expStorage);
		product.setSuppMemCardType(suppMemCardType);
		product.setCallLogMemory(callLogMemory);
		
		product.setpCameraAvailable(pCameraAvailable);
		product.setpCamera(pCamera);
		product.setpCameraFeatures(pCameraFeatures);
		product.setsCamera(sCamera);
		product.setsCameraAvail(sCameraAvail);
		product.setsCameraFeatures(sCameraFeatures);
		product.setFlash(flash);
		product.setFhdRecording(fhdRecording);
		product.setHdRecording(hdRecording);
		product.setvRecording(vRecording);
		product.setVrResolution(vrResolution);
		product.setFrameRate(frameRate);
		
		product.setPhoneBook(phoneBook); 
		
		product.setNetworkType(networkType);
		product.setSuppNetworks(suppNetworks);
		product.setThreeG(threeG);
		product.setGprs(gprs);
		product.setPreInstalledBrowser(preInstalledBrowser);
		product.setBluetoothSupp(bluetoothSupp);
		product.setBluetoothVer(bluetoothVer);
		product.setWifi(wifi);
		product.setWifiVer(wifiVer);
		product.setiConn(iConn);
		product.setNfc(nfc);
		product.setUsbConn(usbConn);
		product.setAudioJack(audioJack);
		
		product.setSmartPhone(smartPhone);
		product.setSimSize(simSize);
		product.setRemoBattery(remoBattery);
		product.setSms(sms);
		product.setSensors(sensors);
		product.setOtherFeatures(otherFeatures);
		product.setImpApps(impApps);
		
		product.setAudioFormats(audioFormats);
		product.setVideoFormats(videoFormats);
		
		product.setBattCapacity(battCapacity);
		product.setBattType(battType);
		
		product.setWidth(width);
		product.setHeight(height);
		product.setDepth(depth);
		product.setWeight(weight);
		
		product.setWarrantySum(warrantySum);
		
		//list of all products
		List<Product> productList = (List)context.getAttribute("PRODUCTLIST"); 
		
		boolean status = vendorService.editProduct(product,id);
		 if (status) {
			 int index=0;
			 for(Product p : productList) {
				 index++;
				 if(p.getId() == id) {
					 p.setId(id);
					 productList.set(index-1, p);
					 context.setAttribute("PRODUCTLIST", productList);
					 break;
				 }
			 }
			String success = "Product updated successfully.";
			session.setAttribute("success",success);
			return "redirect:/showproducts";
		 }else {
			String error = "Something went wrong";
			session.setAttribute("error",error);
			return "redirect:ProductEdit.jsp";
		 }
		
		
	}
	@RequestMapping(value="/addproduct",method = RequestMethod.POST)
	public String addProducts(HttpServletRequest request,HttpSession session) throws IOException, ServletException {
		
		String productName = "";
		String productPrice = "";
		String productQuantity="";
		String productDescription = "";
		String sd1="";
		String sd1Title="";
		String sd2="";
		String sd2Title="";
		String sd3="";
		String sd3Title="";
		String sd4="";
		String sd4Title="";
		String sd5="";
		String sd5Title="";
		String sd6="";
		String sd6Title="";
		String sd7="";
		String sd7Title="";
		String sd8="";
		String sd8Title="";
		String sd9="";
		String sd9Title="";
		String sd10="";
		String sd10Title="";
		
		Part image1;
		Part image2;
		Part image3;
		Part image4;
		Part image5; 
		
		String[] fileName = new String[5];
		
		productName = request.getParameter("product_name");
		productPrice = request.getParameter("product_price");
		productQuantity = request.getParameter("product_quantity");
		productDescription = request.getParameter("product_sdescription");
		String productCategory = request.getParameter("category");
		String productSubCategrory = request.getParameter("subcategory");
		sd1Title=request.getParameter("product_d1_title");
		sd2Title=request.getParameter("product_d2_title");
		sd3Title=request.getParameter("product_d3_title");
		sd4Title=request.getParameter("product_d4_title");
		sd5Title=request.getParameter("product_d5_title");
		sd6Title=request.getParameter("product_d6_title");
		sd7Title=request.getParameter("product_d7_title");
		sd8Title=request.getParameter("product_d8_title");
		sd9Title=request.getParameter("product_d9_title");
		sd10Title=request.getParameter("product_d10_title");
		sd1=request.getParameter("product_d1");
		sd2=request.getParameter("product_d2");
		sd3=request.getParameter("product_d3");
		sd4=request.getParameter("product_d4");
		sd5=request.getParameter("product_d5");
		sd6=request.getParameter("product_d6");
		sd7=request.getParameter("product_d7");
		sd8=request.getParameter("product_d8");
		sd9=request.getParameter("product_d9");
		sd10=request.getParameter("product_d10");
		image1 = request.getPart("product_image1");
		image2 = request.getPart("product_image2");
		image3 = request.getPart("product_image3");
		image4 = request.getPart("product_image4");
		image5 = request.getPart("product_image5");
		String box = request.getParameter("box");
		String modelNumber = request.getParameter("model_number");
		String modelName = request.getParameter("model_name");
		String modelColor = request.getParameter("model_color");
		String browseType = request.getParameter("browse_type");
		String simType = request.getParameter("sim_type");
		String touchScreen = request.getParameter("touch_screen");
		String displaySize = request.getParameter("display_size");
		String resolution = request.getParameter("resolution");
		String resoType = request.getParameter("reso_type");
		String displayType = request.getParameter("display_type");
		String displayColors = request.getParameter("display_colors");
		String os = request.getParameter("os");
		String processorType = request.getParameter("processor_type");
		String processorCore = request.getParameter("processor_core");
		String pClockspeed = request.getParameter("p_clock_speed");
		String sClockspeed = request.getParameter("s_clock_speed");
		String opFreq = request.getParameter("op_freq");
		String internalStorage = request.getParameter("internal_storage");
		String ram = request.getParameter("ram");
		String expStorage = request.getParameter("exp_storage");
		String suppMemCardType = request.getParameter("supported_memory_card_type");
		String callLogMemory = request.getParameter("call_log_memory");
		String pCameraAvailable = request.getParameter("p_camera_available");
		String pCamera = request.getParameter("p_camera");
		String pCameraFeatures = request.getParameter("p_camera_features");
		String sCameraAvail = request.getParameter("s_camera_available");
		String sCamera = request.getParameter("s_camera");
		String sCameraFeatures = request.getParameter("s_camera_features");
		String flash = request.getParameter("flash");
		String hdRecording = request.getParameter("hd_recording");
		String fhdRecording = request.getParameter("fhd_recording");
		String vRecording = request.getParameter("v_recording");
		String vrResolution = request.getParameter("vr_resolution");
		String frameRate = request.getParameter("frame_rate");
		String phoneBook = request.getParameter("phone_book");
		String networkType = request.getParameter("network_type");
		String suppNetworks = request.getParameter("s_networks");
		String threeG = request.getParameter("3g");
		String gprs = request.getParameter("gprs");
		String preInstalledBrowser = request.getParameter("pre_i_browser");
		String bluetoothSupp = request.getParameter("bluetooth_supp");
		String bluetoothVer = request.getParameter("bluetooth_ver");
		String wifi = request.getParameter("wifi");
		String iConn = request.getParameter("i_conn");
		String wifiVer = request.getParameter("wifi_version");
		String nfc = request.getParameter("nfc");
		String usbConn = request.getParameter("usb_conn");
		String audioJack = request.getParameter("audio_jack");
		String smartPhone = request.getParameter("smart_phone");
		String simSize = request.getParameter("sim_size");
		String remoBattery = request.getParameter("remo_batt");
		String sms = request.getParameter("sms");
		String sensors = request.getParameter("sensors");
		String otherFeatures = request.getParameter("other_features");
		String impApps = request.getParameter("imp_apps");
		String audioFormats = request.getParameter("audio_formats");
		String videoFormats = request.getParameter("video_formats");
		String battCapacity = request.getParameter("batt_capacity");
		String battType = request.getParameter("batt_type");
		String width = request.getParameter("width");
		String height = request.getParameter("height");
		String depth = request.getParameter("depth");
		String weight = request.getParameter("weight");
		String warrantySum = request.getParameter("warranty_summ");
		
		
		
	/* Image Upload */
		
		ArrayList<Part> images = new ArrayList<>();
		images.add(image1);
		images.add(image2);
		images.add(image3);
		images.add(image4);
		images.add(image5);
		
	int i=0;
		
		for(Part the_part :images){
			if(the_part.getSize() != 0 ) {
				Random rand = new Random();
				Integer n =rand.nextInt(100000000)+1;
				
							
			    for (String content : the_part.getHeader("content-disposition").split(";")) {
			    	
			        if (content.trim().startsWith("filename")) {
			        	
			            fileName[i] = n.toString()+content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
			            
			        }
			    }
			    
			    FileOutputStream fos = null;
			    InputStream is = null;
			   
			    try {
			    	File file = new File("D:\\EclipseWorkspace\\TrainingProject_Bharvi_Spring\\WebContent\\images\\uploads" + File.separator + fileName[i]);
			        fos = new FileOutputStream(file);
			        is = the_part.getInputStream();
			
			        int read = 0;
			        final byte[] bytes = new byte[1024];
			
			        while((read = is.read(bytes)) != -1) {
			            fos.write(bytes, 0, read);
			        }
			        
			    } finally {
			        if (fos != null) {
			            fos.close();
			        }
			        if (is != null) {
			        	is.close();
			        }
			    }
	 		}
			i++;
		}
		for(int k=0;k<5;k++){
			if(fileName[k]==null){
				fileName[k]="default-img.png";
			}
		}
		
		Vendor vendorData = (Vendor)session.getAttribute("VENDORDATA");
		
		Product product = new Product();
		product.setName(productName);
		product.setDescription(productDescription);
		product.setQuantity(productQuantity);
		product.setPrice(productPrice);
		product.setVendorId(vendorData.getId());
		product.setCategory(productCategory);
		product.setSubcategory(productSubCategrory);
		product.setImage1(fileName[0]);
		product.setImage2(fileName[1]);
		product.setImage3(fileName[2]);
		product.setImage4(fileName[3]);
		product.setImage5(fileName[4]);
		product.setProdouctDescription1(sd1);
		product.setProdouctDescription2(sd2);
		product.setProdouctDescription3(sd3);
		product.setProdouctDescription4(sd4);
		product.setProdouctDescription5(sd5);
		product.setProdouctDescription6(sd6);
		product.setProdouctDescription7(sd7);
		product.setProdouctDescription8(sd8);
		product.setProdouctDescription9(sd9);
		product.setProdouctDescription10(sd10);
		product.setProductDescriptionTitle1(sd1Title);
		product.setProductDescriptionTitle2(sd2Title);
		product.setProductDescriptionTitle3(sd3Title);
		product.setProductDescriptionTitle4(sd4Title);
		product.setProductDescriptionTitle5(sd5Title);
		product.setProductDescriptionTitle6(sd6Title);
		product.setProductDescriptionTitle7(sd7Title);
		product.setProductDescriptionTitle8(sd8Title);
		product.setProductDescriptionTitle9(sd9Title);
		product.setProductDescriptionTitle10(sd10Title);
		
		product.setBox(box);
		product.setModelColor(modelColor);
		product.setModelNumber(modelNumber);
		product.setModelName(modelName);
		product.setBrowseType(browseType);
		product.setSimType(simType);
		product.setTouchScreen(touchScreen);
		
		product.setDisplaySize(displaySize);
		product.setResolution(resolution);
		product.setResoType(resoType);
		product.setDisplayType(displayType);
		product.setDisplayColors(displayColors);
		
		product.setOs(os);
		product.setProcessorType(processorType);
		product.setProcessorCore(processorCore);
		product.setpClockspeed(pClockspeed);
		product.setsClockspeed(sClockspeed);
		product.setOpFreq(opFreq);
		
		product.setInternalStorage(internalStorage);
		product.setRam(ram);
		product.setExpStorage(expStorage);
		product.setSuppMemCardType(suppMemCardType);
		product.setCallLogMemory(callLogMemory);
		
		product.setpCameraAvailable(pCameraAvailable);
		product.setpCamera(pCamera);
		product.setpCameraFeatures(pCameraFeatures);
		product.setsCamera(sCamera);
		product.setsCameraAvail(sCameraAvail);
		product.setsCameraFeatures(sCameraFeatures);
		product.setFlash(flash);
		product.setFhdRecording(fhdRecording);
		product.setHdRecording(hdRecording);
		product.setvRecording(vRecording);
		product.setVrResolution(vrResolution);
		product.setFrameRate(frameRate);
		
		product.setPhoneBook(phoneBook); 
		
		product.setNetworkType(networkType);
		product.setSuppNetworks(suppNetworks);
		product.setThreeG(threeG);
		product.setGprs(gprs);
		product.setPreInstalledBrowser(preInstalledBrowser);
		product.setBluetoothSupp(bluetoothSupp);
		product.setBluetoothVer(bluetoothVer);
		product.setWifi(wifi);
		product.setWifiVer(wifiVer);
		product.setiConn(iConn);
		product.setNfc(nfc);
		product.setUsbConn(usbConn);
		product.setAudioJack(audioJack);
		
		product.setSmartPhone(smartPhone);
		product.setSimSize(simSize);
		product.setRemoBattery(remoBattery);
		product.setSms(sms);
		product.setSensors(sensors);
		product.setOtherFeatures(otherFeatures);
		product.setImpApps(impApps);
		
		product.setAudioFormats(audioFormats);
		product.setVideoFormats(videoFormats);
		
		product.setBattCapacity(battCapacity);
		product.setBattType(battType);
		
		product.setWidth(width);
		product.setHeight(height);
		product.setDepth(depth);
		product.setWeight(weight);
		
		product.setWarrantySum(warrantySum);
	
		 boolean status = vendorService.addProduct(product);
		 if (status) {
			String success = "Product added.";
			session.setAttribute("success",success);
			return "redirect:/showproducts";
		 }else {
			String error = "Something went wrong";
			session.setAttribute("error",error);
			return "AddNewProductForm.jsp";
		 }
	}
	
	
}
