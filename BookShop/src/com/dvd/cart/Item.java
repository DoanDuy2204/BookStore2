package com.dvd.cart;

import com.dvd.bean.Book;

public class Item {
	
	private Book book;
	private int quantity;
	
	public Item(Book book) {
		super();
		this.book = book;
	}
	public Item(Book book, int quantity) {
		super();
		this.book = book;
		this.quantity = quantity;
	}
	public Item() {
		super();
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
