package com.dvd.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Customer {
	 
	private int id;
	private String name;
	private String  address;
	private String gender;
	private String email;
	private Date dob;
	private String numberPhone;
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	public Customer(int id,String name,String address,String gender,String email,Date dob,String numberPhone) {
		this.id = id;
		this.name = name;
		this.address = address;
		this.gender = gender;
		this.email = email;
		this.dob = dob;
		this.numberPhone = numberPhone;
	}
	public Customer(int id, String name, String gender, String email, Date dob, String numberPhone) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.dob = dob;
		this.numberPhone = numberPhone;
	}

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Customer(ResultSet result) throws SQLException {
		this.id = result.getInt("id");
		this.name = result.getString("name");
		this.address = result.getString("address");
		this.email = result.getString("email");
		this.gender = result.getString("gender");
		this.dob = result.getDate("dob");
		this.numberPhone = result.getString("numberphone");
	}
	@Override
	public String toString() {
		return ",'" + name + "','" + address + "','" + email + "','" + gender + "','"
				+ sdf.format(dob) + "','" + numberPhone + "')";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getNumberPhone() {
		return numberPhone;
	}
	public void setNumberPhone(String numberPhone) {
		this.numberPhone = numberPhone;
	}
}
