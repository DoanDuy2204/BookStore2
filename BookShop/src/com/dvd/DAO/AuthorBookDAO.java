package com.dvd.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dvd.bean.Author;
import com.dvd.bean.Book;
import com.dvd.connectionDao.ConnectionDao;

public class AuthorBookDAO {

	public Connection getConnection() {
		return ConnectionDao.getConnectionDao().getConnection();
	}
	
	public List<Author> findAuthorsById(int id) throws SQLException {
		List<Author> authors = new ArrayList<Author>();
		String query = "select a.* from author_books ab "
				+ "inner join author a "
				+ "on a.id = ab.author_id "
				+ "inner join books b "
				+ "on b.id = ab.book_id "
				+ "where b.id = "+id;
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		while(result.next()) {
			Author author = new Author();
			author.setId(result.getInt("id"));
			author.setName(result.getString("name"));
			authors.add(author);
		}
		return authors;
	}

	public int deleteByIdOfBook(int book_id) throws SQLException {
		String query = "delete from author_books where book_id="+book_id;
		PreparedStatement pre = getConnection().prepareStatement(query);
		int row = pre.executeUpdate();
		return row;
	}
	
	public int update(Book book) throws SQLException {
		deleteByIdOfBook(book.getId());
		int counter = 1;
		for (Author a : book.getAuthor()) {
			int idauthor_books = countAuthor_Books();
			int id = ++idauthor_books;
			String query = "insert into author_books(id,book_id,author_id) values(" + id + "," + book.getId() + ","
					+ a.getId() + ");";
			PreparedStatement pre = getConnection().prepareStatement(query);
			int check = pre.executeUpdate();
			if (check != 0)
				counter++;
		}
		if (--counter == book.getAuthor().size())
			return counter;
		return 0;
	}

	private int countAuthor_Books() throws SQLException {
		String query = "select max(id) as count from author_books";
		PreparedStatement pre = getConnection().prepareStatement(query);
		ResultSet result = pre.executeQuery();
		if(result.next()) {
			int count = result.getInt("count");
			return count;
		}	
		return 0;
	}
	public int idAuthorBooks() throws SQLException {
		String query = "select id from author_books order by id asc ";
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
	public int insertBookById(Book book) throws SQLException {
		for(Author a:book.getAuthor()) {
			String query = "insert into author_books(id,book_id,author_id) values("+idAuthorBooks()+","+book.getId()+","+a.getId()+");";
			PreparedStatement pre = getConnection().prepareStatement(query);
			int row = pre.executeUpdate();
			if(row!=0){
				return row;
			}
		}
		return 0;
	}

	public int deleteAuthorBookById(int id) throws SQLException {
		String query = "delete from author_books where book_id="+id;
		Statement state = getConnection().createStatement();
		int row = state.executeUpdate(query);
		return row;
	}

	public int deleteBookByIdAuthor(int id_author) throws SQLException {
		String query = "delete from author_books where author_id="+id_author;
		Statement state = getConnection().createStatement();
		int row = state.executeUpdate(query);
		return row;
	}
}
