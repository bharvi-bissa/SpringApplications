<%@page import="com.techaspect.dao.CustomerDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page isErrorPage="true" %>
<% 		Customer customer = (Customer)session.getAttribute("CUSTOMERDATA");	 %>		
<%@ include file="HeaderCustomer.jsp" %>
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
	<div class="container" style="font-size:20px;min-height:400px;">
		<hr>
		<div class=" text-center pt-3"><b>Sorry for the inconvenience - The page you are looking for have a Technical Error.</b></div>
		<div class="text-center"><em>Kindly proceed to the Home Page or report this issue to Website Administrator with the Description mentioned below.</em></div>
		<br>
		<div class="text-center"><Button class="btn btn-primary"><i class="fas fa-home" onclick="location.href='/index.jsp'"></i>&nbsp; Home</Button><Button class="btn btn-primary ml-2"><i class="fas fa-bug" onclick="location.href='/index.jsp'"></i>&nbsp; Contact</Button></div>
		<br>
		<hr>
		<div class="alert alert-danger">
			<p><% exception.printStackTrace(new java.io.PrintWriter(out)); %></p>
		</div>
	</div>
	
	<%@ include file="footer.html" %>