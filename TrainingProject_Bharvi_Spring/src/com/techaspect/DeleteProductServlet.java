package com.techaspect;

import java.io.IOException;

import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.VendorDao;
import com.techaspect.entity.Product;




public class DeleteProductServlet extends HttpServlet implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	 public void service(HttpServletRequest request,HttpServletResponse  response) throws ServletException,IOException{
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		VendorDao vendorDao = VendorDao.getInstance();
		
		String index = request.getParameter("index");
		
		ArrayList<Product> productList = (ArrayList)session.getAttribute("PRODUCTLIST"); 
		
		Product currentProduct = productList.get(Integer.parseInt(index));
		
		Boolean status = vendorDao.deleteProduct(currentProduct);
		
		if(status) {
			productList.remove(Integer.parseInt(index));
			String success = "Product deleted successfully.";
			session.setAttribute("success",success);
			response.sendRedirect("ProductList.jsp");
		}else {
			String error = "Something Went wrong";
			session.setAttribute("errors",error);
			response.sendRedirect("ProductListServlet");
		}
	}
}