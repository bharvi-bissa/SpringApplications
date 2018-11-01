package com.tadigital.mvc.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value= {"/","/home"})
	public String showIndex() {
		return "index.jsp";
	}
	
	@RequestMapping(value= "/loginform")
	public String loginForm() {
		return "LoginForm.jsp";
	}
	
	@RequestMapping(value= "/registerform")
	public String registerForm() {
		return "RegisterForm.jsp";
	}
	
}
