package com.tadigital.mvc.dao;

import java.util.List;

import com.tadigital.mvc.entity.Product;
import com.tadigital.mvc.entity.Vendor;

public interface VendorDao {
	public Vendor loginVendorAction(Vendor vendor);
	public boolean deleteProductAction(int id);
	public boolean editProductAction(Product product,int id);
	public boolean addProductAction(Product product);
	public List<Product> getProductsAction(int id);
}
