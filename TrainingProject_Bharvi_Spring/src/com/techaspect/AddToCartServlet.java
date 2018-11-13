package com.techaspect;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.entity.Product;

public class AddToCartServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {	
		
		int selectedProductId = Integer.parseInt(req.getParameter("pid"));
		String jspPageName = req.getParameter("jsp");
		
		HttpSession ses = req.getSession();
		List<Product> productsList = (List)ses.getAttribute("PRODUCTSLIST");
		List<Product> cart = (List)ses.getAttribute("CART");
		
		for(Product product : productsList) {
			if(product.getId() == selectedProductId) {
				cart.add(product);
			}
		}
		
		ses.setAttribute("success", "Product added to cart.");
		
		res.sendRedirect(jspPageName+"SubCategory"+".jsp");
	}
}