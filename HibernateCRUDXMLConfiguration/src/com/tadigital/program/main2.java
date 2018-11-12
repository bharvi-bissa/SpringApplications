package com.tadigital.program;



import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import org.hibernate.query.Query;

import com.tadigital.entity.Vendor;
import com.tadigital.hibernate.HibernateUtility;

public class main2 {
	
	public static void main(String[] args) {
		SessionFactory sessionFactory = HibernateUtility.getSessionFactroy();
		Session session = sessionFactory.openSession();
		
		/*Transaction not required for display*/
		
		/*Selecting all columns*/
		String hql = "FROM Vendor";
		Query query1=session.createQuery(hql);
		
		List<Vendor> list = query1.list();
		
		for(Vendor v : list) {
			System.out.println("ID: "+ v.getId());
			System.out.println("Name: "+ v.getName() );
			System.out.println("Email: "+ v.getEmail());
		}
		
		/*WHERE clause */
		System.out.println("WHERE clause");
		
		String whereHql = "SELECT vobj.name,vobj.email FROM Vendor vobj";
		Query query2 = session.createQuery(whereHql);
		
		Iterator<Object[]> iterator = query2.iterate();
		while(iterator.hasNext()) {
			Object[] row = iterator.next();
			
			String name = (String)row[0];
			String email = (String)row[1];
			
			System.out.println("Name : " +name);
			System.out.println("Email : " +email);
			
			System.out.println();
		}
		
		
		session.close();
		HibernateUtility.closeSessionFactroy();
	}
}
