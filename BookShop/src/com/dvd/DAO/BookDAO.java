package com.dvd.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dvd.bean.Book;
import com.dvd.connectionDao.ConnectionDao;

public class BookDAO {

	private AuthorBookDAO authorBookDao = new AuthorBookDAO();
		
	public Connection getConnection() {
		return ConnectionDao.getConnectionDao().getConnection();
	}
	public List<Book> listBooks(int start,int finish,String name,String check) throws SQLException{
		List<Book> books = new ArrayList<Book>();
		if(check!=null) {
			if(check.equals("hight"))
				check = " order by (price - price*sale/100) desc ";
			if(check.equals("short"))
				check = " order by (price - price*sale/100) asc ";
		}else {
			check = " ";
		}
		String query = "select * from books " 
						+ (name==null?" ":(" where name like '%"+name+"%' ")) 
						+ check
						+" limit "+start+","+finish ;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) {
			Book book = new Book(result);
			books.add(book);
		}
		return books;
	}
	public List<Book> listBook(int start,int finish,int id) throws SQLException{
		List<Book> books = new ArrayList<Book>();
		String query = "select * from books " 
						+ " where category_id="+id
						+" limit "+start+","+finish ;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) {
			Book book = new Book(result);
			books.add(book);
		}
		return books;
	}
	public List<Book> listBookByPublishId(int start,int finish,int id) throws SQLException{
		List<Book> books = new ArrayList<Book>();
		String query = "select * from books " 
						+ " where publishHouse_id="+id
						+" limit "+start+","+finish ;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) {
			Book book = new Book(result);
			books.add(book);
		}
		return books;
	}
	public int countBook() throws SQLException {
		String query = "select count(id) as count  from books";
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next())
			return result.getInt("count");
		return 0;
	}

	public int countBookByNameBook(String nameBook) throws SQLException {
		String query = "select count(id) as count from books "+(nameBook==null?"":("where name like '%"+nameBook+"%'"));
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) 
			return result.getInt("count");
		return 0;
	}
	public int counBookByIdAuthor(int id) throws SQLException {
		String query = "select count(id) as count from books "+(id==-1?"":("where category_id="+id));
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) 
			return result.getInt("count");
		return 0;
	}
	public int counBookByIdPublish(int id) throws SQLException {
		String query = "select count(id) as count from books "+"where publishHouse_id="+id;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) 
			return result.getInt("count");
		return 0;
	}
	public Book findBookById(int id) throws SQLException {
		String query = "select * from books where id="+id;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		if(result.next()) {
			Book book = new Book(result);
			return book;
		}
		return null;
	}
	public int updateBook(Book book) throws SQLException {
		String query = "update books set name=?,price=?,srcImage=?,soldNumber=?,category_id=?,publishHouse_id=? where id="+book.getId();
		PreparedStatement pre = getConnection().prepareStatement(query);
		pre.setString(1, book.getName());
		pre.setDouble(2,book.getPrice());
		pre.setString(3,book.getSrcImage());
		pre.setInt(4, book.getSoldNumber());
		pre.setInt(5, book.getCategory().getId());
		pre.setInt(6, book.getPublishHouse().getId());
		pre.executeUpdate();
		int row1 = authorBookDao.update(book);
		return row1;
	}
	public int deleteBookById(int id) throws SQLException {
		authorBookDao.deleteAuthorBookById(id);
		deleteInteractive(id);
		String query = "delete from books where id="+id;
		PreparedStatement pre= getConnection().prepareStatement(query);
		int row1 = pre.executeUpdate();
		return row1;
	}
	public int deleteInteractive(int id) throws SQLException {
		String query = "delete from interactive where book_id="+id;
		PreparedStatement pre = getConnection().prepareStatement(query);
		int row = pre.executeUpdate();
		return row;
	}
	public int idBookInsert() throws SQLException {
		String query = "select id from books order by id asc";
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		int i = 1;
		while(result.next()) {
			if(i!=result.getInt("id"))
				return i;
			i++;
		}
		return i;
	}
	public int insertBook(Book book) throws SQLException {
		String query = "insert into books(id,name,price,srcImage,soldNumber,category_id,publishHouse_id,sale) value(?,?,?,?,?,?,?,?)";
		PreparedStatement pre = getConnection().prepareStatement(query);
		book.setId(idBookInsert());
		pre.setInt(1,book.getId());
		pre.setString(2, book.getName());
		pre.setDouble(3, book.getPrice());
		pre.setString(4, book.getSrcImage());
		pre.setInt(5, book.getSoldNumber());
		pre.setInt(6, book.getCategory().getId());
		pre.setInt(7, book.getPublishHouse().getId());
		pre.setDouble(8, book.getSale());
	    pre.executeUpdate();
		int row1 = authorBookDao.insertBookById(book);
		return row1;
	}
}
