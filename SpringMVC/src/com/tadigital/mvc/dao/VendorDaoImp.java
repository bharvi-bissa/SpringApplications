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
	
}

