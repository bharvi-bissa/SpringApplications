/*
 * Copyright (c) 2018, TechAspect Solutions Private Limited. All Rights Reserved.
 * TECHASPECT SOLUTIONS PRIVATE LIMITED PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 *
 */


package com.tadigital.mvc.entity;

import java.io.Serializable;

/**
 * The Address class represents a Address Record.
 * It includes properties for storing data and methods for
 * retrieving & setting values in the properties.
 * 
 * @author  Bharvi Bissa
 */
public class Address implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//PROPERTIES
	/** The value is used for int storage representing Address ID. */
	private int id;
	/** The value is used for int storage representing customer ID. */
	private int cust_id;
	/** The value is used for string storage representing Address's address. */
	private String address;
	/** The value is used for string storage representing Address's zip. */
	private String zip;
	/** The value is used for string storage representing Address's city. */
	private String city;
	/** The value is used for string storage representing Address's state. */
	private String state;
	/** The value is used for string storage representing Address's country. */
	private String country;
	
	/**
     * Retrieves the value of the property id.
     *
     * @return     A code int value.
     *             The ID of Address.
     */
	public int getId() {
		return id;
	}
	
	/**
     * Sets a value to the property id.
     *
     * @param      A int value.
     *              The ID of Address.
     */
	public void setId(int id) {
		this.id = id;
	}
	
	/**
     * Retrieves the value of the property cust_id.
     *
     * @return     A code int value.
     *             The ID of customer.
     */
	public int getCust_id() {
		return cust_id;
	}
	
	/**
     * Sets a value to the property cust_id.
     *
     * @param      A int value.
     *              The ID of customer.
     */
	public void setCust_id(Integer cust_id) {
		this.cust_id = cust_id;
	}
	
	/**
     * retrieves a value to the property address.
     *
     * @return      A string value.
     *             The address of Address.
     */
	public String getAddress() {
		return address;
	}
	
	/**
     * Sets a value to the property address.
     *
     * @param      A string value.
     *             The address of Address.
     */
	public void setAddress(String address) {
		this.address = address;
	}
	/**
     * retrieves a value to the property zip.
     *
     * @return      A string value.
     *             The zip property of Address.
     */
	public String getZip() {
		return zip;
	}
	
	/**
     * Sets a value to the property zip.
     *
     * @param      A string value.
     *             The zip of Address.
     */
	public void setZip(String zip) {
		this.zip = zip;
	}
	
	/**
     * retrieves a value to the property city.
     *
     * @return      A string value.
     *             The city property of Address.
     */
	public String getCity() {
		return city;
	}
	
	/**
     * Sets a value to the property city.
     *
     * @param      A string value.
     *             The city of Address.
     */
	public void setCity(String city) {
		this.city = city;
	}
	
	/**
     * retrieves a value to the property state.
     *
     * @return      A string value.
     *             The city of Address.
     */
	public String getState() {
		return state;
	}
	
	/**
     * Sets a value to the property state.
     *
     * @param      A string value.
     *             The state of Address.
     */
	public void setState(String state) {
		this.state = state;
	}
	
	/**
     * retrieves a value to the property country.
     *
     * @return      A string value.
     *             The country of Address.
     */
	public String getCountry() {
		return country;
	}
	
	/**
     * Sets a value to the property country.
     *
     * @param      A string value.
     *             The country of Address.
     */
	public void setCountry(String country) {
		this.country = country;
	}
	

}