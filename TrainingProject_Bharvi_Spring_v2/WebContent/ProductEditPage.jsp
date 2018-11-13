<%@page import="com.tadigital.mvc.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tadigital.mvc.entity.Vendor"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
	String id;
	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	String name;
	String price;
	String quantity;
	String description;
	String image1,image2,image3,image4,image5;
	
%>

<%
	Vendor v = (Vendor)session.getAttribute("VENDORDATA");
	
	if(v == null){
		response.sendRedirect("VendorLoginForm.jsp");
	}
	Product product =(Product)session.getAttribute("PRODUCTTOEDIT");
	
	
	
%>
<%@include file="VendorHeader.jsp"%>
	<div class="container-fluid" id="middle-container">
		<ul>
			<li><a href="">Home </a></li>
			<li><a href="">New Account </a>/</li>
			<li><a href="">Login </a>/</li>
		</ul>
	</div>
	
	<!-- main content starts -->
	<div class="container">
		<h3 class="pt-4" style="font-weight:lighter;">Add New Product to the Inventory</h3>
		<br>
		<hr>
		<!-- general info starts -->
		<div class="row">
			<div class="col-md-12">
				<h4>GENERAL INFORMATION</h4>
			</div>
			<br>
			<br>
			<div class="col-md-4">
			<form action="producteditaction<%= product.getId() %>" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label for="Name">Name:</label>
					<input type="name" class="form-control" name="product_name" value="<%= product.getName() %>">
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="price">Price in Rs:</label>
					<input type="price" class="form-control" name="product_price" value="<%= product.getPrice() %>">
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="price">Short Description:</label>
					<TextArea class="form-control" name="product_sdescription"><%= product.getDescription() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Category:</label>
					<select name="category" class="form-control">
						<option value="<%= product.getCategory() %>" selected><%= product.getCategory() %></option>
						<option value="electronics">Electronics</option>
						<option value="men">Men</option>
						<option value="women">Women</option>
						<option value="baby and kids">Baby & Kids</option>
						<option value="home and furniture">Home & Furniture</option>
					</select>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Sub Category:</label>
					<select name="subcategory" class="form-control">
						<option value="<%= product.getSubcategory() %>" selected><%= product.getSubcategory() %></option>
						<option value="mobiles">Mobiles</option>
						<option value="healthcare">HealthCare & Appliances</option>
						<option value="laptops">Laptops</option>
						<option value="camera">Camera</option>
						<option value="computer accessories">Computer Accessories</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="form-group">
					<label for="Quantity">Quantity:</label>
					<input type="Quantity" class="form-control" name="product_quantity" value="<%= product.getQuantity() %>">
				</div>
			</div>
			<div class="col-md-4">
				<input type="hidden" class="form-control" name="img1" value="<%= product.getImage1() %>" >
				<input type="hidden" class="form-control" name="img2" value="<%= product.getImage2() %>">
				<input type="hidden" class="form-control" name="img3" value="<%= product.getImage3() %>">
			</div>
			<div class="col-md-4">
				<input type="hidden" class="form-control" name="img4" value="<%= product.getImage4() %>">
				<input type="hidden" class="form-control" name="img5" value="<%= product.getImage5() %>">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="exampleFormControlFile1">Image 1</label>
					<input type="file" class="form-control-file p-2" id="exampleFormControlFile1" name="product_image1" style="border:1px solid lightgrey">
				</div>
			</div>
			<div class="col-md-6">
				<img src="images/uploads/<%= product.getImage1() %>" height="80" width="80">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="exampleFormControlFile1">Image 2</label>
					<input type="file" class="form-control-file p-2" id="exampleFormControlFile1" name="product_image2" style="border:1px solid lightgrey">
				</div>
			</div>
			<div class="col-md-6">
				<img src="images/uploads/<%= product.getImage2() %>" height="80" width="80">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="exampleFormControlFile1">Image 3</label>
					<input type="file" class="form-control-file p-2" id="exampleFormControlFile1" name="product_image3" style="border:1px solid lightgrey">
				</div>
			</div>
			<div class="col-md-6">
				<img src="images/uploads/<%= product.getImage3() %>" height="80" width="80">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="exampleFormControlFile1">Image 4</label>
					<input type="file" class="form-control-file p-2" id="exampleFormControlFile1" name="product_image4" style="border:1px solid lightgrey">
				</div>
			</div>
			<div class="col-md-6">
				<img src="images/uploads/<%= product.getImage4() %>" height="80" width="80">
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="exampleFormControlFile1">Image 5</label>
					<input type="file" class="form-control-file p-2" id="exampleFormControlFile1" name="product_image5" style="border:1px solid lightgrey">
				</div>
			</div>
			<div class="col-md-6">
				<img src="images/uploads/<%= product.getImage5() %>" height="80" width="80">
			</div>
		</div><!-- general info ends -->
		<hr>
		<!-- product description starts -->
		<div class="row pt-5">
			<div class="col-md-12">
				<h4>PRODUCT DESCRIPTION</h4>
			</div>
			<br>
			<br>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 1 Title:</label>
						<input type="desc" class="form-control" name="product_d1_title" value="<%= product.getProductDescriptionTitle1() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 1 Content:</label>
					<TextArea class="form-control" name="product_d1"><%= product.getProdouctDescription1() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 2 Title:</label>
						<input type="desc" class="form-control" name="product_d2_title" value="<%= product.getProductDescriptionTitle2() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 2 Content:</label>
					<TextArea class="form-control" name="product_d2"><%= product.getProdouctDescription2() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 3 Title:</label>
						<input type="desc" class="form-control" name="product_d3_title" value="<%= product.getProductDescriptionTitle3() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 3 Content:</label>
					<TextArea class="form-control" name="product_d3"><%= product.getProdouctDescription3() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 4 Title:</label>
						<input type="desc" class="form-control" name="product_d4_title" value="<%= product.getProductDescriptionTitle4() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 4 Content:</label>
					<TextArea class="form-control" name="product_d4"><%= product.getProdouctDescription4() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 5 Title:</label>
						<input type="desc" class="form-control" name="product_d5_title" value="<%= product.getProductDescriptionTitle5() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 5 Content:</label>
					<TextArea class="form-control" name="product_d5"><%= product.getProdouctDescription5() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 6 Title:</label>
					<input type="desc" class="form-control" name="product_d6_title" value="<%= product.getProductDescriptionTitle6() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 6 Content:</label>
					<TextArea class="form-control" name="product_d6"><%= product.getProdouctDescription6() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 7 Title:</label>
					<input type="desc" class="form-control" name="product_d7_title" value="<%= product.getProductDescriptionTitle7() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 7 Content:</label>
					<TextArea class="form-control" name="product_d7"><%= product.getProdouctDescription6() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 8 Title:</label>
					<input type="desc" class="form-control" name="product_d8_title" value="<%= product.getProductDescriptionTitle8() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 8 Content:</label>
					<TextArea class="form-control" name="product_d8"><%= product.getProdouctDescription8() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 9 Title:</label>
					<input type="desc" class="form-control" name="product_d9_title" value="<%= product.getProductDescriptionTitle9() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 9 Content:</label>
					<TextArea class="form-control" name="product_d9"><%= product.getProdouctDescription9() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 10 Title:</label>
					<input type="desc" class="form-control" name="product_d10_title" value="<%= product.getProductDescriptionTitle10() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 10 Content:</label>
					<TextArea class="form-control" name="product_d10"><%= product.getProdouctDescription10() %></TextArea>
				</div>
			</div>
		</div><!-- product description ends -->
		<!-- product specification starts -->
		<div class="row pt-5">
			<div class="col-md-12">
				<h4>PRODUCT SPECIFICATION</h4>
			</div>
			<div class="col-md-12 pt-3">
				<h5>GENERAL</h5>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="Name">In the Box:</label>
					<input type="name" class="form-control" name="box" value="<%= product.getBox() %>">
				</div>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="price">Model Number:</label>
					<input type="price" class="form-control" name="model_number" value="<%= product.getModelNumber() %>">
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="Name">Model Name:</label>
					<input type="name" class="form-control" name="model_name" value="<%= product.getModelName() %>">
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Color:</label>
					<input type="price" class="form-control" name="model_color" value="<%= product.getModelColor() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Browse Types:</label>
					<input type="name" class="form-control" name="browse_type" value="<%= product.getBrowseType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">SIM Type:</label>
					<input type="price" class="form-control" name="sim_type" value="<%= product.getSimType() %>" >
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Touch Screen:</label>
					<input type="price" class="form-control" name="touch_screen" value="<%= product.getTouchScreen() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>DISPLAY FEATURES</h5>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="price">Display Size:</label>
					<input type="price" class="form-control" name="display_size" value="<%= product.getDisplaySize() %>">
				</div>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="Name">Resolution:</label>
					<input type="name" class="form-control" name="resolution" value="<%= product.getResolution() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Resolution Type:</label>
					<input type="name" class="form-control" name="reso_type" value="<%= product.getResoType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Display Type:</label>
					<input type="price" class="form-control" name="display_type" value="<%= product.getDisplayType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Display Colors:</label>
					<input type="price" class="form-control" name="display_colors" value="<%= product.getDisplayColors() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>OS & PROCESSOR FEATURES</h5>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Operating System :</label>
					<input type="name" class="form-control" name="os" value="<%= product.getOs() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Processor Type:</label>
					<input type="name" class="form-control" name="processor_type" value="<%= product.getProcessorType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Processor Core:</label>
					<input type="price" class="form-control" name="processor_core" value="<%= product.getProcessorCore() %>">
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Primary Clock Speed:</label>
					<input type="name" class="form-control" name="p_clock_speed" value="<%= product.getpClockspeed() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Secondary Clock Speed:</label>
					<input type="price" class="form-control" name="s_clock_speed" value="<%= product.getsClockspeed() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Operating Frequency:</label>
					<input type="price" class="form-control" name="op_freq" value="<%= product.getOpFreq() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>MEMORY & STORAGE FEATURES</h5>
			</div>
					<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="price">Internal Storage:</label>
					<input type="text" class="form-control" name="internal_storage" value="<%= product.getInternalStorage() %>">
				</div>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="Name">RAM:</label>
					<input type="name" class="form-control" name="ram" value="<%= product.getRam() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Expandable Storage:</label>
					<input type="name" class="form-control" name="exp_storage" value="<%= product.getExpStorage() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Supported Memory Card Type:</label>
					<input type="price" class="form-control" name="supported_memory_card_type" value="<%= product.getSuppMemCardType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Call Log Memory:</label>
					<input type="price" class="form-control" name="call_log_memory" value="<%= product.getCallLogMemory() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>CAMERA FEATURES</h5>
			</div>
			<div class="col-md-4 pt-3">
				<div class="form-group">
					<label for="price">Primary Camera Available:</label>
					<input type="price" class="form-control" name="p_camera_available" value="<%= product.getpCameraAvailable() %>">
				</div>
			</div>
			<div class="col-md-4 pt-3">
				<div class="form-group">
					<label for="Name">Primary Camera:</label>
					<input type="name" class="form-control" name="p_camera" value="<%= product.getpCameraAvailable() %>"> 
				</div>
			</div>
			<div class="col-md-4 pt-3">
				<div class="form-group">
					<label for="Name">Primary Camera Features:</label>
					<input type="name" class="form-control" name="p_camera_features" value="<%= product.getpCameraAvailable() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Secondary Camera Available:</label>
					<input type="price" class="form-control" name="s_camera_available" value="<%= product.getsCameraAvail() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Secondary Camera:</label>
					<input type="price" class="form-control" name="s_camera" value="<%= product.getsCameraAvail() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Secondary Camera Features:</label>
					<input type="price" class="form-control" name="s_camera_features" value="<%= product.getsCameraFeatures() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Flash:</label>
					<input type="price" class="form-control" name="flash" value="<%= product.getFlash() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">HD Recording:</label>
					<input type="price" class="form-control" name="hd_recording" value="<%= product.getHdRecording() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Full HD Recording:</label>
					<input type="price" class="form-control" name="fhd_recording" value="<%= product.getFhdRecording() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Video Recording:</label>
					<input type="price" class="form-control" name="v_recording" value="<%= product.getvRecording() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Video Recording Resolution:</label>
					<input type="price" class="form-control" name="vr_resolution" value="<%= product.getVrResolution() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Frame Rate:</label>
					<input type="price" class="form-control" name="frame_rate" value="<%= product.getFrameRate() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>CALL FEATURES</h5>
			</div>
			<div class="col-md-12 pt-3">
				<div class="form-group">
					<label for="price">Phone Book:</label>
					<input type="price" class="form-control" name="phone_book" value="<%= product.getPhoneBook() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>CONNECTIVITY FEATURES</h5>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Network Type:</label>
					<input type="price" class="form-control" name="network_type" value="<%= product.getNetworkType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Supported Networks:</label>
					<input type="price" class="form-control" name="s_networks" value="<%= product.getSuppNetworks() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">3G:</label>
					<input type="price" class="form-control" name="3g" value="<%= product.getThreeG() %>">
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">GPRS:</label>
					<input type="price" class="form-control" name="gprs" value="<%= product.getGprs() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Pre Installed Browser:</label>
					<input type="price" class="form-control" name="pre_i_browser" value="<%= product.getPreInstalledBrowser() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Bluetooth Support:</label>
					<input type="price" class="form-control" name="bluetooth_supp" value="<%= product.getBluetoothSupp() %>">
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Bluetooth version:</label>
					<input type="price" class="form-control" name="bluetooth_ver" value="<%= product.getBluetoothVer() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Wi-Fi:</label>
					<input type="price" class="form-control" name="wifi" value="<%= product.getWifi() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Internet Connectivity:</label>
					<input type="price" class="form-control" name="i_conn" value="<%= product.getiConn() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Wi-Fi version:</label>
					<input type="price" class="form-control" name="wifi_version" value="<%= product.getWifiVer() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">NFC:</label>
					<input type="price" class="form-control" name="nfc" value="<%= product.getNfc() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">USB Connectivity:</label>
					<input type="price" class="form-control" name="usb_conn" value="<%= product.getUsbConn() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Audio Jack:</label>
					<input type="price" class="form-control" name="audio_jack" value="<%= product.getAudioJack() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>OTHER DETAILS</h5>
			</div>
				<div class="col-md-3">
				<div class="form-group">
					<label for="price">Smart Phone:</label>
					<input type="price" class="form-control" name="smart_phone" value="<%= product.getSmartPhone() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Sim Size:</label>
					<input type="price" class="form-control" name="sim_size" value="<%= product.getSimSize() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Removable Battery:</label>
					<input type="price" class="form-control" name="remo_batt" value="<%= product.getRemoBattery() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">SMS:</label>
					<input type="price" class="form-control" name="sms" value="<%= product.getSms() %>">
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Sensors:</label>
					<TextArea type="price" class="form-control" name="sensors"><%= product.getSensors() %></TextArea>
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Other Features:</label>
					<TextArea type="price" class="form-control" name="other_features"><%= product.getOtherFeatures() %></TextArea>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Important Apps:</label>
					<input type="price" class="form-control" name="imp_apps" value="<%= product.getImpApps() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>MULTIMEDIA FEATURES</h5>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Audio Formats:</label>
					<input type="price" class="form-control" name="audio_formats" value="<%= product.getAudioFormats() %>">
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Video Formats:</label>
					<input type="price" class="form-control" name="video_formats" value="<%= product.getVideoFormats() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>BATTERY & POWER FEATURES</h5>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Battery Capacity:</label>
					<input type="price" class="form-control" name="batt_capacity" value="<%= product.getBattCapacity() %>">
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Battery Type:</label>
					<input type="price" class="form-control" name="batt_type" value="<%= product.getBattType() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>DIMENSIONS</h5>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Width:</label>
					<input type="price" class="form-control" name="width" value="<%= product.getWidth() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Height:</label>
					<input type="price" class="form-control" name="height" value="<%= product.getHeight() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Depth:</label>
					<input type="price" class="form-control" name="depth" value="<%= product.getDepth() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Weight:</label>
					<input type="price" class="form-control" name="weight" value="<%= product.getWeight() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>WARRANTY</h5>
			</div>
			<div class="col-md-12 pt-2">
				<div class="form-group">
					<label for="price">Warranty Summary:</label>
					<TextArea type="price" class="form-control" name="warranty_summ"><%= product.getWarrantySum() %></TextArea>
				</div>
			</div>
			<div class="col-md-12 pt-4 center pb-4">
				<Button type="submit" class="btn btn-primary"><i class="fas fa-save"></i>&nbsp;Save</Button>
			</div>
		</form>
		</div><!-- product specification ends -->
	</div><!-- container ends -->

	<!-- main content ends -->
	
<%@ include file="footer.html" %>
