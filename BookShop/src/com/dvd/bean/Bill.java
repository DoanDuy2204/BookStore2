package com.dvd.bean;

import java.util.Date;
import java.util.List;

public class Bill {

	private int id;
	private Customer customer;
	private List<Book> books;
	private List<Bill_Books> billBooks;
	private double payCount;
	private Date dob;
	public Bill(int id, Customer customer, List<Book> books) {
		super();
		this.id = id;
		this.customer = customer;
		this.books = books;
	}
	public Bill() {
		super();
		// TODO Auto-generated constructor stub
	}
	public List<Bill_Books> getBillBooks() {
		return billBooks;
	}
	public void setBillBooks(List<Bill_Books> billBooks) {
		this.billBooks = billBooks;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public double getPayCount() {
		return payCount;
	}
	public void setPayCount(double payCount) {
		this.payCount = payCount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
}
