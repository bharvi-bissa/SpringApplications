
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
		    	String email = (String)session.getAttribute("cust_email") ;
		    	if(email == null){
		    
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
		        	<a class="nav-link" href="CustomerAccount.jsp"><i class="fas fa-user-plus"></i> &nbsp PROFILE</a>
		      	</li>
		      	<li class="nav-item">
		        	<a class="nav-link" href="#"><i class="fas fa-user-plus"></i> &nbsp LOGOUT</a>
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
	 
	<!-- upper navbar ends-->
	
	<!-- main-navbar starts -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%;">
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
	
	<div class="container-fluid " id="middle-container">
		<ul >
			<!-- <li  style="float:left;padding-left:5%;"><h1 style="line-height:4;">CHECKOUT - ADDRESS</h1></li> -->
			<li class="d-none d-sm-block"><a href="">HOME </a></li>
			<li class="d-none d-sm-block"><a href="">SHOPPING CART </a>/</li>
		</ul>
	</div>
	<!-- main-content starts -->
	<div class="container" style="min-height: 850px;width:100%;	">
		<div class="row pt-4">
			<div class="col-md-8 col-xs-12">
	            <nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-item nav-link active" id="nav-address-tab" data-toggle="tab" href="#nav-address" role="tab" aria-controls="nav-address" aria-selected="true" style="height: 100px;line-height: 100px;width: 25%;text-align:center">Address</a>
				    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-delivery" role="tab" aria-controls="nav-delivery" aria-selected="false" style="height: 100px;line-height: 100px;width: 25%;text-align:center">Delivery Method</a>
				    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-payment" role="tab" aria-controls="nav-payment" aria-selected="false" style="height: 100px;line-height: 100px;width: 25%;text-align:center">Payment Method</a>
				  	<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-review" role="tab" aria-controls="nav-review" aria-selected="false" style="height: 100px;line-height: 100px;width: 25%;text-align:center">Order Review</a>
				  </div>
				  <hr>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show active pt-4" id="nav-address" role="tabpanel" aria-labelledby="nav-home-tab">
				  	<div class="row">
					  	<div class="col-md-6">
					  		<div class="form-group">
						    <label for="fname">First Name:</label>
						    <input type="fname" class="form-control" id="fname" name="fname">
						  </div>
					  	</div>
					  	<div class="col-md-6">
					  		<div class="form-group">
						    <label for="lname">Last Name:</label>
						    <input type="lname" class="form-control" id="lname" name="lname">
						  </div>
					  	</div>
				  	</div>
				  	<div class="row">
				  		<div class="col-md-12">
				  			<div class="form-group">
						    	<label for="lname">Address:</label>
						    	<TextArea class="form-control" name="address"></TextArea>
						  	</div>
				  		</div>
				  	</div>
				  	 <div class="row">
					  	<div class="col-md-3">
					  		<div class="form-group">
						    	<label for="address">City:</label>
								<input type="text" class="form-control" id="" name="city">
							</div>
					  	</div>
					  	<div class="col-md-3">
					  		<div class="form-group">
							    <label for="address">Zip:</label>
								<input type="text" class="form-control" id="" name="zip">
							</div>
					  	</div>
					  	<div class="col-md-3">
					  		<div class="form-group">
							    <label for="state">State:</label>
								  <select class="form-control" id="" name="state">
								  	<option>Select State</option>
								    <option>Rajasthan</option>
								    <option>Gujarat</option>
								    <option>Maharashtra</option>
								    <option>Telangana</option>
								  </select>
							</div>
					  	</div>
					  	<div class="col-md-3">
					  		<div class="form-group">
						      <label for="state">Country:</label>
							  <select class="form-control" id="" name="country" selected=rs_address.nextString(7)>
							  	<option>Select Country</option>
							    <option>India</option>
							    <option>Europe</option>
							    <option>Australia</option>
							    <option>Africa</option>
							  </select>
							</div>
					  	</div>
				  	</div>
					  	<div class="row">
					  		<div class="col-md-6">
					  			<label for="contact">Contact Number:</label>
								<input type="contact" class="form-control" id="" name="contact">
					  		</div>
					  		<div class="col-md-6">
					  			<label for="email">Email:</label>
								<input type="text" class="form-control" id="" name="email">
					  		</div>
					  	</div>
					  	<br>
				  		<div class="row">
				  			<div class="col-md-4 pt-2 col-xs-6 col-sm-6">
				  				<Button class="btn btn-primary"><b><</b>&nbsp; BACK TO SHOPPING</Button>
				  			</div>
				  			<div class="col-md-2 pt-2 col-xs-6 col-sm-6 offset-md-4 mb-2">
				  				<Button class="btn btn-primary">PROCEED TO CHECKOUT &nbsp; <b>></b></Button>
				  			</div>
				  		</div>
				  	</div>
				  <div class="tab-pane fade pt-4" id="nav-delivery" role="tabpanel" aria-labelledby="nav-delivery-tab">
					  	<div class="row">
				  		<div class="col-md-6">
				  			<div class="card" style="border-top:1px solid lightgrey">
							  <div class="card-body ">
							    <h5 class="card-title">USPS NEXT DAY</h5>
							    <p class="card-text">Get it right on next day - fastest option possible.</p>
							    <div class="text">
							    	<div class="form-check text-center">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="paypal">
									  </label>
									</div>
							    </div>
							  </div>
							  <hr>
							</div>
				  		</div>
				  		<div class="col-md-6">
				  			<div class="card" style="border-top:1px solid lightgrey">
							  <div class="card-body ">
							    <h5 class="card-title">USPS NEXT DAY</h5>
							    <p class="card-text">Get it right on next day - fastest option possible.</p>
							    <div class="text">
							    	<div class="form-check text-center">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="paypal">
									  </label>
									</div>
							    </div>
							  </div>
							  <hr>
							</div>
				  		</div>
				  		<div class="col-md-6 mt-3">
				  			<div class="card" style="border-top:1px solid lightgrey">
							  <div class="card-body ">
							    <h5 class="card-title">USPS NEXT DAY</h5>
							    <p class="card-text">Get it right on next day - fastest option possible.</p>
							    <div class="text">
							    	<div class="form-check text-center">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="paypal">
									  </label>
									</div>
							    </div>
							  </div>
							  <hr>
							</div>
				  		</div>
				  	</div>
				  </div>
				  <div class="tab-pane fade pt-4" id="nav-payment" role="tabpanel" aria-labelledby="nav-payment-tab">
				  	  	<div class="row">
				  		<div class="col-md-6">
				  			<div class="card" style="border-top:1px solid lightgrey">
							  <div class="card-body ">
							    <h5 class="card-title">PAYPAL</h5>
							    <p class="card-text">We like it all.</p>
							    <div class="text">
							    	<div class="form-check text-center">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="paypal">
									  </label>
									</div>
							    </div>
							  </div>
							  <hr>
							</div>
				  		</div>
				  		<div class="col-md-6">
				  			<div class="card" style="border-top:1px solid lightgrey">
							  <div class="card-body ">
							    <h5 class="card-title">PAYMENT GATEWAY</h5>
							    <p class="card-text">Visa and mastercard only.</p>
							    <div class="text">
							    	<div class="form-check text-center">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="paypal">
									  </label>
									</div>
							    </div>
							  </div>
							  <hr>
							</div>
				  		</div>
				  		<div class="col-md-6 mt-3">
				  			<div class="card" style="border-top:1px solid lightgrey">
							  <div class="card-body ">
							    <h5 class="card-title">CASH ON DELIVERY</h5>
							    <p class="card-text">Visa and mastercard only.</p>
							    <div class="text">
							    	<div class="form-check text-center">
									  <label class="form-check-label">
									    <input type="radio" class="form-check-input" name="paypal">
									  </label>
									</div>
							    </div>
							  </div>
							  <hr>
							</div>
				  		</div>
				  	</div>
				  </div>
				  <div class="tab-pane fade pt-4" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">
				  	<div class="col-md-12">
				  		<table class="table table-lg	">
						  <thead>
						    <tr>
						      <th scope="col">Product</th>
						      <th scope="col">Quantity</th>
						      <th scope="col">Unit Price</th>
						      <th scope="col">Discount</th>
						      <th scope="col">Total</th>
						    </tr>
						  </thead>
						  <tbody>
						    <tr>
						      <td><img src="images/product1.jpg" height="60px" width="60px">&nbsp; &nbsp; &nbsp;White Blouse Armani</td>
						      <td>5</td>
						      <td>$0.00</td>
						      <td>$246.00</td>
						      <td>$151.00</td>
						    </tr>
						     <tr>
						      <td><img src="images/product1.jpg" height="60px" width="60px">&nbsp; &nbsp; &nbsp;White Blouse Armani</td>
						      <td>6</td>
						      <td>$0.00</td>
						      <td>$246.00</td>
						      <td>$151.00</td>
						    </tr>
						    <tr>
						    	<td><b>Total</b></td>
						    	<td></td>
						    	<td></td>
						    	<td></td>
						    	<td><b>$454.00</b></td>
						    </tr>
						  </tbody>
						</table>
						
			 			<div class="row">
							<div class="col-md-4 pt-2 col-xs-6 col-sm-6">
							  	<Button class="btn btn-primary"><b><</b>&nbsp; BACK TO SHOPPING</Button>
							 </div>
							 <div class="col-md-2 pt-2 col-xs-6 col-sm-6 offset-md-4">
							  	<Button class="btn btn-primary">PROCEED TO CHECKOUT &nbsp; <b>></b></Button>
							 </div>
						</div>
				  	</div>
				  </div>
				</div>
	        </div>
	        
	     
	    
			<div class="col-md-4">
				<div class="card text-center">
				  <div class="card-header">
				    <b>ORDER SUMMARY</b>
				  </div>
 				</div>
				<div class="row" style="padding:5%;">
					<p>Lorem Ipsum has been the industry's standard dummy text ever.Lorem Ipsum has been the industry's standard dummy text ever.</p>
				</div>
				
				<table class="table table-lg">
					<tr>
						<td>Order SubTotal</td>
						<td><b>$440.00</b></td>
					</tr>
					<tr>
						<td>Shipping & Handling</td>
						<td><b>$10.00</b></td>
					</tr>
					<tr>
						<td>Tax</td>
						<td><b>$0.00</b></td>
					</tr>
					<tr>
						<td><h5><b>Total</h5></b></td>
						<td><b>$456.00</b></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- main-content ends  -->
<%@ include file="footer.html" %>