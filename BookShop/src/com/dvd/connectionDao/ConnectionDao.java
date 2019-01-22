package com.dvd.connectionDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class ConnectionDao {

	private Connection connec;
	private static ConnectionDao connecDao ;
	
	public ConnectionDao() {
		String url = "jdbc:mysql://localhost:3306/book_storedb";
		String name = "root";
		String driver = "com.mysql.jdbc.Driver";
		String password = "Duy220498";
			try {
				Class.forName(driver).newInstance();
				connec =  DriverManager.getConnection(url, name, password);
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public static synchronized ConnectionDao getConnectionDao() {
		if(connecDao==null) {
			connecDao = new ConnectionDao();
		}
		return connecDao;
	}
	
	public Connection getConnection() {
		return connec;
	}
	
	public void closeConnec() {
		try {
			if (connec != null)
				connec.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
