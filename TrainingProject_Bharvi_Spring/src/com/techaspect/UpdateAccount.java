package com.techaspect;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.CustomerDao;
import com.techaspect.entity.Address;
import com.techaspect.entity.Customer;



public class UpdateAccount extends HttpServlet {
	
	@Override
	 public void service(HttpServletRequest request,HttpServletResponse  response) throws ServletException,IOException{
		 
		 HttpSession session = request.getSession();
		 
		 Customer customerData = (Customer)session.getAttribute("CUSTOMERDATA");
		 Address addressData = (Address)session.getAttribute("ADDRESSDATA");
		 
		 Customer customer = new Customer();
		 Address address = new Address();
		 String fname =request.getParameter("fname") ;
		 String lname = request.getParameter("lname");
		 String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String addressValue = request.getParameter("address");
		String zip = request.getParameter("zip");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String gender  = request.getParameter("gender");
		customer.setId(customerData.getId());
		 customer.setFirstName(fname);
		 customer.setLastName(lname);
		 customer.setContact(contact);
		 customer.setGender(gender);
		 customer.setEmail(email);
		 customer.setContact(contact);
		 address.setAddress(addressValue);
		 address.setCity(city);
		 address.setCountry(country);
		 address.setState(state);
		 address.setZip(zip);
		 if(addressData.getAddress() !=null) {
			 address.setId(addressData.getId());
			 address.setCust_id(customerData.getId());
		 }
		 CustomerDao customerDao = CustomerDao.getInstance();
		 boolean status = customerDao.updateAccount(customer, address,addressData);
		 if(status) {
			session.setAttribute("CUSTOMERDATA",customer);
			session.setAttribute("ADDRESSDATA",address);
			String success = "Profile Updated";
			session.setAttribute("success",success);
			response.sendRedirect("CustomerAccount.jsp");
		 }else {
			 
				String errors = "Error";
				session.setAttribute("success",errors);
				response.sendRedirect("CustomerAccount.jsp");
		 }
	}
}
