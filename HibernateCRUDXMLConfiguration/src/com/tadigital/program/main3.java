package com.tadigital.program;



import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.tadigital.entity.Vendor;
import com.tadigital.hibernate.HibernateUtility;

public class main3 {
	
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtility.getSessionFactroy();
		Session session = sessionFactory.openSession();
		
		Transaction transaction = session.beginTransaction();
		
		
		Vendor vendor = (Vendor)session.get(Vendor.class,54);
		
		if(vendor!=null) {
			vendor.setName("Brad");
			vendor.setEmail("bb@slick.com");
			session.update(vendor);
		}else {
			System.out.println("No record found");
		}
		
		Vendor vendorToDelete = (Vendor)session.get(Vendor.class, 54);
		if(vendorToDelete !=null) {
			session.delete(vendorToDelete);
		}else {
			System.out.println("No record found");
		}
		transaction.commit();
		session.close();
		HibernateUtility.closeSessionFactroy();
	}
}
