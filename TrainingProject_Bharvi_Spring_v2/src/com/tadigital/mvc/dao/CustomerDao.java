package com.tadigital.mvc.dao;

import com.tadigital.mvc.entity.Address;
import com.tadigital.mvc.entity.Customer;

public interface CustomerDao {
	public boolean customerRegisterAction(Customer customer);
	public boolean customerLoginAction(Customer customer,Address address);
	public boolean customerUpdateAccountAction(Customer customer,Address address,Address addressData);
	public boolean changePasswordAction(Customer customer,String newPassword,String oldPassword);
}
