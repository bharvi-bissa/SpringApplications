package com.tadigital.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tadigital.mvc.entity.Vendor;
import com.tadigital.mvc.service.VendorService;

@Controller
public class VendorLoginController {

	private VendorService vendorService;

	@Autowired
	public VendorLoginController(VendorService vendorService) {
		this.vendorService = vendorService;
	}

	@RequestMapping(value="/login" , method=RequestMethod.POST)
	public String login(HttpServletRequest request) {
		Vendor vendor = new Vendor();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		vendor.setEmail(email);
		vendor.setPassword(password);

		boolean status = vendorService.loginService(vendor);
		if(status) {
			return "Dashboard.jsp";
		}
		return "LoginFailure.jsp";

	}
}
