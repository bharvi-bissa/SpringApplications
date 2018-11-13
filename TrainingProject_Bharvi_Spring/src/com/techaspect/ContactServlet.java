package com.techaspect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.CustomerDao;



public class ContactServlet extends HttpServlet {
	@Override
	 public void service(HttpServletRequest req,HttpServletResponse  res) throws ServletException,IOException{
		res.setContentType("text/html");
		HttpSession session = req.getSession();
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String subject = req.getParameter("subject");
		String message = req.getParameter("message");
		
		
		CustomerDao customerDao = CustomerDao.getInstance();
		boolean status = customerDao.contact(fname,lname,email,subject,message);
		
		if(status) {
			session.setAttribute("success", "Message sent.");
			res.sendRedirect("Contact.jsp");
		}
		
	}
}
