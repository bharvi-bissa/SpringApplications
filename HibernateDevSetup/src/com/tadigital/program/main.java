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
		
		HibernateUtility.closeSessionFactroy();
	}
}
