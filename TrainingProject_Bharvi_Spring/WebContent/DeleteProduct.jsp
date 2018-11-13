<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%!
	int id;
	Connection con = null;
	Statement stmt = null;
%>

<%
	
	String id_vendor=request.getParameter("id");

	//String id= (String)session.getAttribute("vendor_id");
	try{
	Class.forName("com.mysql.jdbc.Driver");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root","");
	
	stmt = con.createStatement();
	String sql = "DELETE FROM product_information WHERE product_id='"+id_vendor+"'";
	int ifDeleted = stmt.executeUpdate(sql);
	if(ifDeleted !=0){
		String success = "Product Deleted";
		session.setAttribute("success",success);
		response.sendRedirect("ProductListServlet");
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