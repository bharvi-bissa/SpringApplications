<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
	String fname="";
	String lname = "";
	String contact = "";
	String email = "";
	String city = "";
	String gender = "";
	String zip = "";
	String country = "";
	String state = "";
	String address = "";
%>

<%
		 fname = request.getParameter("fname");
		 lname = request.getParameter("lname");
		 email = request.getParameter("email");
		 contact = request.getParameter("contact");
		 address = request.getParameter("address");
		 zip = request.getParameter("zip");
		 city = request.getParameter("city");
		 state = request.getParameter("state");
		 country = request.getParameter("country");
		 gender  = request.getParameter("gender");
		
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver class found and loaded");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
		
		Statement stmt_customer = con.createStatement();
		
		
		String sql_address = "SELECT * FROM address_information WHERE cust_id='"+(String)session.getAttribute("cust_id")+"'";
		ResultSet rows_address = stmt_customer.executeQuery(sql_address);
		
		/* Check  if there is an entry */
		if(!rows_address.next()){
			String sql_add_address = "INSERT into address_information(cust_id,add_address,add_zip,add_city,add_state,add_country) VALUES('"+(String)session.getAttribute("cust_id")+"','"+address+"','"+zip+"','"+city+"','"+state+"','"+country+"')";
			int row_address = stmt_customer.executeUpdate(sql_add_address);
			if(row_address !=0) {
				String success = "Profile Added";
				session.setAttribute("success",success);
				response.sendRedirect("CustomerAccount.jsp");
			}
		}else {
			   /* if there is already an entry with given customer id,update the current entry */
			   String sql_update_address = "UPDATE address_information SET add_address = '"+address+"',add_zip='"+zip+"',add_city='"+city+"',add_state='"+state+"',add_country='"+country+"'WHERE cust_id='"+(String)session.getAttribute("cust_id")+"'";
			   int rows_address_update = stmt_customer.executeUpdate(sql_update_address);
			   if(rows_address_update !=0) {
				   if(rows_address_update !=0) {
						String success = "Profile Updated";
						session.setAttribute("success",success);
						response.sendRedirect("CustomerAccount.jsp");
					}
			   }
		}
		/* Updating the customer details */
		String sql_customer = "UPDATE customer_information SET cust_fname='"+fname+"',cust_lname='"+lname+"',cust_email='"+email+"',cust_contact='"+contact+"',cust_gender='"+gender+"'WHERE cust_id='"+(String)session.getAttribute("cust_id")+"'";
		int rows_customer = stmt_customer.executeUpdate(sql_customer);
		if(rows_customer !=0) {
			String success = "Profile Updated";
			session.setAttribute("success",success);
			response.sendRedirect("CustomerAccount.jsp");
			}
		
		
		
%>