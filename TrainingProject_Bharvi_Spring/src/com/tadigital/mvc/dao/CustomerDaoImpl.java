package com.tadigital.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import com.tadigital.mvc.entity.Address;
import com.tadigital.mvc.entity.Customer;

@Repository
public class CustomerDaoImpl extends Dao implements CustomerDao {
	private final static Logger LOGGER = Logger.getLogger(CustomerDaoImpl.class);
	
	public boolean checkDuplicateEmail(Customer customer) {
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement pStmt=null;
		try {
			LOGGER.debug("checkDuplicateEmail execution started");
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			
			String sqlDuplicateCheck = "SELECT cust_email FROM customer_information WHERE cust_email=?";
			pStmt = openPreparedStatement(con,sqlDuplicateCheck);
			
			pStmt.setString(1, customer.getEmail());
			
			rs = pStmt.executeQuery();
			if(rs.next()) {
				status=true;
			}
		}catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closePreparedStatement(pStmt);
			closeStatement(stmt);
			closeStatement(stmt);
			closeConnection(con);
		}
		return status;
	}
	
	@Override
	public boolean customerRegisterAction(Customer customer) {
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pStmt=null;
		PreparedStatement pStmt2=null;
		try {
			LOGGER.debug(" insertCustomer execution started");
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			if(checkDuplicateEmail(customer)) {
				status=false;
			}else {
				String sql = "INSERT INTO customer_information(cust_fname,cust_lname,cust_email,cust_password) VALUES(?,?,?,?)";
				pStmt2 = openPreparedStatement(con,sql);
				pStmt2.setString(1,customer.getFirstName());
				pStmt2.setString(2,customer.getLastName());
				pStmt2.setString(3,customer.getEmail());
				pStmt2.setString(4,customer.getPassword());
				int rows = pStmt2.executeUpdate();
				if(rows != 0) {
					status = true;
				}
			}
		}catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closePreparedStatement(pStmt2);
			closePreparedStatement(pStmt);
			closeStatement(stmt);
			closeStatement(stmt);
			closeConnection(con);
		}
		LOGGER.debug("insertCustomer execution ending");
		return status;
	}

	@Override
	public boolean customerLoginAction(Customer customer,Address address) {
		LOGGER.debug("loginCustomer function started");
		boolean status = false;
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs=null;
		ResultSet rs2 = null;
		PreparedStatement pStmt=null;
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			String sql = "select * from customer_information where cust_email = ? AND cust_password = ?";
			pStmt = openPreparedStatement(con,sql);

			pStmt.setString(1, customer.getEmail());
			pStmt.setString(2, customer.getPassword());
			rs = pStmt.executeQuery();
			stmt = con.createStatement();
			if(rs.next()) {
				status = true;
				customer.setId(rs.getInt("cust_id"));
				customer.setFirstName(rs.getString("cust_fname"));
				customer.setLastName(rs.getString("cust_lname"));
				customer.setEmail(rs.getString("cust_email"));
				customer.setPassword(rs.getString("cust_password"));
				customer.setContact(rs.getString("cust_contact"));
				customer.setGender(rs.getString("cust_gender"));
				
				String sqlFetchAddress = "SELECT * FROM address_information WHERE cust_id="+customer.getId();
				rs2=stmt.executeQuery(sqlFetchAddress);
				
				if(rs2.next()) {
					
					address.setId(rs2.getInt("add_id"));
					address.setCust_id(rs2.getInt("cust_id"));
					address.setAddress(rs2.getString("add_address"));
					address.setCity(rs2.getString("add_city"));
					address.setZip(rs2.getString("add_zip"));
					address.setState(rs2.getString("add_state"));
					address.setCountry(rs2.getString("add_country"));
					
				}
			}
			
			
		} catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closePreparedStatement(pStmt);
			closeResultSet(rs2);
			closeResultSet(rs);
			closeStatement(stmt);
			closeConnection(con);
		}
		LOGGER.debug("loginCustomer function ended");
		return status;
	}

	@Override
	public boolean customerUpdateAccountAction(Customer customer, Address address,Address addressData) {
		LOGGER.debug("updateAccount execution started");
		boolean status = false;
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pStmt=null;
		PreparedStatement pStmt2=null;
		PreparedStatement pStmt3=null;
		
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();
			
			if(addressData.getAddress() == null){
				String sqlAddAddress = "INSERT into address_information(cust_id,add_address,add_zip,add_city,add_state,add_country) VALUES(?,?,?,?,?,?)";
				pStmt2 = openPreparedStatement(con,sqlAddAddress);
				pStmt2.setInt(1, customer.getId());
				pStmt2.setString(2, address.getAddress());
				pStmt2.setString(3, address.getZip());
				pStmt2.setString(4, address.getCity());
				pStmt2.setString(5,address.getState());
				pStmt2.setString(6,address.getCountry());
				int rowAddress = pStmt2.executeUpdate();
				if(rowAddress !=0) {
					status = true;
				}
			}else {
				String sqlUpdateAddress = "UPDATE address_information SET add_address = ?,add_zip=?,add_city=?,add_state=?,add_country=? WHERE cust_id=?";
				pStmt3 = openPreparedStatement(con,sqlUpdateAddress);
				pStmt3.setString(1, address.getAddress());
				pStmt3.setString(2,address.getZip());
				pStmt3.setString(3, address.getCity());
				pStmt3.setString(4, address.getState());
				pStmt3.setString(5,address.getCountry());
				pStmt3.setInt(6, customer.getId());
				int rowsAddressUpdate = pStmt3.executeUpdate();
				   if(rowsAddressUpdate !=0) {
					   status = true;
				   }
			}
			
				String sqlCustomer = "UPDATE customer_information SET cust_fname=?,cust_lname=?,cust_email=?,cust_contact=?,cust_gender=? WHERE cust_id=?";
				pStmt = openPreparedStatement(con,sqlCustomer);
				pStmt.setString(1,customer.getFirstName());
				pStmt.setString(2,customer.getLastName());
				pStmt.setString(3,customer.getEmail());
				pStmt.setString(4,customer.getContact());
				pStmt.setString(5, customer.getGender());
				pStmt.setInt(6, customer.getId());
				int rowCustomer = pStmt.executeUpdate();
				if(rowCustomer !=0) {
					status = true;
				}
		
			
			}catch(SQLException sqle) {
				LOGGER.error("Exception Occured.", sqle);
			} finally {
				closeStatement(stmt);
				closeConnection(con);
			}
			LOGGER.debug("updateAccount execution ended");
			return status;
	}

	@Override
	public boolean changePasswordAction(Customer customer,String newPassword,String oldPassword) {
		LOGGER.debug(" changePassword execution started");
		boolean status = false;
		Connection con = null;
		PreparedStatement pStmt = null;
		try {
			DataSource dataSource = getDataSource();
			con = dataSource.getConnection();

			String custOldPassword = customer.getPassword();
			
			if(custOldPassword.equals(oldPassword)) {
				String sqlUpdatePassword = "UPDATE customer_information SET cust_password=? WHERE cust_id=?";
				pStmt = openPreparedStatement(con,sqlUpdatePassword);
				pStmt.setString(1, newPassword);
				pStmt.setInt(2, customer.getId());
				int row = pStmt.executeUpdate();
				if(row != 0) {
					status = true;
					customer.setPassword(newPassword);
				}else {
					status = false;
				}
				
			}
			
		}catch(SQLException sqle) {
			LOGGER.error("Exception Occured.", sqle);
		} finally {
			closeStatement(pStmt);
			closeConnection(con);
		}
		LOGGER.debug(" changePassword execution ended");
		return status;
	}

}
