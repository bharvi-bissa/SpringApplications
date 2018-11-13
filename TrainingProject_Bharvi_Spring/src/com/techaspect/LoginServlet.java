package com.techaspect;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.CustomerDao;
import com.techaspect.entity.Address;
import com.techaspect.entity.Customer;
import com.techaspect.entity.Product;


public class LoginServlet extends HttpServlet implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	 public void service(HttpServletRequest request,HttpServletResponse  response) throws ServletException,IOException{
		response.setContentType("text/html");
		
		
		HttpSession session = request.getSession();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(email.equals("") || password.equals("")) {
			session.setAttribute("Errors","Please fill all fields");
			response.sendRedirect("index.jsp");
		}else {
		Customer customer = new Customer();
		Address address = new Address();
		customer.setEmail(email);
		customer.setPassword(password);
		
		CustomerDao customerDao = CustomerDao.getInstance();
		
		Product product = new Product();
		
		
		boolean status = customerDao.loginCustomer(customer,address);
		if(status) {
			session.setAttribute("CUSTOMERDATA", customer);
			session.setAttribute("ADDRESSDATA",address);
			
			/* initializing the cart on successful login */
			
			List<Product> cart = new ArrayList<>();
			session.setAttribute("CART", cart);
			
			response.sendRedirect("Dashboard.jsp");
		} else {
			String errorMsg = "Incorrect email or password.";
			session.setAttribute("errors",errorMsg);
			response.sendRedirect("index.jsp");
			}
		}
	}
}
