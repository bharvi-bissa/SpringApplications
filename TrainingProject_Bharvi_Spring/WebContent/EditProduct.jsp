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
	<div class="container pt-4 pb-4" style="min-height:800px;">
		<%
			if((String)session.getAttribute("error_edit_product") !=null){
				%>
				<p class="alert alert-danger"><%= (String)session.getAttribute("error_insert_product") %></p>
			<% } session.removeAttribute("error_edit_product"); 
			
			String id_vendor=request.getParameter("id");
			
			
			
			id = request.getParameter("id");
			
			try{
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
			
			stmt = con.createStatement();
			String sql = "SELECT * FROM product_information WHERE product_id='"+id+"'";
			
			rs  = stmt.executeQuery(sql);
				if(rs.next()){
					
					name = rs.getString("product_name");	
					price = rs.getString("product_price");
					quantity = rs.getString("product_quantity");
					description = rs.getString("product_description");
					image1 = rs.getString("product_image1");
					image2 = rs.getString("product_image2");
					image3 = rs.getString("product_image3");
					image4 = rs.getString("product_image4");
					image5 = rs.getString("product_image5");
				}
			}
			catch(ClassNotFoundException cnfe) {
				cnfe.printStackTrace();
			}catch(SQLException sqle) {
				sqle.printStackTrace();
			}finally {
				try {
					if(rs !=null) {
						rs.close();
					}
					if(stmt !=null) {
						stmt.close();
					}
					if(con !=null) {
						con.close();
					}
				}catch(SQLException sqle) {
					sqle.printStackTrace();
				}
			}
		
			
		%>
		<h1 class="mb-4" style="font-weight:lighter">Update product.</h1>
		<div class="row">
			<div class="col-md-6">
				<form action="EditProductProcess.jsp?id=<%= id %>" method="post" enctype="multipart/form-data">
					<div class="form-group">
						 <label for="Name">Name:</label>
						<input type="name" class="form-control" name="product_name" value="<%= name %>">
					</div>
					<div class="form-group">
						 <label for="price">Price:</label>
						<input type="price" class="form-control" name="product_price" value="<%= price %>">
					</div>
					<div class="form-group">
						<select name="product_quantity" class="form-control">
							<option selected><%= quantity %></option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</div>
					<div class="form-group">
						 <label for="description">Description:</label>
						<TextArea type="description" class="form-control" name="product_description"><%= description %></TextArea>
					</div>
					<div class="form-group">
						<Button class="btn btn-primary btn-lg" type="submit">Update Product</Button>
					</div>
			</div>
			<div class="col-md-6">
				<div class="row mb-3">
					<div class="col-md-3">
						<img src="images/uploads/<%= image1 %>" height="70" width="70">
					</div>
					<div class="col-md-5">
						<div class="form-group">
						    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="product_image1" value=<%= image1 %>>
				  		</div>
				  		<input type="hidden" name="img1" value=<%= image1 %>>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-3">
						<img src="images/uploads/<%= image2 %>" height="70" width="70">
					</div>
					<div class="col-md-5 ">
						<div class="form-group">
						    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="product_image2" value=<%= image2 %>>
				  		</div>
				  		<input type="hidden" name="img2" value=<%= image2 %>>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-3">
						<img src="images/uploads/<%= image3 %>" height="70" width="70">
					</div>
					<div class="col-md-5">
						<div class="form-group">
						    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="product_image3" value=<%= image3 %>>
				  		</div>
				  		<input type="hidden" name="img3" value=<%= image3 %>>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-3">
						<img src="images/uploads/<%= image4 %>" height="70" width="70">
					</div>
					<div class="col-md-5">
						<div class="form-group">
						    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="product_image4" value=<%= image4 %>>
				  		</div>
				  		<input type="hidden" name="img4" value=<%= image4 %>>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col-md-3">
						<img src="images/uploads/<%= image5 %>" height="70" width="70" >
					</div>
					<div class="col-md-5 ">
						<div class="form-group">
						    <input type="file" class="form-control-file" id="exampleFormControlFile1" name="product_image5" value=<%= image5 %>>
				  		</div>
				  		<input type="hidden" name="img5" value=<%= image5 %>>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>

	<!-- main content ends -->
	<%@ include file="footer.html" %>
	
