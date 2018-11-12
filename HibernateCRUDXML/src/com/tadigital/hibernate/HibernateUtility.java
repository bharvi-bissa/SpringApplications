package com.tadigital.hibernate;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtility {
	static SessionFactory sessionFactory;
	static {
		
		Configuration configuration = new Configuration();
		configuration.configure();
		sessionFactory = configuration.buildSessionFactory();
	}
	
	public static SessionFactory getSessionFactroy() {
		return sessionFactory;
	}
	
	public static void closeSessionFactroy() {
		sessionFactory.close();
	}
}
