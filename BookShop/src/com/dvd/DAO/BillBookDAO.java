package com.dvd.DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dvd.bean.Bill;
import com.dvd.bean.Bill_Books;
import com.dvd.bean.Book;
import com.dvd.bean.User;
import com.dvd.connectionDao.ConnectionDao;

public class BillBookDAO {
	
	public Connection getConnection() {
		return ConnectionDao.getConnectionDao().getConnection();
	}
	
	public List<Bill> printBillOfCustomer(User user) throws SQLException {
		String query = "select b.id as bill_id,bs.name,bs.price,bb.quantity,"
				+ "b.dob,bb.quantity*bs.price as payMoney " + 
				"from bill_books bb " + 
				"inner join bill b " + 
				"on b.id = bb.bill_id " + 
				"inner join books bs " + 
				"on bs.id = bb.book_id inner join customer c " + 
				"on c.id = b.customer_id " + 
				"inner join user u " + 
				"on u.customer_id = c.id " + 
				"where u.username='"+user.getUsername()+"'";
		Statement state = getConnection().createStatement();
		ResultSet result = state.executeQuery(query);
		List<Book> books = new ArrayList<Book>();
		List<Bill_Books> billBooks = new ArrayList<Bill_Books>();
		List<Bill> bills = new ArrayList<Bill>();
		Bill billOld = null;
		while(result.next()) {
			Bill bill = new Bill();
			bill.setId(result.getInt("bill_id"));
			if(billOld!=null && bill.getId()!=billOld.getId()) {
				bills.add(billOld);
				bill = new Bill();
				billBooks =new ArrayList<Bill_Books>();
				books = new ArrayList<Book>();
				
			}
			Book book = new Book();
			book.setName(result.getString("name"));
			book.setPrice(result.getDouble("price"));
			books.add(book);
			Bill_Books billBook = new Bill_Books();
			billBook.setQuatity(result.getInt("quantity"));
			billBooks.add(billBook);
			bill.setId(result.getInt("bill_id"));
			bill.setPayCount(result.getDouble("payMoney"));
			bill.setBooks(books);
			bill.setDob(result.getDate("dob"));
			bill.setBillBooks(billBooks);
			billOld = bill;
			if(result.isLast()) {
				bills.add(bill);
			}
		}
		return bills;
	}
}
