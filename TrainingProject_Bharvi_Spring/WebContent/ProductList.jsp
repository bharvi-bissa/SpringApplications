<%@page import="java.util.Iterator"%>
<%@page import="com.techaspect.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techaspect.entity.Vendor"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
%>

<%
	Vendor vendor = (Vendor)session.getAttribute("VENDORDATA");
	if(vendor == null){
		response.sendRedirect("VendorLoginForm.jsp");
	}
	Class.forName("com.mysql.jdbc.Driver");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
	
	stmt = con.createStatement();
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
	<div class="container pt-4 pb-4" style="min-height:400px;">
		<h1 class="mb-4" style="font-weight:lighter">Product List</h1>
		<%
		ArrayList<Product> productList = (ArrayList)session.getAttribute("PRODUCTLIST");
			if((String)session.getAttribute("success")!=null){
				%>
				<p class="alert alert-success"><%= (String)session.getAttribute("success") %></p>
		<%session.removeAttribute("success");	}
			
		
		%>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-lg">
				  <thead>
				    <tr>
				      <th scope="col">ID</th>
				      <th scope="col">Name</th>
				      <th scope="col">Price</th>
				      <th scope="col">Quantity</th>
				      <th scope="col">Description</th>
				      <th scope="col">&nbsp;</th>
				      <th scope="col">&nbsp;</th>
				    </tr>
				  </thead>
				  <tbody>
				<%
				/* 	String sql_fetch = "SELECT * FROM product_information WHERE vendor_id="+vendor.getId();
					rs = stmt.executeQuery(sql_fetch);
					while(rs.next()){ */
						int count=0;
						Iterator<Product> iterator =productList.iterator();
		  			while(iterator.hasNext()) {
		  				Product product = iterator.next();
		  					
				%>
					<tr>
				      <td><%= product.getId() %></td>
				      <td><%= product.getName() %></td>
				      <td><%= product.getPrice() %></td>
				      <td><%= product.getQuantity() %></td>
				      <td><%= product.getDescription() %></td>
				      <td><a class="btn btn-default" style="background:none;color:#4fbfa8;" href="DeleteProductServlet?id=<%= product.getId() %>&index=<%= count %>"><i class="fas fa-trash" ></i></a></td>
				      <td><a class="btn btn-default" style="background:none;color:#4fbfa8;" href="ProductEdit.jsp?id=<%= product.getId() %>&index=<%= count %>"><i class="fas fa-edit" ></i></a></td>
				    </tr>
					<% count++; } %>
				</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- main content ends -->
	
	<%@ include file="footer.html" %>