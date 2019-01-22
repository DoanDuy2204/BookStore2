package com.dvd.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class User {

	private String username;
	private String password;
	private Customer customer;
	private List<Bill> bills;
	public User(String username, Customer customer) {
		super();
		this.username = username;
		this.customer = customer;
	}
	public User(String username, String password, com.dvd.bean.Customer customer) {
		super();
		this.username = username;
		this.password = password;
		this.customer = customer;
	}
	
	public User(ResultSet result) throws SQLException {
		this.username = result.getString("username");
		this.password = result.getString("password");
		this.customer = new Customer(result);
	}

	public User() {
		super();
	}

	@Override
	public String toString() {
		return "'" + username + "','" + password + "'," +customer.getId()+")";
	}
	public List<Bill> getBills() {
		return bills;
	}
	public void setBills(List<Bill> bills) {
		this.bills = bills;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}
