package com.tadigital.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.tadigital.entity.Vendor;

@Repository
public class VendorDaoImp implements VendorDao{
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	private SimpleJdbcInsert simpleJdbcInsert;
	/*@Autowired
	public VendorDaoImp(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}*/
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
		simpleJdbcInsert = new SimpleJdbcInsert(dataSource);
		simpleJdbcInsert.withTableName("vendor_information");
		//sji.usingGeneratedKeyColumns("id");
	}
	
	@Override
	public boolean loginProcess(Vendor vendor) {
		String sql = "SELECT * FROM vendor_information WHERE vendor_email = :email AND vendor_password = :password";
		Vendor ven = null;
		BeanPropertySqlParameterSource parameters = new BeanPropertySqlParameterSource(vendor);
		
		try {
			ven = namedParameterJdbcTemplate.queryForObject(sql, parameters, new RowMapper<Vendor>() {
																						@Override
																						public Vendor mapRow(ResultSet rs, int rowNum) throws SQLException {
																							Vendor vendor = new Vendor();
																							vendor.setId((rs.getString(1)));
																							vendor.setName(rs.getString(2));
																							vendor.setEmail(rs.getString(3));
																							vendor.setPassword(rs.getString(4));
																							return vendor;
																						}
			});
		} catch(EmptyResultDataAccessException erdae) {
			erdae.printStackTrace();
		}
		
		return ven!=null;
	}
	
	public boolean registerVendor(Vendor vendor) {
		
		BeanPropertySqlParameterSource parameters = new BeanPropertySqlParameterSource(vendor);
		int rows = simpleJdbcInsert.execute(parameters);
		
		return rows!= 0;
	}

	@Override
	public List<Vendor> getVendors() {
		String sql = "SELECT * FROM vendor_information";
		return namedParameterJdbcTemplate.query(sql, new RowMapper<Vendor>() {
			@Override
			public Vendor mapRow(ResultSet rs, int rowNum) throws SQLException {
				Vendor v = new Vendor();
				v.setId(rs.getString(1));
				v.setName(rs.getString(2));
				v.setEmail(rs.getString(3));
				v.setPassword(rs.getString(4));
				return v;
			}
		});
	}

	@Override
	public List<Vendor> deleteVendor(int vid) {
		String sql = "DELETE from vendor_information WHERE vendor_id = :id";
		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("id", vid);
		int rows = namedParameterJdbcTemplate.update(sql, parameters);
		if(rows != 0) {
			sql = "SELECT * FROM vendor_information";
			return namedParameterJdbcTemplate.query(sql, new RowMapper<Vendor>() {
				public Vendor mapRow(ResultSet rs, int rowNum) throws SQLException {
					Vendor v = new Vendor();
					v.setId(rs.getString(1));
					v.setName(rs.getString(2));
					v.setEmail(rs.getString(3));
					v.setPassword(rs.getString(4));
					return v;
				}
			});
		}
		return null;
	}

	@Override
	public Vendor editVendor(int vid) {
		String sql = "SELECT * FROM vendor_information WHERE vendor_id = :id";
		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("id", vid);
		Vendor vendor = new Vendor();
		try {
			vendor = namedParameterJdbcTemplate.queryForObject(sql, parameters, new RowMapper<Vendor>() {
				@Override
				public Vendor mapRow(ResultSet rs, int numRow) throws SQLException {
					Vendor vendor = new Vendor();
					vendor.setId(rs.getString(1));
					vendor.setName(rs.getString(2));
					vendor.setEmail(rs.getString(3));
					vendor.setPassword(rs.getString(4));
					return vendor;
				}
			});
		}catch(EmptyResultDataAccessException erdae) {
			erdae.printStackTrace();
		}
		return vendor;
	}

	@Override
	public boolean updateVendor(Vendor v) {
		String sql = "UPDATE vendor_information SET vendor_name= :name, vendor_email = :email WHERE vendor_id= :id";
		BeanPropertySqlParameterSource parameters = new BeanPropertySqlParameterSource(v);
		int rows = namedParameterJdbcTemplate.update(sql, parameters);
		
		return rows != 0;
	}
}
