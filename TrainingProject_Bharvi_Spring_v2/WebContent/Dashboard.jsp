<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="com.tadigital.mvc.entity.Customer"%>
<% 
	Customer c = (Customer)session.getAttribute("CUSTOMERDATA");
	if(c ==null){
		response.sendRedirect("index.jsp");
	}
%>
<%@ include file="HeaderCustomer.jsp" %>
	
	<div class="container-fluid" id="middle-container">
		<ul>
			<li style="float:left;font-size:35px;" class="pl-5"><b>DASHBOARD</b></li>
		</ul>
		<ul>
			<li><a href="/">Home </a></li>
		</ul>
	</div>

<!-- main content starts -->
	<div class="container pt-4 pb-4" style="min-height:400px;">
		<h1 class="mb-4" style="font-weight:lighter">Dashboard</h1>
		<div class="row">
			<div class="col-md-4">
				  <a href="CustomerAccount.jsp">
					<div class="card bg-light">
						 <div class="card-body text-center">
						     <i class="fas fa-user mb-3" style="font-size: 2em;"></i>
						      <p class="card-text">View Profile</p>
						 </div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				  <a href="#">
					<div class="card bg-light">
						 <div class="card-body text-center">
						     <i class="fas fa-shopping-bag mb-3" style="font-size: 2em;"></i>
						      <p class="card-text">My Orders</p>
						 </div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				  <a href="shop">
					<div class="card bg-light">
						 <div class="card-body text-center">
						     <i class="fas fa-cart-arrow-down mb-3" style="font-size: 2em;"></i>
						      <p class="card-text">Shop</p>
						 </div>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- main content ends -->
	
	<!-- footer starts -->
			
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h5>ABOUT US</h5>
					<br>
					<p>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries</p>
					<form class="form-inline">
						<div class="input-group">
							<input class="form-control" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-success btn-sm"><i class="fas fa-paper-plane"></i></button>
						</div>
					</form>
				</div>
				<hr>
				<div class="col-md-3 col-sm-4">
					<div class="blog-section center">
						<h5>BLOG</h5>
						<br>
						<ul>
							<li><a href="https://placeholder.com"><img src="https://via.placeholder.com/30x30"></a> &nbsp Sample Link</li>
							<br>
							<li><a href="https://placeholder.com"><img src="https://via.placeholder.com/30x30"></a> &nbsp Sample Link</li>
							<br>
							<li><a href="https://placeholder.com"><img src="https://via.placeholder.com/30x30"></a> &nbsp Sample Link</li>
						</ul>
					</div>
				</div>
				<div class="col-md-3">
					<div class="contact-section center">
						<h5>CONTACT</h5>
						<br>
						<ul>
							<li>Sample Link</li>
							<li>Sample Link</li>
							<li>Sample Link</li>
						</ul>
						<button type="submit" class="btn btn-primary btn-md">GO TO CONTACT PAGE</button>
					</div>
				</div>
				<div class="col-md-2 col-sm-4 d-none d-sm-block  ">
					<div class="contact-section">
						<div class="row" style="padding-bottom:2px;">
							<div class="col-md-4 col-sm-4">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-6">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-6">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
							<br>
							<br>
							<br>
							<div class="col-md-4 col-xs-6">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
							<div class="col-md-4 col-xs-6">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
							<div class="col-md-4 col-xs-6">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
							<br>
							<br>
							<br>
							<div class="col-md-4 col-xs-12">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
							<div class="col-md-4 col-xs-12">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
							<div class="col-md-4 col-xs-12">
								<a href="https://placeholder.com"><img src="https://via.placeholder.com/50x50"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 center" style="background:#333333;color:#fff;height:auto;line-height:100px;">
				<p>copyright  &copy 2018 TechAspect Solutions Pvt. Ltd. </p>
			</div>
		</div>
	</div>
	<!-- footer ends -->
		<script src="js/jquery-3.3.1.js"></script>
		<script src="js/bootstrap.js"></script>
	</body>
</html>
