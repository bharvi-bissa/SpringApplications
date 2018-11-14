package com.tadigital.controllers;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tadigital.entity.Vendor;
import com.tadigital.service.VendorService;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {
	private VendorService vendorServiceProxy;
	
	@Autowired
	public RegisterController(VendorService vendorServiceProxy) {
		this.vendorServiceProxy = vendorServiceProxy;
	}

	@GetMapping
	public String loadRegisterForm() {
		return "html/registerForm.html";
	}

	@PostMapping
	public String registerTask(HttpServletRequest request,HttpServletRequest req) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Vendor v = new Vendor();
		v.setEmail(email);
		v.setName(name);
		v.setPassword(password);
		boolean b = vendorServiceProxy.registerVendor(v);
		
		if(b) {
			return "WEB-INF/views/RegistrationSuccess.jsp";
		}
		return "WEB-INF/views/RegistrationFailure.jsp";
	}
}
