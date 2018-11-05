package com.tadigital.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.tadigital.mvc.dao.CustomerDaoImpl;
import com.tadigital.mvc.entity.Address;
import com.tadigital.mvc.entity.Customer;

@Component
public class CustomerServiceImpl implements CustomerService {
	
	private CustomerDaoImpl customerDao;
	
	@Autowired
	public void setCustomerDao(CustomerDaoImpl customerDao) {
		this.customerDao = customerDao;
	}
	
	@Override
	public boolean customerLogin(Customer customer,Address address) {
		return customerDao.customerLoginAction(customer, address);
	}

	@Override
	public boolean customerRegister(Customer customer) {
		return customerDao.customerRegisterAction(customer);
	}

	@Override
	public boolean updateAccount(Customer customer, Address address,Address addressData) {
		return customerDao.customerUpdateAccountAction(customer, address, addressData);
	}

	@Override
	public boolean changePassword(Customer customer,String newPassword,String oldPassword) {
		return customerDao.changePasswordAction(customer,newPassword,oldPassword);
	}


}
