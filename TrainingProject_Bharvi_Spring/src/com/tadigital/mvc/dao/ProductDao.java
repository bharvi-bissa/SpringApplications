package com.tadigital.mvc.dao;

import java.util.List;

import com.tadigital.mvc.entity.Product;

public interface ProductDao {
	public List<Product> loadProductsAction();
}
