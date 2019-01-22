package com.dvd.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dvd.bean.Category;
import com.dvd.connectionDao.ConnectionDao;

public class CategoryDAO {

	public Connection getConnection() {
		return ConnectionDao.getConnectionDao().getConnection();
	}
	
	public Category findCategoryById(int id) throws SQLException {
		String query = "select * from category where id = "+id;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) {
			Category category = new Category(result);
			return category;
		}
		return null;
	}

	public List<Category> listCategory() throws SQLException {
		List<Category> categorys = new ArrayList<Category>();
		String query = "select * from category ";
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) {
			Category category = new Category(result);
			categorys.add(category);
		}
		return categorys;
	}

}
