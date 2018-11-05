<%@page import="java.util.Iterator"%>
<%@page import="com.tadigital.mvc.entity.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tadigital.mvc.entity.Vendor"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@include file="VendorHeader.jsp"%>
<%
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
%>

<%
	Vendor v = (Vendor)session.getAttribute("VENDORDATA");
	if(v == null){
		response.sendRedirect("VendorLoginForm.jsp");
	}
%>


<%@page  %>
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
		ServletContext sc = request.getServletContext();
		ArrayList<Product> productList = (ArrayList)sc.getAttribute("PRODUCTLIST");
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
				      <td><a class="btn btn-default" style="background:none;color:#4fbfa8;" href="deleteproduct<%= product.getId() %>"><i class="fas fa-trash" ></i></a></td>
				      <td><a class="btn btn-default" style="background:none;color:#4fbfa8;" href="productedit<%= product.getId() %>"><i class="fas fa-edit" ></i></a></td>
				    </tr>
					<% count++; } %>
				</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- main content ends -->
	
	<%@ include file="footer.html" %>