package com.tadigital.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tadigital.mvc.entity.Vendor;
import com.tadigital.mvc.service.VendorService;

@Controller
public class VendorRegisterController {
	private VendorService vendorService;

	@Autowired
	public VendorRegisterController(VendorService vendorService) {
		this.vendorService = vendorService;
	}

	@RequestMapping(value="/register" , method=RequestMethod.POST)
	public String register(@RequestParam String name,@RequestParam String email,@RequestParam String password, HttpServletRequest request) {
		Vendor vendor = new Vendor();
		vendor.setEmail(email);
		vendor.setName(name);
		vendor.setPassword(password);

		boolean status = vendorService.registerService(vendor);
		if(status) {
			return "RegistrationSuccess.jsp";
		}
		return "RegistrationFailure.jsp";

	}
}
