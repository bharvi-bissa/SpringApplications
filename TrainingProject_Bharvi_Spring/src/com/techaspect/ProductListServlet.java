package com.techaspect;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.VendorDao;
import com.techaspect.entity.Product;
import com.techaspect.entity.Vendor;

public class ProductListServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		VendorDao vendorDao = VendorDao.getInstance();
		HttpSession session = request.getSession();
		Vendor vendor = (Vendor)session.getAttribute("VENDORDATA");
		List<Product> productList = vendorDao.displayAllProducts(vendor.getId());
		
		session.setAttribute("PRODUCTLIST", productList);	
		response.sendRedirect("ProductList.jsp");
	}
}
