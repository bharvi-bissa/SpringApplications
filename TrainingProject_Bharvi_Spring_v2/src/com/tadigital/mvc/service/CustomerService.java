package com.tadigital.mvc.service;

import com.tadigital.mvc.entity.Address;
import com.tadigital.mvc.entity.Customer;

public interface CustomerService {
	public boolean customerLogin(Customer customer,Address address);
	public boolean customerRegister(Customer customer);
	public boolean updateAccount(Customer customer, Address address,Address addressData);
	public boolean changePassword(Customer customer,String newPassword,String oldPassword);
}
