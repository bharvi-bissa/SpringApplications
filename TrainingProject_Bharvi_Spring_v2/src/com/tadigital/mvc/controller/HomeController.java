package com.tadigital.mvc.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tadigital.mvc.entity.Product;
import com.tadigital.mvc.service.CustomerService;
import com.tadigital.mvc.service.ProductService;
import com.tadigital.mvc.service.VendorService;

@Controller
public class HomeController {
	@Autowired
	ServletContext context; 
	
	private ProductService productService;
	
	@Autowired
	public void setServletContext(ServletContext servletContext) {
	    this.context = servletContext;
	}
	
	@Autowired
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping(value= {"/","/home"})
	public String showIndex() {
		
		return "index.jsp";
	}
	
	@RequestMapping(value= "/shop")
	public String showShopPage() {
		List<Product> productList = (List)productService.loadProducts();
		context.setAttribute("PRODUCTLIST", productList);
		return "redirect:MobileSubCategory.jsp";
	}

	
	

	
}
