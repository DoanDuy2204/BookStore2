package com.dvd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dvd.DAO.AuthorDAO;
import com.dvd.DAO.BookDAO;
import com.dvd.bean.Author;
import com.dvd.bean.Book;

public class AuthorController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private AuthorDAO authorDao = new AuthorDAO();
	private BookDAO bookDao = new BookDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		if(command==null) 
			command = "MANAGERAUTHOR";
		switch(command) {
		case "MANAGERAUTHOR" : 
			managerAuthor(req,resp);
			break;
		case "ADD" :
			addAuthor(req,resp);
			break;
		case "EDIT" :
			editAuthor(req,resp);
			break;
		case "DELETE" :
			deleteAuthror(req,resp);
			break;
		}
	}

	private void managerAuthor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		listAuthor(req,resp,null);
		req.setAttribute("command", "manager");
		RequestDispatcher dispatcher = req.getRequestDispatcher("author/manager_author.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void addAuthor(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.setAttribute("command", "add");
		RequestDispatcher dispatcher = req.getRequestDispatcher("author/manager_author.jsp");
		dispatcher.forward(req, resp);
	}
	
	private void editAuthor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id_author = Integer.parseInt(req.getParameter("authorId"));
			Author author = authorDao.findAuthorById(id_author);
			req.setAttribute("author", author);
			req.setAttribute("command", "edit");
			List<Book> books = bookDao.listBook(0, bookDao.countBook(), id_author);
			req.setAttribute("books", books);
			RequestDispatcher dispatcher = req.getRequestDispatcher("author/manager_author.jsp");
			dispatcher.forward(req, resp);
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	private void deleteAuthror(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id_author = Integer.parseInt(req.getParameter("authorId"));
			authorDao.deteleAuthorById(id_author);
			managerAuthor(req, resp);
		} catch (SQLException e) {e.printStackTrace();}
	}

	private void listAuthor(HttpServletRequest req, HttpServletResponse resp,String name) {
		try {
			int pageNumber =Integer.parseInt(req.getParameter("pageNumber"));
			int countAuthor = authorDao.countAuthor(name);
			if(countAuthor==0) {
				req.setAttribute("notify", "List Empty");
				return;
			}
			int total = 10;
			int page = countAuthor/total;
			if((countAuthor%total)!=0)
				page++;
			List<Author> authors =  authorDao.findAuthor((pageNumber-1)*total,total,name);
			req.setAttribute("page",page);
			req.setAttribute("authors",authors);
			req.setAttribute("pageNumber", pageNumber);
		} catch (SQLException e) {e.printStackTrace();}
	}
}
