<%@page import="com.techaspect.entity.Address"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techaspect.entity.Customer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection,java.util.Iterator"%>

	<%!
		String fname="";
		String lname = "";
		String contact = "";
		String email = "";
		String city = "";
		String gender = "";
		String zip = "";
		String country = "";
		String state = "";
		String addressValue = "";
		Integer id;
	%>
	
	<%
		Customer customer = (Customer)session.getAttribute("CUSTOMERDATA");	
		Address address = 	(Address)session.getAttribute("ADDRESSDATA");	
			if(customer ==null){
				session.setAttribute("errors","Please login first !");
				response.sendRedirect("index.jsp");
			}else{
			
			/* Class.forName("com.mysql.jdbc.Driver");
			
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
			
			Statement stmt_customer = con.createStatement();
			Statement stmt_address = con.createStatement(); */
			
			//String sql = "SELECT * FROM customer_information WHERE cust_id="+customer.getId();
			String addr_query = "SELECT * FROM address_information WHERE cust_id="+customer.getId();
			//System.out.println(sql);
			
			//ResultSet rs_customer = stmt_customer.executeQuery(sql);
			//ResultSet rs_address = stmt_address.executeQuery(addr_query);
			
			//rs_customer.next(); 
			System.out.println("pass:"+customer.getPassword());
			gender = customer.getGender();
			 if(gender == null || gender.isEmpty() ){
				 gender = "";
			 }
			 
			 if(customer.getLastName() == null || customer.getLastName().isEmpty() ){
				 lname = "";
			 }
			 
			 if(customer.getEmail() == null || customer.getEmail().isEmpty() ){
				 email = "";
			 }
			 
			 if(address.getCountry() == null){
				 country = "";
			 }
			 
			 if(address.getState() == null || address.getState().isEmpty()){
				 state = "";
			 }
			 
			 if(address.getZip() == null || address.getZip().isEmpty()){
				 zip = "";
			 }else{
				 zip = address.getZip();
			 }
			 
			 if(contact == null || contact.isEmpty() ){
				 contact = "";
			 }
			 
			if (address !=null) {
					country = address.getCountry();
					city = address.getCity();
					zip = address.getZip();
					state = address.getState();
					addressValue = address.getAddress();
				}
	%>
<body>
	<%@ include file="HeaderCustomer.jsp" %>
	
	<div class="container-fluid" id="middle-container">
		<ul>
			<li style="float:left;font-size:35px;" class="pl-5"><b>MY ACCOUNT</b></li>
		</ul>
		<ul>
			<li><a href="">Home </a></li>
			<li><a href="">My Account </a>/</li>
		</ul>
	</div>
	
	<!-- main-section starts -->
	<div class="container">
		<div class="password_container">
		<h2 style="margin-top:2%;font-weight:lighter">Change your personal details or password here.</h2>
		<br><br>
		<%
			if((String)session.getAttribute("success")!=null){
				%>
				<p class="alert alert-success"><%= (String)session.getAttribute("success") %></p>
		<% 	session.removeAttribute("success");	}
		if((String)session.getAttribute("errors")!=null){
			%>
			<p class="alert alert-danger"><%= (String)session.getAttribute("errors") %></p>
	<%session.removeAttribute("errors");	}
	%>
		<h3>CHANGE PASSWORD</h3>
		<p>Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum</p>
			<div class="row">
				<div class="col-md-9">
					<form action="ChangePassword" method="post">
						<div class="row">
							<div class="col-md-4">
								<label for="pwd">Old Password:</label>
								<input type="password" class="form-control" id="pwd" name="old_password">
							</div>
						</div>	
						<div class="row">
							<div class="col-md-4">
								<label for="pwd">New Password:</label>
								<input type="password" class="form-control" id="pwd" name="password">
							</div>
						<div class="col-md-4">
							<label for="pwd">Retype new Password:</label>
							<input type="password" class="form-control" id="pwd" name="new_password">
						</div>
						</div>
					<br>
						<div class="row">
							<div class="col-md-3 center">
								<button type="submit" class="btn btn-primary"><i class="fas fa-user"></i>&nbsp; SAVE NEW PASSWORD</button>
							</div>
						</div>
					</form>
					<hr>
					<br><br>
					<h2>PERSONAL DETAILS</h2>
					<hr>
					<form action="UpdateAccount" method="post">
					<div class="row">
						<div class="col-md-4">
							<label for="firstname">First Name</label>
							<input type="text" class="form-control" id="" name="fname" value=<%= customer.getFirstName() %> >
						</div>
						<div class="col-md-4">
							<label for="lastname">Last Name</label>
							<input type="text" class="form-control" id="" name="lname" value=<%= customer.getLastName() %> >
						</div>
					</div>
					<br>
					<% if(gender.equals("male")){ %>
					<div class="row">
						<div class="col-md-9">
							<label for="gender">Gender:</label>
							<div class="form-check">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="gender" value="male" checked>Male
							  </label>
							</div>
							<div class="form-check">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="gender" value="female">Female
							  </label>
							</div>
							<div class="form-check">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="gender" value="transgender">Transgender
							  </label>
							</div>
						</div>
					</div>
					<% }else if(gender.equals("female")){ %>
						<div class="row">
						<div class="col-md-9">
							<label for="gender">Gender:</label>
							<div class="form-check">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="gender" value="male" >Male
							  </label>
							</div>
							<div class="form-check">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="gender" value="female" checked>Female
							  </label>
							</div>
							<div class="form-check disabled">
							  <label class="form-check-label">
							    <input type="radio" class="form-check-input" name="gender" value="transgender">Transgender
							  </label>
							</div>
						</div>
					</div>
					<% }else if(gender.equals("transgender")) {%>
						<div class="row">
							<div class="col-md-9">
								<label for="gender">Gender:</label>
								<div class="form-check">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="gender" value="male">Male
								  </label>
								</div>
								<div class="form-check">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="gender" value="female" checked>Female
								  </label>
								</div>
								<div class="form-check disabled">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" checked name="gender" value="trnasgender">Transgender
								  </label>
								</div>
							</div>
						</div>
					<% }else{ %>
						<div class="row">
							<div class="col-md-9">
								<label for="gender">Gender:</label>
								<div class="form-check">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="gender" value="male">Male
								  </label>
								</div>
								<div class="form-check">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="gender" value="female">Female
								  </label>
								</div>
								<div class="form-check disabled">
								  <label class="form-check-label">
								    <input type="radio" class="form-check-input" name="gender" value="transgender">Transgender
								  </label>
								</div>
							</div>
						</div>
					<% } %>
					<br>
					<div class="row">
						<div class="col-md-9">
							<label for="Address">Address:</label>
							<TextArea class="form-control" name="address"><%= addressValue %></TextArea>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-2">
							<label for="address">City:</label>
							<input type="text" class="form-control" id="" name="city" value=<%= city %>>
						</div>
						<div class="col-md-2">
							<label for="address">Zip:</label>
							<input type="text" class="form-control" id="" name="zip" value=<%= zip %>>
						</div>
						
						<% 
							
							%>
							<div class="col-md-3">
								<div class="form-group">
								  <label for="state">State:</label>
								  <select class="form-control" id="" name="state">
								  	<option selected ><%= state %></option>
								    <option >Rajasthan</option>
								    <option >Gujarat</option>
								    <option >Maharashtra</option>
								    <option >Telangana</option>
								  </select>
								</div>
							</div>
						
							
						
						<div class="col-md-2.5">
							<div class="form-group">
							  <label for="state">Country:</label>
							  <select class="form-control" id="" name="country">
							  	<option selected><%= country %></option>
							    <option selected>India</option>
							    <option>Europe</option>
							  </select>
							</div>
						</div>
						
					</div>
					<div class="row">
						<div class="col-md-4">
							<label for="Contact">Contact Number:</label>
							<input type="text" class="form-control" id="" name="contact" value=<%= customer.getContact() %>>
						</div>
						<div class="col-md-5">
							<label for="email">Email:</label>
							<input type="text" class="form-control" id="" name="email" value=<%= customer.getEmail() %>>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-9 center">
							<button type="submit" class="btn btn-primary btn-sm" value="Send Message"><i class="fas fa-user"></i>&nbsp; SAVE CHANGES</button>
						</div>
					</div>
					</form>
				</div>
				<div class="col-md-3 customer_section">
					<h4>CUSTOMER SECTION</h4>
					<hr>
					<ul>
						<li><a href=""><i class="fas fa-bars"></i>&nbsp; My Orders</a></li>
						<li><a href=""><i class="fas fa-heart"></i>&nbsp; My Wishlist</a></li>
						<li><a href=""><i class="fas fa-user"></i>&nbsp; My Account</a></li>
						<li><a href=""><i class="fas fa-sign-out-alt"></i>&nbsp; Logout</a></li>
					</ul>
				</div>
			</div>		  
		</div>
	</div>
	
	<!-- main-section ends -->
	
	<%@ include file="footer.html" %>
<% } %>