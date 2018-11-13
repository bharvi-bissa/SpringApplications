package com.tadigital.mvc.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tadigital.mvc.entity.Product;
import com.tadigital.mvc.service.ProductService;

@Controller
public class ProductConroller {
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
	
	@RequestMapping(value="productdescription{id}",method=RequestMethod.GET)
	public String showProductDescription(@PathVariable int id,HttpSession session) {
		List<Product> productList = (List)context.getAttribute("PRODUCTLIST");
		for(Product product : productList) {
			if(product.getId() == id) {
				session.setAttribute("PRODUCTINFO", product);
				break;
			}
		}
		return "ProductDescription.jsp";
	}
	
}
