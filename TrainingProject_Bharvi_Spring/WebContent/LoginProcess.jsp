<%@page import="com.techaspect.entity.Customer"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>


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
	<%! 
		String email;
		String password,sql;
	%>

	<% 
	
		String email = (String) session.getAttribute("email");
	
		if(email == null) {
			session.setAttribute("cookie_validated","no");
		 	email = request.getParameter("email");
			password = request.getParameter("password");
			sql = "SELECT * FROM customer_information WHERE cust_email='" + email + "' AND cust_password='" + password + "'";
		} else {
			sql = "SELECT * FROM customer_information WHERE cust_email='" + email + "'";
		}
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
		Statement stmt = con.createStatement();
		
		//email = request.getParameter("email");
		//password = request.getParameter("password");
		
		//String sql = "SELECT * from customer_information WHERE cust_email='"+email+"'AND cust_password='"+password+"'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		String remember_me = request.getParameter("remember_me");
		
		if(rs.next()) {
			session.setAttribute("cookie_validated","yes");
			if(remember_me != null) {
				Cookie cookie = new Cookie("bb_webapp", email);
				//cookie.setMaxAge(60 * 60 * 24 * 30);
				cookie.setMaxAge(60);
				
				response.addCookie(cookie);
			}
			response.sendRedirect("Dashboard.jsp");
			
		}else {
		String error_message = "Incorrect email or password.";
		session.setAttribute("errors",error_message);
		response.sendRedirect("index.jsp");
	}
		
	%>