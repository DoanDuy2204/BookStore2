package com.dvd.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dvd.DAO.AuthorDAO;
import com.dvd.DAO.BookDAO;
import com.dvd.DAO.CategoryDAO;
import com.dvd.DAO.PublishHouseDAO;
import com.dvd.bean.Author;
import com.dvd.bean.Book;
import com.dvd.bean.Category;
import com.dvd.bean.PublishHouse;

public class BookController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BookDAO bookDao = new BookDAO();
	private CategoryDAO categoryDao = new CategoryDAO();
	private AuthorDAO authorDao = new AuthorDAO();
	private PublishHouseDAO publishHouseDao = new PublishHouseDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req,resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String command= req.getParameter("command");
		if(command==null)
			command="LISTBOOK";
		switch(command) {
		case "LISTBOOK" :
			listBooks(req,resp,null);
			break;
		case "SEARCH" :
			searchBook(req,resp);
			break;
		case "MANAGERBOOK" :
			managerBook(req,resp,null);
			break;
		case "DELETE" :
			deleteBook(req,resp);
			break;
		case "EDIT":
			editBook(req,resp);
			break;
		case "ADDBOOK":
			addBook(req,resp);
			break;
		case "SEARCHBOOK":
			searchBookByName(req,resp);
			break;
		case "SAVE" :
			saveBook(req,resp);
			break;
		case "ADD" :
			addBookForm(req,resp);
			break;
		case "INFORBOOK":
			inforBook(req,resp);
			break;
		case "CATEGORY" :
			categoryOfBook(req,resp,"category");
			break;
		case "PUBLISHHOUSE":
			publishHouse(req,resp,"publishhouse");
			break;
		case "SORT" :
			sortBook(req,resp,"publishHouse");
		}
	}
	private void sortBook(HttpServletRequest req, HttpServletResponse resp, String string) throws ServletException, IOException {
		String check = req.getParameter("check");
		listBook(req, resp, null, -1, check);
		req.setAttribute("check", check);
		RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
		dispatcher.forward(req, resp);
	}
	private void publishHouse(HttpServletRequest req, HttpServletResponse resp,String publishhouse) throws ServletException, IOException {
		int id_publishHouse = Integer.parseInt(req.getParameter("idPublishHouse"));
		listBook(req, resp, null, id_publishHouse,publishhouse);
		req.setAttribute("publish_house", "publish_house");
		req.setAttribute("id_publishHouse", id_publishHouse);
		RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
		dispatcher.forward(req, resp);
	}
	private void categoryOfBook(HttpServletRequest req, HttpServletResponse resp,String category) throws ServletException, IOException {
		int id_category = Integer.parseInt(req.getParameter("idCategory"));
		listBook(req, resp, null, id_category,category);
		req.setAttribute("category", "category");
		req.setAttribute("id_category", id_category);
		RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
		dispatcher.forward(req, resp);
	}
	//Display list book 
	private void listBooks(HttpServletRequest req, HttpServletResponse resp, String name) throws ServletException, IOException {
		listBook(req,resp,name,-1,null);
		RequestDispatcher dispatcher = req.getRequestDispatcher("home.jsp");
		dispatcher.forward(req, resp);
	}
	
	//Search books 
	private void searchBookByName(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nameBook = req.getParameter("search");
		listBook(req,resp,nameBook,-1,null);
		RequestDispatcher dispatcher = req.getRequestDispatcher("book/manager-book.jsp");
		dispatcher.forward(req, resp);
	}
	//Manager Book 
	private void managerBook(HttpServletRequest req, HttpServletResponse resp,String name) throws ServletException, IOException {
		listBook(req,resp,null,-1,null);
		RequestDispatcher dispatcher = req.getRequestDispatcher("book/manager-book.jsp");
		dispatcher.forward(req, resp);
	}
	
	//Delete book
	private void deleteBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("idBook"));
			bookDao.deleteBookById(id);
			managerBook(req, resp, null);
		} catch (SQLException e) {	e.printStackTrace();	}
	}
	//Edit book
	private void editBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("idBook"));
			Book book = bookDao.findBookById(id);
			List<Category> categorys = categoryDao.listCategory();
			List<Author> authors = authorDao.listAuthor();
			List<PublishHouse> publishHouses = publishHouseDao.listPublishHouse();
			req.setAttribute("book", book);
			req.setAttribute("categorys", categorys);
			req.setAttribute("authors", authors);
			req.setAttribute("authorOfBook", book.getAuthor());
			req.setAttribute("publishHouses", publishHouses);
			req.setAttribute("command", "EDIT");
			RequestDispatcher dispatcher = req.getRequestDispatcher("book/manager-book.jsp");
			dispatcher.forward(req, resp);
		} catch (SQLException e) {	e.printStackTrace();}
	}
	
	//Add book
	private void addBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String[] author = req.getParameterValues("author");
			String srcImage = req.getParameter("src-image");
			int saleBook = Integer.parseInt(req.getParameter("sale"));
			int idPublishHouse = Integer.parseInt(req.getParameter("publish_house"));
			double newPrice = Double.parseDouble( req.getParameter("price"));
			int soldNumber = Integer.parseInt(req.getParameter("sold-number"));
			int idCategory = Integer.parseInt(req.getParameter("category"));
			List<Author> authors = new ArrayList<Author>();
			for (String s : author) 
				authors.add(authorDao.findAuthorById(Integer.parseInt(s)));
			Book book = new Book( name, newPrice, srcImage, soldNumber, null,categoryDao.findCategoryById(idCategory)
					, publishHouseDao.findPublishDaoById(idPublishHouse),authors, saleBook);
			int row = bookDao.insertBook(book);
			if(row!=0) {
				managerBook(req, resp, null);
			}else {
				req.setAttribute("error", "Add don't success.");
				RequestDispatcher dispatcher = req.getRequestDispatcher("book/add-book.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	//Search book
	private void searchBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nameSearch = req.getParameter("search");
		req.setAttribute("name", nameSearch);
		req.setAttribute("search", "search");
		listBooks(req,resp,nameSearch);
	}
		
	//Save book
	private void saveBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int idBook = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String[] author = req.getParameterValues("author");
			String srcImage = req.getParameter("src-image");
			double saleBook = Double.parseDouble(req.getParameter("sale"));
			int idPublishHouse = Integer.parseInt(req.getParameter("publish_house"));
			double newPrice = Double.parseDouble(req.getParameter("price"));
			int soldNumber = Integer.parseInt(req.getParameter("sold-number"));
			int idCategory = Integer.parseInt(req.getParameter("category"));
			List<Author> authors = new ArrayList<Author>();
			for (String s : author) 
				authors.add(authorDao.findAuthorById(Integer.parseInt(s)));
			Book book = new Book(idBook,name,newPrice, srcImage, soldNumber, null, categoryDao.findCategoryById(idCategory),
					publishHouseDao.findPublishDaoById(idPublishHouse), authors,saleBook);
			
			int row1 = bookDao.updateBook(book);
			if(row1==0) {
				req.setAttribute("error", "Update don't sucsses.");
				editBook(req, resp);
			}else {
				managerBook(req,resp,null);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//Information of book
	private void inforBook(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int idBook = Integer.parseInt(req.getParameter("idBook"));
			Book book = bookDao.findBookById(idBook);
			req.setAttribute("book", book);
			RequestDispatcher dispatcher = req.getRequestDispatcher("book/infor.jsp");
			dispatcher.forward(req, resp);
		} catch (SQLException e) {e.printStackTrace();}	
	}
	//Move to add-form
	private void addBookForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			List<Category> categorys = categoryDao.listCategory();
			List<Author> authors;
			authors = authorDao.listAuthor();
			List<PublishHouse> publishHouses = publishHouseDao.listPublishHouse();
			req.setAttribute("categorys", categorys);
			req.setAttribute("authors", authors);
			req.setAttribute("publishHouses", publishHouses);
			req.setAttribute("command", "ADD");
			RequestDispatcher dispatcher = req.getRequestDispatcher("book/manager-book.jsp");
			dispatcher.forward(req, resp);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//List book
	private void listBook(HttpServletRequest req, HttpServletResponse resp,String nameBook,int id,String check) throws ServletException, IOException {
		try {
			String pageNumber = req.getParameter("pageNumber");
			if(pageNumber==null) {
				pageNumber = "1";
			}
			int page = Integer.parseInt(pageNumber.trim());
			int total = 12;
			int count = 0;
			List<Book> listbooks = new ArrayList<Book>();
			if(id==-1) {
				listbooks = bookDao.listBooks((page-1)*total, total, nameBook,check);
				count = bookDao.countBookByNameBook(nameBook);
			}
			if (check != null) {
				if (check.equals("category")) {
					listbooks = bookDao.listBook((page - 1) * total, total, id);
					count = bookDao.counBookByIdAuthor(id);
				}
				if (check.equals("publishhouse")) {
					listbooks = bookDao.listBookByPublishId((page - 1) * total, total, id);
					count = bookDao.counBookByIdPublish(id);
				}
			}
			int countPage = count/total;
			if(count%total!=0) {
				countPage++;
			}
			int rows = listbooks.size()/4;
			if(rows%4!=0) 
				rows++;
			req.setAttribute("books", listbooks);
			req.setAttribute("countPage", countPage);
			req.setAttribute("command", "command");
			req.setAttribute("pageNumber", page);
			req.setAttribute("rows", rows);
		} catch (SQLException e) {e.printStackTrace();	}
	}
}
