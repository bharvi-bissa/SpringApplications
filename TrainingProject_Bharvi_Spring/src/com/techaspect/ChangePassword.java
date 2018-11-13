package com.techaspect;

import java.io.IOException;

import java.io.Serializable;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.CustomerDao;
import com.techaspect.entity.Customer;



public class ChangePassword extends HttpServlet implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	 public void service(HttpServletRequest request,HttpServletResponse  response) throws ServletException,IOException{
		response.setContentType("text/html");
		String  oldPassword;
		String newPassword;
		HttpSession session = request.getSession();
		Customer customer = (Customer)session.getAttribute("CUSTOMERDATA");	
		if(customer ==null) {
			response.sendRedirect("index.jsp");
		}else {
		
			
			 oldPassword = request.getParameter("old_password");
			 newPassword = request.getParameter("new_password");
			 
			 CustomerDao customerDao =CustomerDao.getInstance();
			 
			 boolean status = customerDao.changePassword(customer, newPassword, oldPassword);
			if(status) {
				session.setAttribute("CUSTOMERDATA",customer);
				String success = "Password Updated";
				session.setAttribute("success",success);
				response.sendRedirect("CustomerAccount.jsp");
			}else {
				String errors = "Password Incorrect";
				session.setAttribute("errors",errors);
				response.sendRedirect("CustomerAccount.jsp");
			}
/*			String sql_check = "SELECT cust_password FROM customer_information WHERE cust_id='"+(String)session.getAttribute("cust_id")+"'";
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
		
		out.print("<script src=\"js/jquery-3.3.1.js\"></script>\r\n" + 
				"	<script src=\"js/bootstrap.js\"></script>\r\n" + 
				"	\r\n" + 
				"</body>\r\n" + 
				"</html>");*/
		}
	}
}
