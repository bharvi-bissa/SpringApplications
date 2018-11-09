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
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;

import com.tadigital.entity.Vendor;

@Repository
public class VendorDaoImp implements VendorDao{
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	/*@Autowired
	public VendorDaoImp(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}*/
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
	}
	
	@Override
	public boolean loginProcess(Vendor vendor) {
		String sql = "SELECT * FROM vendor_information WHERE vendor_email = :vemail AND vendor_password = :vpassword";
		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("vemail", vendor.getEmail());
		parameters.addValue("vpassword", vendor.getPassword());
		boolean status =false;
		Vendor ven = null;
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
		
		if(ven !=null)
			status = true;
		
		return status;
	}
	
	public boolean registerVendor(Vendor vendor) {
		String sql = "INSERT INTO vendor_information(vendor_name, vendor_email,vendor_password) VALUES(:vname,:vemail,:vpassword);";
		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("vemail", vendor.getEmail());
		parameters.addValue("vname", vendor.getName());
		parameters.addValue("vpassword", vendor.getPassword());
		int rows = namedParameterJdbcTemplate.update(sql,parameters);
		
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
		String sql = "UPDATE vendor_information SET vendor_name= :vname, vendor_email = :vemail WHERE vendor_id= :vid";
		MapSqlParameterSource parameters = new MapSqlParameterSource();
		parameters.addValue("vid", v.getId());
		parameters.addValue("vname", v.getName());
		parameters.addValue("vemail", v.getEmail());
		int rows = namedParameterJdbcTemplate.update(sql, parameters);
		
		return rows != 0;
	}
}
