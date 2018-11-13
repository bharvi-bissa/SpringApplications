package com.techaspect;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.techaspect.dao.VendorDao;
import com.techaspect.entity.Vendor;

public class VendorLoginServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest request,HttpServletResponse  response) throws ServletException,IOException{
		Vendor vendor = new Vendor();
		HttpSession session = request.getSession();
		String email = request.getParameter("vendor_email");
		String password = request.getParameter("vendor_password");
		
		vendor.setEmail(email);
		vendor.setPassword(password);
		
		VendorDao vendorDao = VendorDao.getInstance();
		boolean status = vendorDao.loginVendor(vendor);
		
		if(status) {
			session.setAttribute("VENDORDATA",vendor);
			if((String)session.getAttribute("vendor_errors") !=null){
				session.removeAttribute("vendor_errors");
			}
			response.sendRedirect("VendorHomePage.jsp");
		}else {
			String error = "Incorrect email or password.";
			session.setAttribute("vendor_errors",error);
			response.sendRedirect("VendorLoginForm.jsp");
		}
		
	}
}
