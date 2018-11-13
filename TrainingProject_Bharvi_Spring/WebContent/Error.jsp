<%@page import="com.techaspect.CustomerAccount"%>
<%@page import="com.techaspect.entity.Customer"%>
<%@page import="com.techaspect.dao.CustomerDao"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>Training Project</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
		</div>
	</nav>
	<!-- main-navbar ends -->
	<!-- upper navbar ends-->
	
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
					<li class="dropdown menu-large nav-item"> <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Baby & Kids </a>
		                	<ul class="dropdown-menu megamenu">
		                    	<div class="row">
				                    <li class="col-md-3 dropdown-item">
				                       <ul>
				                            <li class="dropdown-header"><b>Men's Footwear</b></li>
				                            <li><a href="#">Sport Shoes</a>
				                            </li>
				                            <li class="disabled"><a href="#">Casual Shoes</a>
				                            </li>
				                            <li><a href="#">Formal Shoes</a>
				                            </li>
				                            <li><a href="#">Sandal & Floaters</a>
				                            </li>
				                            <li><a href="#">Flip Flops</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Men's Grooming</b></li>
				                            <li><a href="#">Deos</a>
				                            </li>
				                            <li><a href="#">Beard Care and Grooming</a>
				                            </li>
				                            <li><a href="#">Perfumes</a>
				                            </li>
				                            <li><a href="#">Shaving and Aftershave</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                            <li class="dropdown-header"><b>Top Wear</b></li>
				                            <li><a href="#">T-Shirts</a>
				                            </li>
				                            <li><a href="#">T-Shirts</a>
				                            </li>
				                            <li><a href="#">Shirts</a>
				                            </li>
				                            <li><a href="#">Nesting</a>
				                            </li>
				                            <li><a href="#">Vertical variation</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Bottom Wear</b></li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                        	<li class="dropdown-header"><b>Watches</b></li>
				                            <li><a href="#">Basic example</a>
				                            </li>
				                            <li><a href="#">Sizing</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Accessories</b></li>
				                            <li><a href="#">Tabs</a>
				                            </li>
				                            <li><a href="#">Pills</a>
				                            </li>
				                            <li><a href="#">Justified</a>
				                            </li>
				                            <li><a href="#">Justified</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                            <li class="dropdown-header"><b>Seasonal Wear</b></b></li>
				                            <li><a href="#">Default navbar</a>
				                            </li>
				                            <li><a href="#">Buttons</a>
				                            </li>
				                            <li><a href="#">Text</a>
				                            </li>
				                            <li><a href="#">Non-nav links</a>
				                            </li>
				                            <li class="dropdown-header"><b>Accessories</b></li>
				                            <li><a href="#">Component alignment</a>
				                            </li>
				                            <li><a href="#">Fixed to top</a>
				                            </li>
				                            <li><a href="#">Fixed to bottom</a>
				                            </li>
				                            <li><a href="#">Static top</a>
				                            </li>
				                            <li><a href="#">Inverted navbar</a>
				                            </li>
				                        </ul>
				                    </li>
			                    </div>
							</ul>
						</li>
						<li class="dropdown menu-large nav-item"> <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">HealthCare and Applicances </a>
		                	<ul class="dropdown-menu megamenu">
		                    	<div class="row">
				                    <li class="col-md-3 dropdown-item">
				                       <ul>
				                            <li class="dropdown-header"><b>Men's Footwear</b></li>
				                            <li><a href="#">Sport Shoes</a>
				                            </li>
				                            <li class="disabled"><a href="#">Casual Shoes</a>
				                            </li>
				                            <li><a href="#">Formal Shoes</a>
				                            </li>
				                            <li><a href="#">Sandal & Floaters</a>
				                            </li>
				                            <li><a href="#">Flip Flops</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Men's Grooming</b></li>
				                            <li><a href="#">Deos</a>
				                            </li>
				                            <li><a href="#">Beard Care and Grooming</a>
				                            </li>
				                            <li><a href="#">Perfumes</a>
				                            </li>
				                            <li><a href="#">Shaving and Aftershave</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                            <li class="dropdown-header"><b>Top Wear</b></li>
				                            <li><a href="#">T-Shirts</a>
				                            </li>
				                            <li><a href="#">T-Shirts</a>
				                            </li>
				                            <li><a href="#">Shirts</a>
				                            </li>
				                            <li><a href="#">Nesting</a>
				                            </li>
				                            <li><a href="#">Vertical variation</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Bottom Wear</b></li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                        	<li class="dropdown-header"><b>Watches</b></li>
				                            <li><a href="#">Basic example</a>
				                            </li>
				                            <li><a href="#">Sizing</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Accessories</b></li>
				                            <li><a href="#">Tabs</a>
				                            </li>
				                            <li><a href="#">Pills</a>
				                            </li>
				                            <li><a href="#">Justified</a>
				                            </li>
				                            <li><a href="#">Justified</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                            <li class="dropdown-header"><b>Seasonal Wear</b></b></li>
				                            <li><a href="#">Default navbar</a>
				                            </li>
				                            <li><a href="#">Buttons</a>
				                            </li>
				                            <li><a href="#">Text</a>
				                            </li>
				                            <li><a href="#">Non-nav links</a>
				                            </li>
				                            <li class="dropdown-header"><b>Accessories</b></li>
				                            <li><a href="#">Component alignment</a>
				                            </li>
				                            <li><a href="#">Fixed to top</a>
				                            </li>
				                            <li><a href="#">Fixed to bottom</a>
				                            </li>
				                            <li><a href="#">Static top</a>
				                            </li>
				                            <li><a href="#">Inverted navbar</a>
				                            </li>
				                        </ul>
				                    </li>
			                    </div>
							</ul>
						</li>
					
						<li class="dropdown menu-large nav-item"> <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Men </a>
		                	<ul class="dropdown-menu megamenu">
		                    	<div class="row">
				                    <li class="col-md-3 dropdown-item">
				                       <ul>
				                            <li class="dropdown-header"><b>Men's Footwear</b></li>
				                            <li><a href="#">Sport Shoes</a>
				                            </li>
				                            <li class="disabled"><a href="#">Casual Shoes</a>
				                            </li>
				                            <li><a href="#">Formal Shoes</a>
				                            </li>
				                            <li><a href="#">Sandal & Floaters</a>
				                            </li>
				                            <li><a href="#">Flip Flops</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Men's Grooming</b></li>
				                            <li><a href="#">Deos</a>
				                            </li>
				                            <li><a href="#">Beard Care and Grooming</a>
				                            </li>
				                            <li><a href="#">Perfumes</a>
				                            </li>
				                            <li><a href="#">Shaving and Aftershave</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                            <li class="dropdown-header"><b>Top Wear</b></li>
				                            <li><a href="#">T-Shirts</a>
				                            </li>
				                            <li><a href="#">T-Shirts</a>
				                            </li>
				                            <li><a href="#">Shirts</a>
				                            </li>
				                            <li><a href="#">Nesting</a>
				                            </li>
				                            <li><a href="#">Vertical variation</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Bottom Wear</b></li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                            <li><a href="#">Jeans</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                        	<li class="dropdown-header"><b>Watches</b></li>
				                            <li><a href="#">Basic example</a>
				                            </li>
				                            <li><a href="#">Sizing</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li><a href="#">Checkboxes and radio addons</a>
				                            </li>
				                            <li class="divider"></li>
				                            <li class="dropdown-header"><b>Accessories</b></li>
				                            <li><a href="#">Tabs</a>
				                            </li>
				                            <li><a href="#">Pills</a>
				                            </li>
				                            <li><a href="#">Justified</a>
				                            </li>
				                            <li><a href="#">Justified</a>
				                            </li>
				                        </ul>
				                    </li>
				                    <li class="col-md-3 dropdown-item">
				                        <ul>
				                            <li class="dropdown-header"><b>Seasonal Wear</b></b></li>
				                            <li><a href="#">Default navbar</a>
				                            </li>
				                            <li><a href="#">Buttons</a>
				                            </li>
				                            <li><a href="#">Text</a>
				                            </li>
				                            <li><a href="#">Non-nav links</a>
				                            </li>
				                            <li class="dropdown-header"><b>Accessories</b></li>
				                            <li><a href="#">Component alignment</a>
				                            </li>
				                            <li><a href="#">Fixed to top</a>
				                            </li>
				                            <li><a href="#">Fixed to bottom</a>
				                            </li>
				                            <li><a href="#">Static top</a>
				                            </li>
				                            <li><a href="#">Inverted navbar</a>
				                            </li>
				                        </ul>
				                    </li>
			                    </div>
							</ul>
						</li>
			<!-- Megamenu starts -->		
			<li class="dropdown menu-large nav-item"> <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">Women </a>
                <ul class="dropdown-menu megamenu">
                    <div class="row">
	                    <li class="col-md-3 dropdown-item">
	                        <ul>
	                            <li class="dropdown-header"><b>Men's Footwear</b></li>
	                            <li><a href="#">Sport Shoes</a>
	                            </li>
	                            <li class="disabled"><a href="#">Casual Shoes</a>
	                            </li>
	                            <li><a href="#">Formal Shoes</a>
	                            </li>
	                            <li><a href="#">Sandal & Floaters</a>
	                            </li>
	                            <li><a href="#">Flip Flops</a>
	                            </li>
	                            <li class="divider"></li>
	                            <li class="dropdown-header"><b>Men's Grooming</b></li>
	                            <li><a href="#">Deos</a>
	                            </li>
	                            <li><a href="#">Beard Care and Grooming</a>
	                            </li>
	                            <li><a href="#">Perfumes</a>
	                            </li>
	                            <li><a href="#">Shaving and Aftershave</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li class="col-md-3 dropdown-item">
	                        <ul>
	                            <li class="dropdown-header"><b>Top Wear</b></li>
	                            <li><a href="#">T-Shirts</a>
	                            </li>
	                            <li><a href="#">T-Shirts</a>
	                            </li>
	                            <li><a href="#">Shirts</a>
	                            </li>
	                            <li><a href="#">Nesting</a>
	                            </li>
	                            <li><a href="#">Vertical variation</a>
	                            </li>
	                            <li class="divider"></li>
	                            <li class="dropdown-header"><b>Bottom Wear</b></li>
	                            <li><a href="#">Jeans</a>
	                            </li>
	                            <li><a href="#">Jeans</a>
	                            </li>
	                            <li><a href="#">Jeans</a>
	                            </li>
	                            <li><a href="#">Jeans</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li class="col-md-3 dropdown-item">
	                        <ul>
	                            <li class="dropdown-header"><b>Watches</b></li>
	                            <li><a href="#">Basic example</a>
	                            </li>
	                            <li><a href="#">Sizing</a>
	                            </li>
	                            <li><a href="#">Checkboxes and radio addons</a>
	                            </li>
	                            <li><a href="#">Checkboxes and radio addons</a>
	                            </li>
	                            <li><a href="#">Checkboxes and radio addons</a>
	                            </li>
	                            <li class="divider"></li>
	                            <li class="dropdown-header"><b>Accessories</b></li>
	                            <li><a href="#">Tabs</a>
	                            </li>
	                            <li><a href="#">Pills</a>
	                            </li>
	                            <li><a href="#">Justified</a>
	                            </li>
	                            <li><a href="#">Justified</a>
	                            </li>
	                        </ul>
	                    </li>
	                    <li class="col-md-3 dropdown-item">
	                        <ul>
	                            <li class="dropdown-header"><b>Seasonal Wear</b></b></li>
	                            <li><a href="#">Default navbar</a>
	                            </li>
	                            <li><a href="#">Buttons</a>
	                            </li>
	                            <li><a href="#">Text</a>
	                            </li>
	                            <li><a href="#">Non-nav links</a>
	                            </li>
	                            <li class="dropdown-header"><b>Accessories</b></li>
	                            <li><a href="#">Component alignment</a>
	                            </li>
	                            <li><a href="#">Fixed to top</a>
	                            </li>
	                            <li><a href="#">Fixed to bottom</a>
	                            </li>
	                            <li><a href="#">Static top</a>
	                            </li>
	                            <li><a href="#">Inverted navbar</a>
	                            </li>
	                        </ul>
	                    </li>
	                    </div>
					</ul>
					</li>
				</div>
			</div>
		</nav>
	<!-- main-navbar ends -->

	<div class="container-fluid" id="middle-container">
		<ul>
			<li style="float:left;font-size:35px;" class="pl-5"><b>Error Page</b></li>
		</ul>
		<ul>
			<li><a href="">Home </a></li>
			<li><a href="">New Account </a>/</li>
			<li><a href="">Login </a>/</li>
		</ul>
	</div>
	<div class="container text-center" style="font-size:20px;min-height:400px;">
		<hr>
		<div class="pt-3"><b>Sorry for the inconvenience - The page you are looking for does not exist</b></div>
		<div class="text-center"><em>seems like you have tried to write to modify the URL. Use only navigation links provided on the web page.</em></div>
		<br>
		<div class="text-center"><Button class="btn btn-primary"><i class="fas fa-home" onclick="location.href='/index.jsp'"></i>&nbsp; Home</Button></div>
		<br>
		<hr>
	</div>
	
	<%@ include file="footer.html" %>