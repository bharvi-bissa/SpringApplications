package com.tadigital.entity;

import javax.servlet.http.Part;

public class Vendor {
	
	private String id;
	private String name;
	private String email;
	private String password;
	private String imgName;
	private Part imgPart;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public Part getImgPart() {
		return imgPart;
	}
	public void setImgPart(Part imgPart) {
		this.imgPart = imgPart;
	}
	
}
