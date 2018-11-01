package com.tadigital.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tadigital.mvc.dao.VendorDaoImp;
import com.tadigital.mvc.entity.Vendor;

@Component
public class vendorServiceImp implements VendorService {
	private VendorDaoImp vendorDao;

	@Autowired
	public void setVendorDao(VendorDaoImp vendorDao) {
		this.vendorDao = vendorDao;
	}

	@Override
	public boolean loginService(Vendor vendor) {
		return false;
	}

	@Override
	public boolean registerService(Vendor vendor) {
		return vendorDao.registerVendor(vendor);
	}



}
