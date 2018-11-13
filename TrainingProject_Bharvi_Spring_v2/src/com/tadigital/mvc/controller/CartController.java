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
public class CartController {
	
	@Autowired
	ServletContext context; 
	
	@Autowired
	public void setServletContext(ServletContext servletContext) {
	    this.context = servletContext;
	}
	
	@RequestMapping(value="addtocart{id}",method=RequestMethod.GET)
	public String addToCart(@PathVariable int id,HttpSession session) {
		List<Product> productsList = (List)context.getAttribute("PRODUCTLIST");
		List<Product> cart = (List)session.getAttribute("CART");
		
		for(Product product : productsList) {
			if(product.getId() == id) {
				cart.add(product);
			}
		}
		session.setAttribute("success", "Product added to cart.");
		return "MobileSubCategory.jsp";
	}
	
	@RequestMapping(value="removefromcart{id}",method=RequestMethod.GET)
	public String removeFromCart(@PathVariable int id,HttpSession session) {
		List<Product> cart = (List)session.getAttribute("CART");
		for(Product product : cart) {
			if(product.getId() == id) {
				cart.remove(product);
				break;
			}
		}
		return "ShoppingCart.jsp";
	}
}
