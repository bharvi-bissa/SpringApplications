package com.tadigital.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LinkController {
	
	@RequestMapping(value= {"/","/home"})
	public String reloadHome() {
		return "WEB-INF/views/index.jsp";
	}

}
