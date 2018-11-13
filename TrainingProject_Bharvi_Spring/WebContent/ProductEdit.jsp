<%@page import="com.techaspect.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techaspect.entity.Vendor"%>
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
	Vendor vendor = (Vendor)session.getAttribute("VENDORDATA");
	if(vendor == null){
		response.sendRedirect("VendorLoginForm.jsp");
	}
	String index = request.getParameter("index");
	ArrayList<Product> productList = (ArrayList)session.getAttribute("PRODUCTLIST"); 
	Product currentProduct = productList.get(Integer.parseInt(index));
	
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Training Project</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>
<body>
		<!-- upper navbar -->
	<nav class="navbar navbar-dark bg-dark navbar-expand-lg ">
		<div class="container">
			<a class="navbar-brand" href="#">Contact us on +91 6012235</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarText"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
		  <div class="collapse navbar-collapse" id="navbarText">
		    <ul class="navbar-nav ml-auto">
		    <% 
			   
		    	if(vendor == null){
		    		
		    
		    %>
			  <li class="nav-item active">
		        <a class="nav-link" href="index.jsp"><i class="fas fa-sign-in-alt"></i> &nbsp SIGN IN <span class="sr-only">(current)</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="index.jsp"><i class="fas fa-user-plus"></i> &nbsp SIGN UP</a>
		      </li>
		        <li class="nav-item">
		        <a class="nav-link" href="#"><i class="fab fa-twitter"></i></a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="#"><i class="fab fa-facebook"></i></a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="#"><i class="fas fa-envelope-open"></i></a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="#"><i class="fab fa-google-plus-g"></i></a>
		      </li>
		      <% 
		    	}else{
		      %>
			      <li class="nav-item">
			        <a class="nav-link" href="" >Hello <%= vendor.getName() %> !</a>
			      </li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="Logout.jsp"><i class="fas fa-user-plus"></i> &nbsp LOGOUT</a>
		      	</li>
		   
		      <li class="nav-item">
		        <a class="nav-link" href="#"><i class="fab fa-twitter"></i></a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="#"><i class="fab fa-facebook"></i></a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="#"><i class="fas fa-envelope-open"></i></a>
		      </li>
		       <li class="nav-item">
		        <a class="nav-link" href="#"><i class="fab fa-google-plus-g"></i></a>
		      </li>
		    </ul>
		      <% } %>
		  </div>
		</div>
	</nav>
	
	<!-- main-navbar starts -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="#"><img src="images/logo.png" width="150px" height="30px"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#">Home
					</a></li>
					<li class="nav-item">
						<a class="nav-link" href="#"></a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Electronics </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Men </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Women </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- main-navbar ends -->
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
			<form action="VendorEditProduct?id=<%= currentProduct.getId() %>&index=<%= request.getParameter("index") %>" method="POST" enctype="multipart/form-data">
				<div class="form-group">
					<label for="Name">Name:</label>
					<input type="name" class="form-control" name="product_name" value="<%= currentProduct.getName() %>">
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="price">Price in Rs:</label>
					<input type="price" class="form-control" name="product_price" value="<%= currentProduct.getPrice() %>">
				</div>
			</div>
			<div class="col-md-4">
				<div class="form-group">
					<label for="price">Short Description:</label>
					<TextArea class="form-control" name="product_sdescription"><%= currentProduct.getDescription() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Category:</label>
					<select name="category" class="form-control">
						<option value="<%= currentProduct.getCategory() %>" selected><%= currentProduct.getCategory() %></option>
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
						<option value="<%= currentProduct.getSubcategory() %>" selected><%= currentProduct.getSubcategory() %></option>
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
					<input type="Quantity" class="form-control" name="product_quantity" value="<%= currentProduct.getQuantity() %>">
				</div>
			</div>
			<div class="col-md-4">
				<input type="hidden" class="form-control" name="img1" value="<%= currentProduct.getImage1() %>" >
				<input type="hidden" class="form-control" name="img2" value="<%= currentProduct.getImage2() %>">
				<input type="hidden" class="form-control" name="img3" value="<%= currentProduct.getImage3() %>">
			</div>
			<div class="col-md-4">
				<input type="hidden" class="form-control" name="img4" value="<%= currentProduct.getImage4() %>">
				<input type="hidden" class="form-control" name="img5" value="<%= currentProduct.getImage5() %>">
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
				<img src="images/uploads/<%= currentProduct.getImage1() %>" height="80" width="80">
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
				<img src="images/uploads/<%= currentProduct.getImage2() %>" height="80" width="80">
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
				<img src="images/uploads/<%= currentProduct.getImage3() %>" height="80" width="80">
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
				<img src="images/uploads/<%= currentProduct.getImage4() %>" height="80" width="80">
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
				<img src="images/uploads/<%= currentProduct.getImage5() %>" height="80" width="80">
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
						<input type="desc" class="form-control" name="product_d1_title" value="<%= currentProduct.getProductDescriptionTitle1() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 1 Content:</label>
					<TextArea class="form-control" name="product_d1"><%= currentProduct.getProdouctDescription1() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 2 Title:</label>
						<input type="desc" class="form-control" name="product_d2_title" value="<%= currentProduct.getProductDescriptionTitle2() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 2 Content:</label>
					<TextArea class="form-control" name="product_d2"><%= currentProduct.getProdouctDescription2() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 3 Title:</label>
						<input type="desc" class="form-control" name="product_d3_title" value="<%= currentProduct.getProductDescriptionTitle3() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 3 Content:</label>
					<TextArea class="form-control" name="product_d3"><%= currentProduct.getProdouctDescription3() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 4 Title:</label>
						<input type="desc" class="form-control" name="product_d4_title" value="<%= currentProduct.getProductDescriptionTitle4() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 4 Content:</label>
					<TextArea class="form-control" name="product_d4"><%= currentProduct.getProdouctDescription4() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
					<div class="form-group">
						<label for="desc">Description 5 Title:</label>
						<input type="desc" class="form-control" name="product_d5_title" value="<%= currentProduct.getProductDescriptionTitle5() %>">
					</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 5 Content:</label>
					<TextArea class="form-control" name="product_d5"><%= currentProduct.getProdouctDescription5() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 6 Title:</label>
					<input type="desc" class="form-control" name="product_d6_title" value="<%= currentProduct.getProductDescriptionTitle6() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 6 Content:</label>
					<TextArea class="form-control" name="product_d6"><%= currentProduct.getProdouctDescription6() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 7 Title:</label>
					<input type="desc" class="form-control" name="product_d7_title" value="<%= currentProduct.getProductDescriptionTitle7() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 7 Content:</label>
					<TextArea class="form-control" name="product_d7"><%= currentProduct.getProdouctDescription6() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 8 Title:</label>
					<input type="desc" class="form-control" name="product_d8_title" value="<%= currentProduct.getProductDescriptionTitle8() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 8 Content:</label>
					<TextArea class="form-control" name="product_d8"><%= currentProduct.getProdouctDescription8() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 9 Title:</label>
					<input type="desc" class="form-control" name="product_d9_title" value="<%= currentProduct.getProductDescriptionTitle9() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 9 Content:</label>
					<TextArea class="form-control" name="product_d9"><%= currentProduct.getProdouctDescription9() %></TextArea>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="desc">Description 10 Title:</label>
					<input type="desc" class="form-control" name="product_d10_title" value="<%= currentProduct.getProductDescriptionTitle10() %>">
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group">
					<label for="price">Description 10 Content:</label>
					<TextArea class="form-control" name="product_d10"><%= currentProduct.getProdouctDescription10() %></TextArea>
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
					<input type="name" class="form-control" name="box" value="<%= currentProduct.getBox() %>">
				</div>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="price">Model Number:</label>
					<input type="price" class="form-control" name="model_number" value="<%= currentProduct.getModelNumber() %>">
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="Name">Model Name:</label>
					<input type="name" class="form-control" name="model_name" value="<%= currentProduct.getModelName() %>">
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Color:</label>
					<input type="price" class="form-control" name="model_color" value="<%= currentProduct.getModelColor() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Browse Types:</label>
					<input type="name" class="form-control" name="browse_type" value="<%= currentProduct.getBrowseType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">SIM Type:</label>
					<input type="price" class="form-control" name="sim_type" value="<%= currentProduct.getSimType() %>" >
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Touch Screen:</label>
					<input type="price" class="form-control" name="touch_screen" value="<%= currentProduct.getTouchScreen() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>DISPLAY FEATURES</h5>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="price">Display Size:</label>
					<input type="price" class="form-control" name="display_size" value="<%= currentProduct.getDisplaySize() %>">
				</div>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="Name">Resolution:</label>
					<input type="name" class="form-control" name="resolution" value="<%= currentProduct.getResolution() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Resolution Type:</label>
					<input type="name" class="form-control" name="reso_type" value="<%= currentProduct.getResoType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Display Type:</label>
					<input type="price" class="form-control" name="display_type" value="<%= currentProduct.getDisplayType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Display Colors:</label>
					<input type="price" class="form-control" name="display_colors" value="<%= currentProduct.getDisplayColors() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>OS & PROCESSOR FEATURES</h5>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Operating System :</label>
					<input type="name" class="form-control" name="os" value="<%= currentProduct.getOs() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Processor Type:</label>
					<input type="name" class="form-control" name="processor_type" value="<%= currentProduct.getProcessorType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Processor Core:</label>
					<input type="price" class="form-control" name="processor_core" value="<%= currentProduct.getProcessorCore() %>">
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Primary Clock Speed:</label>
					<input type="name" class="form-control" name="p_clock_speed" value="<%= currentProduct.getpClockspeed() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Secondary Clock Speed:</label>
					<input type="price" class="form-control" name="s_clock_speed" value="<%= currentProduct.getsClockspeed() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Operating Frequency:</label>
					<input type="price" class="form-control" name="op_freq" value="<%= currentProduct.getOpFreq() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>MEMORY & STORAGE FEATURES</h5>
			</div>
					<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="price">Internal Storage:</label>
					<input type="text" class="form-control" name="internal_storage" value="<%= currentProduct.getInternalStorage() %>">
				</div>
			</div>
			<div class="col-md-6 pt-3">
				<div class="form-group">
					<label for="Name">RAM:</label>
					<input type="name" class="form-control" name="ram" value="<%= currentProduct.getRam() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="Name">Expandable Storage:</label>
					<input type="name" class="form-control" name="exp_storage" value="<%= currentProduct.getExpStorage() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Supported Memory Card Type:</label>
					<input type="price" class="form-control" name="supported_memory_card_type" value="<%= currentProduct.getSuppMemCardType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Call Log Memory:</label>
					<input type="price" class="form-control" name="call_log_memory" value="<%= currentProduct.getCallLogMemory() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>CAMERA FEATURES</h5>
			</div>
			<div class="col-md-4 pt-3">
				<div class="form-group">
					<label for="price">Primary Camera Available:</label>
					<input type="price" class="form-control" name="p_camera_available" value="<%= currentProduct.getpCameraAvailable() %>">
				</div>
			</div>
			<div class="col-md-4 pt-3">
				<div class="form-group">
					<label for="Name">Primary Camera:</label>
					<input type="name" class="form-control" name="p_camera" value="<%= currentProduct.getpCameraAvailable() %>"> 
				</div>
			</div>
			<div class="col-md-4 pt-3">
				<div class="form-group">
					<label for="Name">Primary Camera Features:</label>
					<input type="name" class="form-control" name="p_camera_features" value="<%= currentProduct.getpCameraAvailable() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Secondary Camera Available:</label>
					<input type="price" class="form-control" name="s_camera_available" value="<%= currentProduct.getsCameraAvail() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Secondary Camera:</label>
					<input type="price" class="form-control" name="s_camera" value="<%= currentProduct.getsCameraAvail() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Secondary Camera Features:</label>
					<input type="price" class="form-control" name="s_camera_features" value="<%= currentProduct.getsCameraFeatures() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Flash:</label>
					<input type="price" class="form-control" name="flash" value="<%= currentProduct.getFlash() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">HD Recording:</label>
					<input type="price" class="form-control" name="hd_recording" value="<%= currentProduct.getHdRecording() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Full HD Recording:</label>
					<input type="price" class="form-control" name="fhd_recording" value="<%= currentProduct.getFhdRecording() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Video Recording:</label>
					<input type="price" class="form-control" name="v_recording" value="<%= currentProduct.getvRecording() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Video Recording Resolution:</label>
					<input type="price" class="form-control" name="vr_resolution" value="<%= currentProduct.getVrResolution() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Frame Rate:</label>
					<input type="price" class="form-control" name="frame_rate" value="<%= currentProduct.getFrameRate() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>CALL FEATURES</h5>
			</div>
			<div class="col-md-12 pt-3">
				<div class="form-group">
					<label for="price">Phone Book:</label>
					<input type="price" class="form-control" name="phone_book" value="<%= currentProduct.getPhoneBook() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>CONNECTIVITY FEATURES</h5>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Network Type:</label>
					<input type="price" class="form-control" name="network_type" value="<%= currentProduct.getNetworkType() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Supported Networks:</label>
					<input type="price" class="form-control" name="s_networks" value="<%= currentProduct.getSuppNetworks() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">3G:</label>
					<input type="price" class="form-control" name="3g" value="<%= currentProduct.getThreeG() %>">
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">GPRS:</label>
					<input type="price" class="form-control" name="gprs" value="<%= currentProduct.getGprs() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Pre Installed Browser:</label>
					<input type="price" class="form-control" name="pre_i_browser" value="<%= currentProduct.getPreInstalledBrowser() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Bluetooth Support:</label>
					<input type="price" class="form-control" name="bluetooth_supp" value="<%= currentProduct.getBluetoothSupp() %>">
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Bluetooth version:</label>
					<input type="price" class="form-control" name="bluetooth_ver" value="<%= currentProduct.getBluetoothVer() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Wi-Fi:</label>
					<input type="price" class="form-control" name="wifi" value="<%= currentProduct.getWifi() %>">
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Internet Connectivity:</label>
					<input type="price" class="form-control" name="i_conn" value="<%= currentProduct.getiConn() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Wi-Fi version:</label>
					<input type="price" class="form-control" name="wifi_version" value="<%= currentProduct.getWifiVer() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">NFC:</label>
					<input type="price" class="form-control" name="nfc" value="<%= currentProduct.getNfc() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">USB Connectivity:</label>
					<input type="price" class="form-control" name="usb_conn" value="<%= currentProduct.getUsbConn() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Audio Jack:</label>
					<input type="price" class="form-control" name="audio_jack" value="<%= currentProduct.getAudioJack() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>OTHER DETAILS</h5>
			</div>
				<div class="col-md-3">
				<div class="form-group">
					<label for="price">Smart Phone:</label>
					<input type="price" class="form-control" name="smart_phone" value="<%= currentProduct.getSmartPhone() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Sim Size:</label>
					<input type="price" class="form-control" name="sim_size" value="<%= currentProduct.getSimSize() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Removable Battery:</label>
					<input type="price" class="form-control" name="remo_batt" value="<%= currentProduct.getRemoBattery() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">SMS:</label>
					<input type="price" class="form-control" name="sms" value="<%= currentProduct.getSms() %>">
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Sensors:</label>
					<TextArea type="price" class="form-control" name="sensors"><%= currentProduct.getSensors() %></TextArea>
				</div>
			</div>
				<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Other Features:</label>
					<TextArea type="price" class="form-control" name="other_features"><%= currentProduct.getOtherFeatures() %></TextArea>
				</div>
			</div>
			<div class="col-md-4 ">
				<div class="form-group">
					<label for="price">Important Apps:</label>
					<input type="price" class="form-control" name="imp_apps" value="<%= currentProduct.getImpApps() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>MULTIMEDIA FEATURES</h5>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Audio Formats:</label>
					<input type="price" class="form-control" name="audio_formats" value="<%= currentProduct.getAudioFormats() %>">
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Video Formats:</label>
					<input type="price" class="form-control" name="video_formats" value="<%= currentProduct.getVideoFormats() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>BATTERY & POWER FEATURES</h5>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Battery Capacity:</label>
					<input type="price" class="form-control" name="batt_capacity" value="<%= currentProduct.getBattCapacity() %>">
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group">
					<label for="price">Battery Type:</label>
					<input type="price" class="form-control" name="batt_type" value="<%= currentProduct.getBattType() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>DIMENSIONS</h5>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Width:</label>
					<input type="price" class="form-control" name="width" value="<%= currentProduct.getWidth() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Height:</label>
					<input type="price" class="form-control" name="height" value="<%= currentProduct.getHeight() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Depth:</label>
					<input type="price" class="form-control" name="depth" value="<%= currentProduct.getDepth() %>">
				</div>
			</div>
			<div class="col-md-3">
				<div class="form-group">
					<label for="price">Weight:</label>
					<input type="price" class="form-control" name="weight" value="<%= currentProduct.getWeight() %>">
				</div>
			</div>
			<div class="col-md-12 pt-3">
				<h5>WARRANTY</h5>
			</div>
			<div class="col-md-12 pt-2">
				<div class="form-group">
					<label for="price">Warranty Summary:</label>
					<TextArea type="price" class="form-control" name="warranty_summ"><%= currentProduct.getWarrantySum() %></TextArea>
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
