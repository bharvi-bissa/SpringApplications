package com.tadigital.controllers;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tadigital.entity.Vendor;

import com.tadigital.service.VendorService;

@Controller
@RequestMapping(value = "/login")
public class LoginController {
	private final static Logger LOGGER = Logger.getLogger(LoginController.class);

	private VendorService vendorServiceProxy;

	@Autowired
	public LoginController(VendorService vendorServiceProxy) {
		this.vendorServiceProxy = vendorServiceProxy;
	}

	@GetMapping
	public String loadLoginForm() {
		return "html/loginForm.html";
	}

	@PostMapping
	public String loginTask(@ModelAttribute Vendor v, HttpServletRequest req) {
		boolean b = vendorServiceProxy.loginVendor(v);

		if (b) {

			return "WEB-INF/views/loginSuccess.jsp";
		}
		return "WEB-INF/views/loginFailure.jsp";
	}
}
