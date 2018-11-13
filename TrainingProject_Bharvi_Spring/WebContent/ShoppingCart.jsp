<%@page import="java.util.List"%>
<%@page import="com.techaspect.entity.Product"%>

<% Customer customer = (Customer)session.getAttribute("CUSTOMERDATA"); %>
<%@ include file="HeaderCustomer.jsp" %>
	
	<div class="container-fluid " id="middle-container">
		<ul>
			<li style="float:left;font-size:35px;" class="pl-5"><b>SHOPPING CART</b></li>
		</ul>
		<ul>
			<li class="d-none d-sm-block"><a href="">HOME </a></li>
			<li class="d-none d-sm-block"><a href="">SHOPPING CART </a>/</li>
		</ul>
	</div>
	<% List<Product> cart = (List)session.getAttribute("CART");   int cartSize=cart.size(); int index=0; int total=0;int subTotal=0;%>
	<!-- main-content starts -->
	<div class="container" style="min-height: 850px;">
		<div class="col-md-12">
			<% if(session.getAttribute("success")!=null){ %>
      		<p class="alert alert-success mt-4"><%= session.getAttribute("success") %></p>
      	<% session.removeAttribute("success"); } %>
			<div class="row" style="padding-top:2%;">
				<h5 style="font-weight:lighter">You have <%= cart.size() %> item(s) in your cart.</h5>
				<br>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-xs-12">
				<% if(cartSize !=0){ %>
				<table class="table table-lg table-responsive-sm">
				  <thead>
				    <tr>
				      <th scope="col">Product</th>
				      <th scope="col">Quantity</th>
				      <th scope="col">Unit Price</th>
				      <th scope="col">Discount</th>
				      <th scope="col">&nbsp;</th>
				    </tr>
				  </thead>
				  <tbody>
				 <% 
					for(Product product : cart) {
						
				%>
					<tr>
				      <td><img src="images/uploads/<%= product.getImage1() %>" height="60px" width="60px">&nbsp; &nbsp; &nbsp;<%= product.getName() %></td>
				      <td><input type="number" name="qty"></td>
				      <td>&#x20B9;<%= product.getPrice() %></td>
				      <td>&#x20B9;0</td>
				      <td><a href="removefromcart?id=<%= product.getId() %>&jsp=ShoppingCart&index=<%= index %>" class="btn btn-default" style="background:none;color:#4fbfa8;"><i class="fas fa-trash" ></Button></td>
				    </tr>
				    <% 
				    	index++;
				    	subTotal=subTotal+Integer.parseInt(product.getPrice());
				    	} 
					%>
				  </tbody>
				</table>
				<% } %>
 				<br><br>
	 			<div class="row">
					<div class="col-md-4 pt-2 col-xs-6 col-sm-6">
					  	<Button class="btn btn-primary"><b><</b>&nbsp; BACK TO SHOPPING</Button>
					 </div>
					 <div class="col-md-2 pt-2 col-xs-6 col-sm-6 offset-md-3">
					  	<Button class="btn btn-primary">PROCEED TO CHECKOUT &nbsp; <b>></b></Button>
					 </div>
				</div>
				<div class="row mt-5">
					<div class="col-md-3">
						<div class="card text-center" style="width:100%;" >
							  <div class="card-body">
							    <h5 class="card-title" >YOU MAY ALSO LIKE THESE PRODUCTS</h5>
							  </div>
						 </div>
					</div>
					<div class="col-md-3">
						<div class="card text-center" style="width:100%;" >
							  <img class="card-img-top" src="images/product1.jpg" alt="Card image cap" >
							  <div class="card-body">
							    <h5 class="card-title" >BLUE ARMANI BLOUSE</h5>
							    $47.00
							  </div>
						 </div>
					</div>
					<div class="col-md-3">
						<div class="card text-center" style="width:100%;" >
							  <img class="card-img-top" src="images/product1.jpg" alt="Card image cap" >
							  <div class="card-body">
							    <h5 class="card-title" >BLUE ARMANI BLOUSE</h5>
							    $47.00
							  </div>
						 </div>
					</div>
					<div class="col-md-3">
						<div class="card text-center" style="width:100%;" >
							  <img class="card-img-top" src="images/product1.jpg" alt="Card image cap" >
							  <div class="card-body">
							    <h5 class="card-title" style="font-size:16px">BLUE ARMANI BLOUSE</h5>
							    $47.00
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
				<%  total = subTotal+10; %>
				<table class="table table-sm">
					<tr>
						<td>Order SubTotal</td>
						<td><b>&#x20B9;<%= subTotal %></b></td>
					</tr>
					<tr>
						<td>Shipping & Handling</td>
						<td><b>&#x20B9;10.00</b></td>
					</tr>
					<tr>
						<td>Tax</td>
						<td><b>&#x20B9;0.00</b></td>
					</tr>
					<tr>
						<td><h5><b>Total</h5></b></td>
						<td><b>&#x20B9;<%= total %></b></td>
					</tr>
				</table>
				<hr>
				<br><br>
				<div class="card text-center">
				  <div class="card-header">
				    <b>COUPON CODE</b>
				  </div>
 				</div>
				<div class="row" style="padding:5%;">
					<p>Lorem Ipsum has been the industry's standard dummy text ever.Lorem Ipsum has been the industry's standard dummy text ever.</p>
					<form class="form-inline">
						<div class="input-group">
							<input class="form-control form-control-lg" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-primary btn-sm"><i class="fas fa-paper-plane"></i></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- main-content ends  -->
<%@ include file="footer.html" %>