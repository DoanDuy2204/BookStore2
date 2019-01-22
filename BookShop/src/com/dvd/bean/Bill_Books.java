package com.dvd.bean;

public class Bill_Books {

	private int id;
	private Book book;
	private Bill bill;
	private int quatity;
	public Bill_Books() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bill_Books(int id, Book book, Bill bill, int quatity) {
		super();
		this.id = id;
		this.book = book;
		this.bill = bill;
		this.quatity = quatity;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Bill getBill() {
		return bill;
	}
	public void setBill(Bill bill) {
		this.bill = bill;
	}
	public int getQuatity() {
		return quatity;
	}
	public void setQuatity(int quatity) {
		this.quatity = quatity;
	}
}
