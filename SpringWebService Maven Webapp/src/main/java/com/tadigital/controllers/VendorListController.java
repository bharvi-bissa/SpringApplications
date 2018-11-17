package com.tadigital.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.tadigital.entity.Vendor;
import com.tadigital.service.VendorService;

@Controller
public class VendorListController {
	
	private VendorService vs;
	
	@Autowired
	public VendorListController(VendorService vs) {
		this.vs = vs;
	}

	@RequestMapping(value = "/vendorlist")
	public @ResponseBody List<Vendor> loadVendorList(HttpSession session) {
		List<Vendor> list = vs.getVendors();
		HttpHeaders responseHeaders = new HttpHeaders();
	    responseHeaders.setContentType(MediaType.APPLICATION_JSON);
		session.setAttribute("VENDOR_LIST", list);
		String json = new Gson().toJson(list);
		return list;
	}
	
	@RequestMapping(value = "/delete{vid}")
	public String deleteVendor(@PathVariable int vid, HttpSession session) {
		boolean status = vs.deleteVendor(vid);
		if(status) {
			return "vendorListRedirect";
		}
		return "vendorListRedirect";
	}
	
	@RequestMapping(value = "/edit{vid}")
	public String editVendor(@PathVariable int vid, HttpSession session) {
		Vendor v = vs.editVendor(vid);
		if(v == null) {
			return "vendorList";
		}
		session.setAttribute("EDIT_VENDOR", v);
		return "editForm";
	}
	
	@RequestMapping(value = "/updateVendor")
	public String updateVendor(HttpServletRequest req,HttpSession session) {
		Vendor v = (Vendor)session.getAttribute("EDIT_VENDOR");
		v.setName(req.getParameter("name"));
		v.setEmail(req.getParameter("email"));
		if(vs.updateVendor(v)) {
			return "vendorListRedirect";
		}
		return "editForm";
	}
}
