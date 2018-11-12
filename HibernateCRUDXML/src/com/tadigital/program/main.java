package com.tadigital.program;



import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.tadigital.entity.Product;
import com.tadigital.entity.Vendor;
import com.tadigital.hibernate.HibernateUtility;

public class main {
	
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtility.getSessionFactroy();
		Session session = sessionFactory.openSession();
		
		Transaction transaction = session.beginTransaction();
		
		Vendor vendor1 = new Vendor();
		vendor1.setEmail("bb@okm.com");
		vendor1.setName("Bharvi");
		vendor1.setPassword("1234");
		
		Vendor vendor2 = new Vendor();
		vendor2.setEmail("bb@okmg.com");
		vendor2.setName("BharviB");
		vendor2.setPassword("1234");
		
		Product product1 = new Product();
		product1.setId(22);
		product1.setDescription("Another product");
		product1.setName("Sample Product");
		//product1.setPrice("100");
		product1.setVendorId(1);
		
		Product product2 = new Product();
		product2.setId(23);
		product2.setDescription("Another product 2");
		product2.setName("Sample Product 2");
		//product2.setPrice("100");
		product2.setVendorId(1);
		
		
		session.save(vendor1);
		session.save(vendor2);
		
		session.save(product1);
		session.save(product2);
		
		transaction.commit();
		session.close();
		HibernateUtility.closeSessionFactroy();
	}
}
