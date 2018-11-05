package com.tadigital.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tadigital.mvc.dao.ProductDao;
import com.tadigital.mvc.dao.ProductDaoImpl;
import com.tadigital.mvc.entity.Product;

@Component
public class ProductServiceImpl implements ProductService {
	
	private ProductDaoImpl productDao;
	

	@Autowired
	public void setProductDao(ProductDaoImpl productDao) {
		this.productDao = productDao;
	}
	
	@Override
	public List<Product> loadProducts() {
		return productDao.loadProductsAction();
	}


}
