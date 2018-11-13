package com.tadigital.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tadigital.mvc.dao.VendorDaoImp;
import com.tadigital.mvc.entity.Product;
import com.tadigital.mvc.entity.Vendor;

@Component
public class vendorServiceImp implements VendorService {
	private VendorDaoImp vendorDao;
	 

	@Autowired
	public void setVendorDao(VendorDaoImp vendorDao) {
		this.vendorDao = vendorDao;
	}

	@Override
	public Vendor loginService(Vendor vendor) {
		return vendorDao.loginVendorAction(vendor);
	}

	@Override
	public boolean deleteProduct(int id) {
		return vendorDao.deleteProductAction(id);
	}

	@Override
	public boolean editProduct(Product product,int id) {
		return vendorDao.editProductAction(product, id);
		
	}

	@Override
	public boolean addProduct(Product product) {
		return vendorDao.addProductAction(product);
	}

	@Override
	public List<Product> getProducts(int id) {
		return vendorDao.getProductsAction(id);
	}
}
