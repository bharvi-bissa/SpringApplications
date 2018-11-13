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

public class RemoveFromCartServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {		
		
		String jspPageName = req.getParameter("jsp");
		
		//index of product in ArrayList
		int index = Integer.parseInt(req.getParameter("index"));
		
		HttpSession ses = req.getSession();

		List<Product> cart = (List)ses.getAttribute("CART");
		
		cart.remove(index);
		
		ses.setAttribute("CART", cart);
		
		ses.setAttribute("success", "Product removed from cart.");
		res.sendRedirect(jspPageName+".jsp");
	}

}
