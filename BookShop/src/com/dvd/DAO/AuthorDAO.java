package com.dvd.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dvd.bean.Author;
import com.dvd.connectionDao.ConnectionDao;

public class AuthorDAO {

	private AuthorBookDAO author_bookDao = new AuthorBookDAO();
	public Connection getConnection() {
		return ConnectionDao.getConnectionDao().getConnection();
	}
	public List<Author> listAuthor() throws SQLException {
		List<Author> authors = new ArrayList<Author>();
		String query = "select * from author";
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) {
			Author author = new Author(result);
			authors.add(author);
		}
		return authors;
	}
	public Author findAuthorById(int idAuthor) throws SQLException {
		String query = "select * from author where id="+idAuthor;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) {
			Author author = new Author(result);
			return author;
		}
		return null;
	}
	public int countAuthor(String name) throws SQLException {
		String query ="Select count(id) as count from author "+(name==null?" ":" where name like '%"+name+"%'");
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next())
			return result.getInt("count");
		return 0;
	}
	public List<Author> findAuthor(int i, int total, String name) throws SQLException {
		String query =" SELECT a.id,a.name,sum(b.soldNumber) as soldNumber,sum(ab.revenue*b.price*b.soldNumber) as profit"
				+ " FROM author_books ab "
				+ "inner join books b "
				+ "on b.id=ab.book_id "
				+ "inner join author a "
				+ "on a.id=ab.author_id "
				+(name==null?" ":"where name like '%"+name+"%'")
				+" group by a.id"
				+" limit "+i+","+total;
		List<Author> authors = new ArrayList<Author>();
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) {
			Author author = new Author(result);
			author.setProfit(result.getDouble("profit"));
			author.setSoldNumber(result.getInt("soldNumber"));
			authors.add(author);
		}
		return authors;
	}
	public Map<Integer, String> findNameBookById(int id_author) throws SQLException {
		Map<Integer,String> books = new HashMap<Integer,String>();
		String query = "select b.name,a.id from author_books ab "
				+ " inner join books b "
				+ " on b.id=ab.book_id "
				+ " inner join author a "
				+ " on a.id = ab.author_id "
				+ " where a.id = "+id_author;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) 
			books.put(result.getInt("id"), result.getString("name"));
		return books;
	}
	public int deteleAuthorById(int id_author) throws SQLException {
		author_bookDao.deleteBookByIdAuthor(id_author);
		String query = " delete from author where id = ?";
		PreparedStatement pre = getConnection().prepareStatement(query);
		pre.setInt(1, id_author);
		int row = pre.executeUpdate();
		return row;
	}
}
