package com.tadigital.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tadigital.entity.Vendor;
import com.tadigital.service.VendorService;

@Controller
public class VendorListController {
	private VendorService vendorServiceProxy;
	
	@Autowired
	public VendorListController(VendorService vendorServiceProxy) {
		this.vendorServiceProxy = vendorServiceProxy;
	}

	@RequestMapping(value = "/vendorlist")
	public String loadVendorList(HttpSession session) {
		List<Vendor> list = vendorServiceProxy.getVendors();
		session.setAttribute("VENDOR_LIST", list);
		return "WEB-INF/views/VendorList.jsp";
	}
	
	@RequestMapping(value = "/delete{vid}")
	public String deleteVendor(@PathVariable int vid, HttpSession session) {
		List<Vendor> vList = (ArrayList<Vendor>)session.getAttribute("VENDOR_LIST");
		vList = (ArrayList<Vendor>)vendorServiceProxy.deleteVendor(vid);
		if(vList == null) {
			return "WEB-INF/views/VendorList.jsp";
		}
		session.setAttribute("VENDOR_LIST", vList);
		return "WEB-INF/views/VendorList.jsp";
	}
	
	@RequestMapping(value = "/edit{vid}")
	public String editVendor(@PathVariable int vid, HttpSession session) {
		Vendor v = vendorServiceProxy.editVendor(vid);
		if(v == null) {
			return "vendorList.jsp";
		}
		session.setAttribute("EDIT_VENDOR", v);
		return "WEB-INF/views/editForm.jsp";
	}
	
	@RequestMapping(value = "/updateVendor")
	public String updateVendor(HttpServletRequest req,HttpSession session) {
		Vendor v = (Vendor)session.getAttribute("EDIT_VENDOR");
		v.setName(req.getParameter("name"));
		v.setEmail(req.getParameter("email"));
		if(vendorServiceProxy.updateVendor(v)) {
			session.setAttribute("EDIT_VENDOR", v);
			return "vendorlist";
		}
		return "WEB-INF/views/editForm.jsp";
	}
}
