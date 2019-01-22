package com.dvd.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dvd.bean.PublishHouse;
import com.dvd.connectionDao.ConnectionDao;

public class PublishHouseDAO {

	public Connection getConnection() {
		return ConnectionDao.getConnectionDao().getConnection();
	}
	public PublishHouse findPublishDaoById(int id) throws SQLException {
		String query = "select * from publishhouse where id="+id;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) {
			PublishHouse publishHouse = new PublishHouse(result);
			return publishHouse;
		}
		return null;
	}
	public List<PublishHouse> listPublishHouse() throws SQLException {
		List<PublishHouse> publishHouses = new ArrayList<PublishHouse>();
		String query = "select * from publishhouse ";
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) {
			PublishHouse publishHouse = new PublishHouse(result);
			publishHouses.add(publishHouse);
		}
		return publishHouses;
	}

}
