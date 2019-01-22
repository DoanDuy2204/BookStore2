package com.dvd.cart;

import java.util.HashMap;
import java.util.Map;

import com.dvd.bean.Book;

public class Cart {
	Map<Integer,Item> items;
	private double payCast;

	public Map<Integer, Item> getItems() {
		return items;
	}
	public double getPayCast() {
		return payCast;
	}
	public void setPayCast(double payCast) {
		this.payCast = payCast;
	}
	public void setItems(Map<Integer, Item> items) {
		this.items = items;
	}
	public Cart(Map<Integer, Item> items) {
		super();
		this.items = items;
	}
	public Cart() {
		items = new HashMap<Integer,Item>();
	}
	
	//Add items to cart
	public void addItem(Item item) {
		Book book = item.getBook();
		if (items.isEmpty()) {
			items.put(item.getBook().getId(), item);
		} else {
			for (Map.Entry<Integer, Item> m : items.entrySet()) {
				if (m.getKey() == book.getId()) {
					int quantity = m.getValue().getQuantity();
					m.getValue().setQuantity(quantity + 1);
					return;
				}
			}
			items.put(book.getId(), item);
		}
	}

	//remove item
	public void removeItem(Item item) {
		items.remove(item.getBook().getId());
	}
}
