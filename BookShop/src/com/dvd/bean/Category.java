package com.dvd.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Category {

	private int id;
	private String name;
	private String description;
	
	public Category(ResultSet result) throws SQLException {
		this.id = result.getInt("id");
		this.name = result.getString("name");
		this.description = result.getString("description");
	}
	public Category(int id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}
	public Category() {
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	
}
