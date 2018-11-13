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
		String password;
	%>

	<% 
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
		Statement stmt = con.createStatement();
		
		email = request.getParameter("vendor_email");
		password = request.getParameter("vendor_password");
		
		String sql = "SELECT * from vendor_information WHERE vendor_email='"+email+"'AND vendor_password='"+password+"'";
		
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			session.setAttribute( "vendor_email", rs.getString("vendor_email") );
			session.setAttribute( "vendor_id", rs.getString("vendor_id") );
			session.setAttribute( "vendor_name", rs.getString("vendor_name") );
			if((String)session.getAttribute("vendor_errors") !=null){
				session.removeAttribute("vendor_errors");
			}
			response.sendRedirect("VendorHomePage.jsp");
		}else {
		String error_message = "Incorrect email or password.";
		session.setAttribute("vendor_errors",error_message);
		response.sendRedirect("VendorLoginForm.jsp");
	}
	%>