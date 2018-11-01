package com.tadigital.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.springframework.stereotype.Repository;

import com.tadigital.mvc.entity.Vendor;

@Repository
public class VendorDaoImp implements VendorDao {
	
	private DataSource dataSource;
	
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	public boolean registerVendor(Vendor vendor) {

		boolean status = false;
		Connection con=null;
		Statement stmt = null;
		try{  
			Class.forName("com.mysql.jdbc.Driver"); 
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercedb","root",""); 
			stmt=con.createStatement();  
			int row=stmt.executeUpdate("INSERT INTO vendor_information(vendor_name,vendor_email,vendor_password) values('"+vendor.getName()+"', '"+vendor.getEmail()+"', '"+vendor.getPassword()+"')");
			if(row>0) {
				status= true;
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return status;
	}
	
	public Vendor loginVendor(Vendor vendor) {
		
		String query = "select * from vendor_information where vendor_email = ?";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		Vendor v = new Vendor();
		try {
			con=dataSource.getConnection();
			ps = con.prepareStatement(query);
			ps.setString(1, vendor.getEmail());
			rs = ps.executeQuery();
			if(rs.next()) {
				v.setEmail(rs.getString("vendor_email"));
				v.setName(rs.getString("vendor_name"));
				v.setPassword(rs.getString("vendor_password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return v;
		
	}
	
}

