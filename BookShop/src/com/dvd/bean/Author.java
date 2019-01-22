package com.dvd.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Author {

	private int id;
	private String name;
	private double profit;
	private int soldNumber;
	
	public Author(ResultSet result) throws SQLException {
		this.id =  result.getInt("id");
		this.name = result.getString("name");
	}

	public Author(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public double getProfit() {
		return profit;
	}
	
	public int getSoldNumber() {
		return soldNumber;
	}

	public void setSoldNumber(int soldNumber) {
		this.soldNumber = soldNumber;
	}

	public void setProfit(double profit) {
		this.profit = profit;
	}

	public Author() {
		super();
		// TODO Auto-generated constructor stub
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
}
