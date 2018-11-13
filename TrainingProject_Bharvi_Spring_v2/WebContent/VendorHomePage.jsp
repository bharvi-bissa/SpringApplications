<%@ include file="VendorHeader.jsp" %>
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
		<h1 class="mb-4" style="font-weight:lighter">What you want to do ?</h1>
		<div class="row">
			<div class="col-md-4">
				  <a href="NewProductForm.jsp">
					<div class="card bg-light">
						 <div class="card-body text-center">
						     <i class="fas fa-shopping-bag mb-3" style="font-size: 2em;"></i>
						      <p class="card-text">Add New Product</p>
						 </div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				  <a href="showproducts">
					<div class="card bg-light">
						 <div class="card-body text-center">
						     <i class="fas fa-edit mb-3" style="font-size: 2em;"></i>
						      <p class="card-text">Edit Products</p>
						 </div>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- main content ends -->
	
	
<%@ include file="footer.html" %>