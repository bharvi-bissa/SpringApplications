package com.techaspect;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.CustomerDao;
import com.techaspect.entity.Customer;

import com.techaspect.service.EmailService;

public class SignUpProcessServlet extends HttpServlet {
	
	@Override
	 public void service(HttpServletRequest request,HttpServletResponse  response) throws ServletException,IOException{
		
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String redirect = "index.jsp";
	
		if(name.equals("") || email.equals("") || password.equals("")){
			session.setAttribute("errors"," Please fill all the fields");
			response.sendRedirect(redirect);
		}else{
		
		String[] fullName = name.split(" ");
		
		String fname=null;
		String lname = null;
		if(fullName[0] != null) {
			fname = fullName[0];
		}
		if(fullName.length > 1) {
			if(fullName[1] != null) {
				lname = fullName[1];
			}else {
				lname = null;
			}
		}
		
		Customer customer = new Customer();
		EmailService es = new EmailService();
		customer.setFirstName(fname);
		customer.setLastName(name);
		customer.setEmail(email);
		customer.setPassword(password);
		
		CustomerDao customerDao = CustomerDao.getInstance();
		
		boolean status = customerDao.insertCustomer(customer);
		if(status) {
			session.setAttribute("success","You are registered");
			es.sendWelcomeMailToCustomer(customer);
			response.sendRedirect(redirect);
		} else {
			String error = "Email already exists !";
			session.setAttribute("errors",error);
			response.sendRedirect(redirect);
		}
		
	
	}
  }
}
