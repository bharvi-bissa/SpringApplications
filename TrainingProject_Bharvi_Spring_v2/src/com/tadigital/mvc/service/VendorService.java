package com.tadigital.mvc.service;

import java.util.List;

import com.tadigital.mvc.entity.Product;
import com.tadigital.mvc.entity.Vendor;

public interface VendorService {
	public Vendor loginService(Vendor vendor);
	public boolean deleteProduct(int id);
	public boolean editProduct(Product product,int id);
	public boolean addProduct(Product product);
	public List<Product> getProducts(int id);
}
