package com.tadigital.dao;

import java.util.List;

import com.tadigital.entity.Vendor;

public interface VendorDao {
	
	public boolean registerVendor(Vendor v);
	public boolean loginProcess(Vendor v);
	public List<Vendor> getVendors();
	public boolean deleteVendor(int vid);
	public Vendor editVendor(int id);
	public boolean updateVendor(Vendor v);
	
}
