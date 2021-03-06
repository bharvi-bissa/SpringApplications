package com.tadigital.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tadigital.entity.Vendor;
import com.tadigital.service.VendorService;

@Controller
@RequestMapping(value = "/register")
public class RegisterController {
	
	private VendorService vs;
	
	@Autowired
	public RegisterController(VendorService vs) {
		this.vs = vs;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String loadRegisterForm() {
		return "html/registerForm.html";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String registerTask(HttpServletRequest request,HttpServletRequest req) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Vendor v = new Vendor();
		v.setEmail(email);
		v.setName(name);
		v.setPassword(password);
		boolean b = vs.registerVendor(v);
		
		if(b) {
			return "RegistrationSuccess.jsp";
		}
		return "RegistrationFailure.jsp";
	}
}
