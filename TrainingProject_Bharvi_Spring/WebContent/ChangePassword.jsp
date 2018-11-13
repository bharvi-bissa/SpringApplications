<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String old_password="";
	String new_password="";
%>

<% 
	
try {
	
	Class.forName("com.mysql.jdbc.Driver");
	System.out.println("Driver class found and loaded");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
	
	stmt = con.createStatement();
	
	 old_password = request.getParameter("old_password");
	 new_password = request.getParameter("new_password");
	
	String sql_check = "SELECT cust_password FROM customer_information WHERE cust_id='"+(String)session.getAttribute("cust_id")+"'";
	rs = stmt.executeQuery(sql_check);
	rs.next();
	String cust_old_password = rs.getString("cust_password");
	if(cust_old_password.equals(old_password)) {
		String sql_update_password = "UPDATE customer_information SET cust_password='"+new_password+"'WHERE cust_id='"+(String)session.getAttribute("cust_id")+"'";
		int row = stmt.executeUpdate(sql_update_password);
		if(row != 0) {
			
			String success = "Password Updated";
			session.setAttribute("success",success);
			response.sendRedirect("CustomerAccount.jsp");
		}else {
		%>
			<h1>Password Incorrect</h1> <%
		}
	}else{
		String success = "Password Incorrect";
		session.setAttribute("errors",success);
		response.sendRedirect("CustomerAccount.jsp");
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
	
%>