<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
	
	Connection con = null;
	Statement stmt = null;
	ResultSet rs=null;
	String name,email,password="";
%>


<% 
	name = request.getParameter("name");
	email = request.getParameter("email");
	password  = request.getParameter("password");
	
	if(name.equals("") || email.equals("") || password.equals("")){
		session.setAttribute("errors"," Please fill all the fields");
		response.sendRedirect("index.jsp");
	}else{
	
	String[] full_name = name.split(" ");
	
	String fname=null;String lname = null;
	if(full_name[0] != null) {
		fname = full_name[0];
	}
	if(full_name.length > 1) {
		if(full_name[1] != null) {
			lname = full_name[1];
		}else {
			lname = null;
		}
	}
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver class found and loaded");
		
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
		
		stmt = con.createStatement();
		
		String sql_duplicate_check = "SELECT cust_email FROM customer_information WHERE cust_email = '"+email+"'";
		rs = stmt.executeQuery(sql_duplicate_check);
		if(rs.next()) {
			String error = "Email already exists !";
			session.setAttribute("errors",error);
			response.sendRedirect("index.jsp");
		}else {
			
		String sql = "INSERT INTO customer_information(cust_fname,cust_lname,cust_email,cust_password) VALUES('"+fname+"','"+lname+"','"+email+"','"+password+"')";
		int rows = stmt.executeUpdate(sql);
		if(rows !=0) {
			session.setAttribute("success","You are registered");
			response.sendRedirect("index.jsp");
		}
		}
	}catch(ClassNotFoundException cnfe) {
		cnfe.printStackTrace();
	}catch(SQLException sqle) {
		sqle.printStackTrace();
	}finally {
		try {
			if(stmt !=null) {
				stmt.close();
			}
			if(con !=null) {
				con.close();
			}
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}
	}
	
	}
%>