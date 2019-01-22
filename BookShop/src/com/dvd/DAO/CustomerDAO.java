package com.dvd.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dvd.bean.Customer;
import com.dvd.connectionDao.ConnectionDao;

public class CustomerDAO {

	public Connection getConnection() {
		return ConnectionDao.getConnectionDao().getConnection();
	}
	
	public int addCustomer(Customer customer) throws SQLException {
		String query = "insert into customer(id,name,address,email,gender,dob,numberPhone) values("+countCustomer()+customer.toString();
		PreparedStatement pre = getConnection().prepareStatement(query);
		int row = pre.executeUpdate(query);
		return row;
	}
	public int countCustomer() throws SQLException {
		int count = 0;
		String query = "select max(id) as max from customer";
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) 
			count = result.getInt("max");
		return ++count;
	}

	public int updateInfo(Customer customer) throws SQLException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String query = "update customer set name=?,email=?,gender=?,dob=?,numberPhone=? where id=?";
		PreparedStatement pre = getConnection().prepareStatement(query);
		pre.setString(1,customer.getName());
		pre.setString(2, customer.getEmail());
		pre.setString(3, customer.getGender());
		pre.setString(4, sdf.format(customer.getDob()));
		pre.setString(5, customer.getNumberPhone());
		pre.setInt(6, customer.getId());
		int row = pre.executeUpdate();
		return row;
	}
}
