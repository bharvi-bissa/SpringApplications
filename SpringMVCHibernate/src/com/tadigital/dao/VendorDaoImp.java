package com.tadigital.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.tadigital.entity.Vendor;

@Repository
public class VendorDaoImp implements VendorDao{
	
	private SessionFactory sessionFactory;
	
	
	@Autowired
	public void setDataSource(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public boolean loginProcess(Vendor vendor) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		String hql = "FROM Vendor v WHERE v.email='" + vendor.getEmail() + "' AND v.password='" + vendor.getPassword() + "'";
		Query query = session.createQuery(hql);
		List<Vendor> vendors = query.list();
		if(vendors.size() != 0) {
			status = true;
			
			Vendor v = vendors.get(0);
			
			vendor.setId(v.getId());
			vendor.setName(v.getName());
		}
		
		return status;
	}
	
	public boolean registerVendor(Vendor vendor) {
		boolean status = false;
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		session.save(vendor);
		transaction.commit();
		status = true;
		session.close();
		return status;
	}

	@Override
	public List<Vendor> getVendors() {
		Session session = sessionFactory.openSession();
		String hql = "FROM Vendor";
		Query query = session.createQuery(hql);
		
		List<Vendor> vendors = query.list();
		
		List<Vendor> vendorList = new ArrayList<>(vendors);
		
		session.close();
		return vendorList;
	}

	@Override
	public boolean deleteVendor(int vid) {
		boolean status = false;
		
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		Vendor vendor = session.get(Vendor.class, vid);
		if(vendor != null) {
			session.delete(vendor);
			
			transaction.commit();
			status = true;
		}
		
		session.close();
		
		return status;
		
	}

	@Override
	public Vendor editVendor(int vid) {
		Session session = sessionFactory.openSession();
		
		Vendor vendor = session.get(Vendor.class, vid);
		session.close();
		
		return vendor;
		
	}

	@Override
	public boolean updateVendor(Vendor v) {
		boolean status = false;
		
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		session.update(v);
			
		transaction.commit();
		status = true;
		
		session.close();
		
		return status;
		
	}
}
