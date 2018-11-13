package com.tadigital.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tadigital.mvc.entity.Address;
import com.tadigital.mvc.entity.Customer;
import com.tadigital.mvc.entity.Product;
import com.tadigital.mvc.service.CustomerService;

@Controller
public class CustomerController {

	private CustomerService customerService;

	@Autowired
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	@RequestMapping(value = "/customerregister", method = RequestMethod.POST)
	public String customerRegister(HttpServletRequest request, HttpSession session) {
		Customer customer = new Customer();
		customer.setFirstName(request.getParameter("firstname"));
		customer.setLastName(request.getParameter("lastname"));
		customer.setEmail(request.getParameter("email"));
		customer.setPassword(request.getParameter("password"));

		boolean status = customerService.customerRegister(customer);
		if (status) {
			session.setAttribute("success", "You are registered");
			return "index.jsp";
		} else {
			String error = "Email already exists !";
			session.setAttribute("errors", error);
			return "redirect:index.jsp";
		}

	}
	
	@RequestMapping(value="/customerlogout",method=RequestMethod.GET)
	public String logoutVendor(HttpSession session) {
		session.invalidate();
		return "redirect:index.jsp";
	}

	@RequestMapping(value = "/customerlogin", method = RequestMethod.POST)
	public String customerLogin(HttpServletRequest request, HttpSession session) {
		Customer customer = new Customer();
		Address address = new Address();
		customer.setEmail(request.getParameter("email"));
		customer.setPassword(request.getParameter("password"));

		boolean status = customerService.customerLogin(customer, address);
		if (status) {
			session.setAttribute("CUSTOMERDATA", customer);
			session.setAttribute("ADDRESSDATA", address);
			List<Product> cart = new ArrayList<>();
			session.setAttribute("CART", cart);

			return "Dashboard.jsp";
		} else {
			String errorMsg = "Incorrect email or password.";
			session.setAttribute("errors", errorMsg);
			return "redirect:index.jsp";
		}
	}

	@RequestMapping(value = "/updateaccount", method = RequestMethod.POST)
	public String customerUpdateAccount(HttpServletRequest request, HttpSession session) {
		Customer customerData = (Customer) session.getAttribute("CUSTOMERDATA");
		Address addressData = (Address) session.getAttribute("ADDRESSDATA");
		String pass = customerData.getPassword();
		Customer customer = new Customer();
		Address address = new Address();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String contact = request.getParameter("contact");
		String addressValue = request.getParameter("address");
		String zip = request.getParameter("zip");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String gender = request.getParameter("gender");
		
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
		if (addressData.getAddress() != null) {
			address.setId(addressData.getId());
			address.setCust_id(customerData.getId());
		}
		boolean status = customerService.updateAccount(customer, address, addressData);
		if (status) {
			customer.setPassword(pass);
			session.setAttribute("CUSTOMERDATA", customer);
			session.setAttribute("ADDRESSDATA", address);
			String success = "Profile Updated";
			session.setAttribute("success", success);
			return "redirect:CustomerAccount.jsp";
		} else {

			String errors = "Error";
			session.setAttribute("success", errors);
			return "redirect:CustomerAccount.jsp";
		}

	}

	@RequestMapping(value = "/customerchangepassword", method = RequestMethod.POST)
	public String vendorChangePassword(HttpServletRequest request, HttpSession session) {
		String oldPassword;
		String newPassword;
		Customer customer = (Customer) session.getAttribute("CUSTOMERDATA");
		if (customer == null) {
			return "redirect:index.jsp";
		} else {

			oldPassword = request.getParameter("old_password");
			newPassword = request.getParameter("new_password");

			boolean status = customerService.changePassword(customer, newPassword, oldPassword);
			if (status) {
				session.setAttribute("CUSTOMERDATA", customer);
				String success = "Password Updated";
				session.setAttribute("success", success);
				return "redirect:CustomerAccount.jsp";
			} else {
				String errors = "Password Incorrect";
				session.setAttribute("errors", errors);
				return "redirect:CustomerAccount.jsp";
			}
		}

	}
}
