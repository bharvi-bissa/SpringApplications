<%  Customer customer = (Customer)session.getAttribute("CUSTOMERDATA"); %>
<%@ include file="HeaderCustomer.jsp" %>
	
	<div class="container-fluid" id="middle-container">
		<ul>
			<li><a href="">Home </a></li>
			<li><a href="">New Account </a>/</li>
			<li><a href="">Login </a>/</li>
		</ul>
	</div>
	
	<!-- contact-section starts -->
	<div class="container contact_container" style="margin-bottom:2%;">
	<% if(session.getAttribute("success") !=null){ %>
		<p class="alert alert-success"><%= session.getAttribute("success")%></p>
	<% session.removeAttribute("success"); }else if(session.getAttribute("errors") !=null){ %>
		<p class="alert alert-danger"><%= session.getAttribute("errors")%></p>
	<% session.removeAttribute("errors");} %>
		<div class="row">
			<div class="col-md-8">
				<div class="contact_section">
					<h3>WE ARE HERE TO HELP YOU</h3>
					<p>Lorem Ipsum has been the industry galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially </p>
					<h3>CONTACT FORM</h3>
					<form action="ContactServlet" method="post">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
						    	<label for="firstname">First Name</label>
						    	<input type="firstname" class="form-control" id="" name="fname">
						    </div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
						    	<label for="lastname">Last Name</label>
						    	<input type="lastname" class="form-control" id="" name="lname">
						    </div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
							    <label for="email">Email :</label>
							    <input type="email" class="form-control" id="email" name="email">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
							    <label for="subject">Subject :</label>
							    <input type="subject" class="form-control" id="" name="subject">
							</div>
						</div>
						<div class="col-md-12">
							<div class="form-group">
							    <label for="subject">Message :</label>
							    <TextArea class="form-control" name="message"></TextArea>
							</div>
						</div>
						<div class="col-md-12" style="text-align:center">
							<div class="form-group">
							    <button type="submit" class="btn btn-primary" value="Send Message"><i class="fas fa-user"></i>&nbsp; Send Message</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4" >
				<div class="address_section">
					<h3>ADDRESS</h3>
					<p>Lorem Ipsum has been the industry galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially </p>
					<br>
					<h3>CALL CENTER</h3>
					<p>
					Lorem Ipsum has been the industry galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially </p>
					<p><b>+91 9909 0909999</b></p>
					<br>
					<h3>ELECTRONIC SUPPORT</h3>
					<p>Lorem Ipsum has been the industry galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially </p>
					<ul>
						<li><a href="info@techaspect.com">info@techaspect.com</a>
						<li><a href="info@techaspect.com">Our ticketing support platform</a>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- contact section ends -->
	

	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3806.178992349964!2d78.3685165147837!3d17.451145005556587!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb93e3b687f237%3A0x2151ef183d15a72b!2sTechAspect+Solutions+Private+Limited!5e0!3m2!1sen!2sin!4v1535697776327" width="100%" height="250px" frameborder="0" style="border:0" allowfullscreen ></iframe>
	
		
	<%@ include file="footer.html" %>
	
	