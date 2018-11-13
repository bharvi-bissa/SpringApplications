<%
session.invalidate();
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
		    </ul>
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
	<div class="container">
		<div class="alert alert-success m-5">
			<p>You are successfully logged out.</p>
		</div>
		<div class="mb-5">
		<a href="VendorLoginForm.jsp ">Back to homepage</a>
		</div>
	</div>
		<!-- footer starts -->
	<div class="footer">
		<div class="container">
			<div class="row" >
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