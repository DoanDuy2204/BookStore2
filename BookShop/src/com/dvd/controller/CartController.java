package com.dvd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.dvd.DAO.BookDAO;
import com.dvd.bean.Book;
import com.dvd.cart.Cart;
import com.dvd.cart.Item;

public class CartController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BookDAO bookDao = new BookDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		if(command==null) 
			command = "ADDCART";
		switch(command) {
		case "CART" :
			showCart(req,resp);
			break;
		case "ADDCART" :
			addCart(req,resp);
			break;
		case "BUY":
			buyCart(req,resp);
			break;
		case "DOWN":
			down(req,resp);
			break;
		case "UP":
			up(req,resp);
			break;
		}
	}
	//Show cart in menu
	private void showCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		if(cart==null) {
			req.setAttribute("notify", "Don't have book in cart.");
		}
		RequestDispatcher dispatcher = req.getRequestDispatcher("cart.jsp");
		dispatcher.forward(req, resp);
	}
	//Add cart in cart
	private void addCart(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int idBook = Integer.parseInt(req.getParameter("book_id"));
			HttpSession session = req.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			Book book = bookDao.findBookById(idBook);
			if (cart == null) {
				Item item = new Item(book,1);
				cart = new Cart();
				cart.addItem(item);
				session.setAttribute("cart", cart);
			}else {
				Item item = new Item(book,1);
				cart.addItem(item);
				session.setAttribute("cart", cart);
			}
			resp.sendRedirect("cart.jsp");
		} catch (SQLException e) {	e.printStackTrace();}
	}
	//Minus quantity of item in cart
	private void up(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int id = Integer.parseInt(req.getParameter("bookid"));
		double payCast = 0;
		JSONObject json = new JSONObject();
		for (Map.Entry<Integer, Item> m : cart.getItems().entrySet()) {
			if (m.getKey() == id) {
				int quantity = m.getValue().getQuantity();
				m.getValue().setQuantity(quantity + 1);
				json.put("quantity", new Double(m.getValue().getQuantity()));
				json.put("price", m.getValue().getQuantity()*m.getValue().getBook().getPriceAfterSale());
			}
			payCast += m.getValue().getQuantity()*m.getValue().getBook().getPriceAfterSale();
		}
		cart.setPayCast(payCast);
		json.put("sumcast", payCast);
		PrintWriter out = resp.getWriter();
		out.println(json);
	} 
	//Forward quantity of item in cart
	private void down(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		HttpSession session = req.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		int id = Integer.parseInt(req.getParameter("bookid"));
		double payCast = 0;
		JSONObject json = new JSONObject();
		for (Map.Entry<Integer, Item> m : cart.getItems().entrySet()) {
			if (m.getKey() == id) {
				int quantity = m.getValue().getQuantity();
				if(quantity>=1) {
					m.getValue().setQuantity(quantity - 1);
				}
				if(m.getValue().getQuantity()==0) {
					cart.removeItem(m.getValue());
				}
				json.put("quantity", new Double(m.getValue().getQuantity()));
				json.put("price", m.getValue().getQuantity()*m.getValue().getBook().getPriceAfterSale());
			}
			payCast += m.getValue().getQuantity()*m.getValue().getBook().getPriceAfterSale();
		}
		json.put("sumcast", payCast);
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
	private void buyCart(HttpServletRequest req, HttpServletResponse resp) {
	}

}
