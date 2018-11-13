package com.tadigital.service;

import java.util.List;

import com.tadigital.entity.Vendor;

public interface VendorService {
	
	public boolean loginVendor(Vendor v);
	public boolean registerVendor(Vendor v);
	public List<Vendor> getVendors();
	public boolean deleteVendor(int vid);
	public Vendor editVendor(int id);
	public boolean updateVendor(Vendor v);
}
