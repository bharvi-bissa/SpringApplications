package com.tadigital.mvc.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import com.tadigital.mvc.entity.Address;
import com.tadigital.mvc.entity.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	private final static Logger LOGGER = Logger.getLogger(CustomerDaoImpl.class);
	private SimpleJdbcInsert simpleJdbcInsert;
	private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(dataSource);
		simpleJdbcInsert = new SimpleJdbcInsert(dataSource);
		simpleJdbcInsert.setTableName("customer_information");
	}

	public boolean checkDuplicateEmail(Customer customer) {
		Customer cust = null;
		boolean status = false;
		try {
			LOGGER.debug("checkDuplicateEmail execution started");

			String sqlDuplicateCheck = "SELECT cust_email FROM customer_information WHERE cust_email=:email";
			MapSqlParameterSource parameters = new MapSqlParameterSource();
			parameters.addValue("email", customer.getEmail());
			cust = namedParameterJdbcTemplate.queryForObject(sqlDuplicateCheck, parameters, new RowMapper<Customer>() {
				@Override
				public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
					Customer customer = new Customer();
					customer.setEmail(rs.getString("cust_email"));
					return customer;
				}
			});
			if (cust != null) {
				status = true;
			}
		} catch (EmptyResultDataAccessException erdae) {
			LOGGER.error("Exception Occured.", erdae);

		}
		return status;
	}

	@Override
	public boolean customerRegisterAction(Customer customer) {
		LOGGER.debug(" insertCustomer execution started");
		boolean status = false;
		if (checkDuplicateEmail(customer) == false) {
			BeanPropertySqlParameterSource parameters = new BeanPropertySqlParameterSource(customer);
			int rows = simpleJdbcInsert.execute(parameters);
			if (rows > 0)
				status = true;
		}
		LOGGER.debug("insertCustomer execution ending");
		return status;
	}

	@Override
	public boolean customerLoginAction(Customer customer, Address address) {
		LOGGER.debug("loginCustomer function started");

		String sql = "SELECT * FROM customer_information WHERE cust_email = :email AND cust_password = :password";
		String sqlFetchAddress = "SELECT * FROM address_information WHERE cust_id=:id";
		Customer cust = null;

		boolean status = false;
		MapSqlParameterSource parameterCustomer = new MapSqlParameterSource();
		parameterCustomer.addValue("email", customer.getEmail());
		parameterCustomer.addValue("password", customer.getPassword());
		MapSqlParameterSource paramters = new MapSqlParameterSource();
		try {

			cust = namedParameterJdbcTemplate.queryForObject(sql, parameterCustomer, new RowMapper<Customer>() {
				@Override
				public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
					customer.setId(rs.getInt("cust_id"));
					customer.setFirstName(rs.getString("cust_fname"));
					customer.setLastName(rs.getString("cust_lname"));
					customer.setEmail(rs.getString("cust_email"));
					customer.setContact(rs.getString("cust_contact"));
					customer.setGender(rs.getString("cust_gender"));
					customer.setPassword(rs.getString("cust_password"));
					return customer;

				}
			});
			paramters.addValue("id", customer.getId());

			if (cust != null) {
				status = true;
				namedParameterJdbcTemplate.queryForObject(sqlFetchAddress, paramters, new RowMapper<Address>() {
					@Override
					public Address mapRow(ResultSet rs, int rowNum) throws SQLException {
						System.out.println("here");
						address.setId(rs.getInt("add_id"));
						address.setCust_id(rs.getInt("cust_id"));
						address.setAddress(rs.getString("add_address"));
						address.setCity(rs.getString("add_city"));
						address.setZip(rs.getString("add_zip"));
						address.setState(rs.getString("add_state"));
						address.setCountry(rs.getString("add_country"));
						return address;
					}
				});

			}

		} catch (EmptyResultDataAccessException erdae) {
			LOGGER.error("Exception Occured.", erdae);
		}
		LOGGER.debug("loginCustomer function ended");
		return status;
	}

	@Override
	public boolean customerUpdateAccountAction(Customer customer, Address address, Address addressData) {
		LOGGER.debug("updateAccount execution started");
		boolean status = false;
		try {
			if (addressData.getAddress() == null) {
				String sqlAddAddress = "INSERT into address_information(cust_id,add_address,add_zip,add_city,add_state,add_country) VALUES(:id,:address,:zip,:city,:state,:country)";
				MapSqlParameterSource parameters = new MapSqlParameterSource();
				parameters.addValue("id", customer.getId());
				parameters.addValue("address", address.getAddress());
				parameters.addValue("zip", address.getZip());
				parameters.addValue("city", address.getCity());
				parameters.addValue("state", address.getState());
				parameters.addValue("country", address.getCountry());

				int rowAddress = namedParameterJdbcTemplate.update(sqlAddAddress, parameters);
				if (rowAddress != 0) {
					status = true;
				}
			} else {
				String sqlUpdateAddress = "UPDATE address_information SET add_address = :address,add_zip=:zip,add_city=:city,add_state=:state,add_country=:country WHERE cust_id=:id";
				MapSqlParameterSource parameters = new MapSqlParameterSource();
				parameters.addValue("id", customer.getId());
				parameters.addValue("address", address.getAddress());
				parameters.addValue("zip", address.getZip());
				parameters.addValue("city", address.getCity());
				parameters.addValue("state", address.getState());
				parameters.addValue("country", address.getCountry());

				int rowsAddressUpdate = namedParameterJdbcTemplate.update(sqlUpdateAddress, parameters);
				if (rowsAddressUpdate != 0) {
					status = true;
				}
			}

			String sqlCustomer = "UPDATE customer_information SET cust_fname=:firstName,cust_lname=:lastName,cust_email=:email,cust_contact=:contact,cust_gender=:gender WHERE cust_id=:id";
			MapSqlParameterSource parameters = new MapSqlParameterSource();
			parameters.addValue("firstName", customer.getFirstName());
			parameters.addValue("lastName", customer.getLastName());
			parameters.addValue("email", customer.getEmail());
			parameters.addValue("contact", customer.getContact());
			parameters.addValue("gender", customer.getGender());
			parameters.addValue("id", customer.getId());
			int rowCustomer = namedParameterJdbcTemplate.update(sqlCustomer, parameters);
			if (rowCustomer != 0) {
				status = true;
			}

		} catch (EmptyResultDataAccessException erdae) {
			LOGGER.error("Exception Occured.", erdae);

		}
		LOGGER.debug("updateAccount execution ended");
		return status;
	}

	@Override
	public boolean changePasswordAction(Customer customer, String newPassword, String oldPassword) {
		LOGGER.debug(" changePassword execution started");
		boolean status = false;

		try {
			String custOldPassword = customer.getPassword();
			MapSqlParameterSource parameters = new MapSqlParameterSource();
			if (custOldPassword.equals(oldPassword)) {
				String sqlUpdatePassword = "UPDATE customer_information SET cust_password=:password WHERE cust_id=:id";
				parameters.addValue("id", customer.getId());
				parameters.addValue("password", newPassword);
				int row = namedParameterJdbcTemplate.update(sqlUpdatePassword, parameters);
				if (row != 0) {
					status = true;
					customer.setPassword(newPassword);
				} else {
					status = false;
				}

			}

		} catch (EmptyResultDataAccessException erdae) {
			LOGGER.error("Exception Occured.", erdae);

		}
		LOGGER.debug(" changePassword execution ended");
		return status;
	}

}
