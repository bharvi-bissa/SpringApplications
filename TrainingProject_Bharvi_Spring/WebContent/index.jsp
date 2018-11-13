<%@page import="com.techaspect.entity.Customer"%>
<% 
/* 	Cookie[] allCookies = request.getCookies();
	if(allCookies != null) {
		for(Cookie cookie : allCookies) {
			String name = cookie.getName();
			if(name.equals("bb_webapp")) {
				String cValue = cookie.getValue();
				
				session.setAttribute("email", cValue);
				
				response.sendRedirect("LoginProcess.jsp");
				
				break;
			}
		}
	} */
	Customer customer = (Customer)session.getAttribute("CUSTOMERDATA");
	if(customer != null){
	response.sendRedirect("Dashboard.jsp");
}
%>

<%@ include file="HeaderCustomer.jsp" %>
	
	<div class="container-fluid" id="middle-container">
		<ul>
			<li><a href="">Home </a></li>
			<li><a href="">New Account </a>/</li>
			<li><a href="">Login </a>/</li>
		</ul>
	</div>
	
	<!-- main-section starts -->
	<div class="container main-section pt-4">
		<%
			if((String)session.getAttribute("success") != null){
				%>
				<p class="alert alert-success"> Successfully Registered !</p>
				<%session.removeAttribute("success");}
			if((String)session.getAttribute("errors") != null){
			%>
			<p class="alert alert-danger"> <%=(String)session.getAttribute("errors") %></p>
			<%session.removeAttribute("success");session.removeAttribute("errors");}
		%>
		<div class="row">
			<div class="col-md-6">
				<div class="new_account_section">
					<h2><b>NEW ACCOUNT</b></h2>
					<br>
					<p>Not our registered customer yet ? </p>
					<br>
					<p>Lorem Ipsum has been the industry galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially </p>
					<form action="SignUpProcessServlet" method="post">
					 <div class="form-group">
					    <label for="email">Email address <span id="msg_email" class="alert-danger" ></span></label>
					    <input type="email" class="form-control" id="email_signup" name="email" onblur="validateEmailField()">
					  </div>
					  <div class="form-group">
					    <label for="pwd">Name:<span id="msg_name" class=""></span></label>
					    <input type="Name" class="form-control" id="name_signup" name="name" onblur="validateNameField()">
					  </div>
					  <div class="form-group">
					    <label for="pwd">Password:<span id="msg_password" class=""></span></label>
					    <input type="password" class="form-control" id="pwd_signup" name="password" onblur="validatePassField()">
					  </div>
					  <button type="submit" class="btn btn-primary" value="Send Message" id="button-signup"><i class="fas fa-user"></i>&nbsp; Register</button>
					</form>
					<hr>
				</div>
			</div>
			<div class="col-md-6">
				<div class="login_section">
					<h2><b>LOGIN</b></h2>
					<br>
					<p>Already Our customer ?</p>
					<br>
					<p>Get Access to your orders and other stuff</p>
					<form action="LoginServlet" method="post">
					 <div class="form-group">
					    <label for="email">Email address <span id="msg_email_login" class="alert-danger" ></span>: </label>
					    <input type="email" class="form-control" id="email_login" name="email" onblur="validateEmailField2()">
					  </div>
					  <div class="form-group">
					    <label for="pwd">Password <span id="msg_pwd_login" class="alert-danger" ></span>:</label>
					    <input type="password" class="form-control" id="pwd_login" name="password" onblur="validatePasswordField2()" >
					  </div>
					  <button type="submit" class="btn btn-primary" id="button-login" value="login"><i class="fas fa-sign-in-alt"></i> Login</button>
					</form>
					<br>
					<hr>
				</div>
			</div>
		</div>
	</div>
	<!-- main-section ends -->
	<script src="js/main.js"></script>
<%@ include file="footer.html" %>
