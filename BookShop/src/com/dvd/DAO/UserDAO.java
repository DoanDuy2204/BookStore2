package com.dvd.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dvd.bean.User;

import com.dvd.connectionDao.ConnectionDao;

public class UserDAO {

	private CustomerDAO customerDao = new CustomerDAO();
	public Connection getConnection() {
		return ConnectionDao.getConnectionDao().getConnection();
	}
	
	public int checkAccount(String username, String password) throws SQLException {
		String query = "select * from user where username=? and password =?";
		PreparedStatement pre = getConnection().prepareStatement(query);
		pre.setString(1, username);
		pre.setString(2, password);
		ResultSet result = pre.executeQuery();
		if(result.next()) {
				String node = result.getString("node");
				if(node!=null)
					return 1;
				return 0;
			}
		return -1;
	}

	public boolean checkUser(String username) throws SQLException {
		String query = "select * from user where username = '"+username+"'";
		PreparedStatement pre = getConnection().prepareStatement(query);
		ResultSet result = pre.executeQuery();
		if(result.next()) {
			return true;
		}
		return false;
	}
	
	public int addUser(User user) throws SQLException {
		String query = "insert into user(username,password,customer_id) values("+user.toString();
		PreparedStatement pre = getConnection().prepareStatement(query);
		int row = pre.executeUpdate();
		return row;
	}

	public User InfUser(String username) throws SQLException {
		User user  = new User();
		String query = "select * from user u "
				+ "inner join customer c "
				+ "on u.customer_id = c.id"
				+ " where username='"+username+"'";
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) {
			user = new User(result);
		}
		return user;
	}

	public void updatePass(String username, String password) throws SQLException {
		String query = "update user set password='"+password+"' where username='"+username+"'";
		PreparedStatement pre = getConnection().prepareStatement(query);
		pre.executeUpdate();
	}

	public int updateUser(User user,String username) throws SQLException {
		int row = customerDao.updateInfo(user.getCustomer());
		if(row!=0) {
			String query = "update user set username=? where username=?";
			PreparedStatement pre = getConnection().prepareStatement(query);
			pre.setString(1, user.getUsername());
			pre.setString(2,username);
			int row1 = pre.executeUpdate();
			return row1;
		}
		return 0;
	}

	public int deleteUser(String username) throws SQLException {
		String query = "delete from user where username=?";
		PreparedStatement pre = getConnection().prepareStatement(query);
		pre.setString(1, username);
		int row = pre.executeUpdate();
		return row;
	}
}
