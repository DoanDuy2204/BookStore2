package com.dvd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dvd.DAO.BillBookDAO;
import com.dvd.DAO.CustomerDAO;
import com.dvd.DAO.UserDAO;
import com.dvd.bean.Bill;
import com.dvd.bean.Customer;
import com.dvd.bean.User;

public class UserController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UserDAO userDao = new UserDAO();
	private BillBookDAO billBookDao = new BillBookDAO();
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		String user_name = req.getParameter("username");
		if(user_name!=null) {
			if(userDao.checkUser(user_name)) {
				PrintWriter printer = resp.getWriter();
				printer.println(" *Username have been exists");
			}
		}else {
			String command = req.getParameter("command");
			switch(command) {
			case "INFORUSER":
				showInfomation(req,resp);
				break;
			case "UPDATEUSER" :
				updateInformation(req,resp);
				break;
			case "CHANGEPASSWORD" : 
				changePassword(req,resp);
				break;
			case "HISTORYUSER" :
				historyBuyBookOfUser(req,resp);
				break;
			case "LOGOUT" : 
				logoutUser(req, resp);
				break;
			case "DELETE" :
				delete(req,resp);
				break;
			}
		}} catch (SQLException e) {	e.printStackTrace();}
	}
	//Get user in session
		private User getUserInSession(HttpServletRequest req, HttpServletResponse resp){
			try {
				HttpSession session = req.getSession();
				String username = (String) session.getAttribute("username");
				User user = userDao.InfUser(username);
				return user;
			} catch (SQLException e) {e.printStackTrace();}
			return null;
		}
	//Show Information of user
	private void showInfomation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			User user = getUserInSession(req, resp);
			req.setAttribute("user", user);
			req.setAttribute("command", "info");
			RequestDispatcher dispatcher = req.getRequestDispatcher("user/user.jsp");
			dispatcher.forward(req, resp);
	}
	
	//Update data user
	private void updateInformation(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			User user = getUserInSession(req, resp);
			req.setAttribute("user", user);
			req.setAttribute("command", "update");
			RequestDispatcher dispatcher = req.getRequestDispatcher("user/user.jsp");
			dispatcher.forward(req, resp);
	}
	
	//Change pass word of User
	private void changePassword(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("command", "transform-pass");
		RequestDispatcher dispatcher = req.getRequestDispatcher("user/user.jsp");
		dispatcher.forward(req, resp);
	}
	
	//History buy book of User
	private void historyBuyBookOfUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			String username = (String) session.getAttribute("username");
			User user = userDao.InfUser(username);
			List<Bill> bills = billBookDao.printBillOfCustomer(user);
			req.setAttribute("bills", bills);
			req.setAttribute("command", "history");
			RequestDispatcher dispatcher = req.getRequestDispatcher("user/user.jsp");
			dispatcher.forward(req, resp);
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	//Logout User and invalidate session
	private void logoutUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		HttpSession session = req.getSession();
		session.invalidate();
		resp.sendRedirect("home.jsp");
	}
	
	//Delete account
	private void delete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			HttpSession session = req.getSession();
			String username =(String) session.getAttribute("username");
			userDao.deleteUser(username);
			session.invalidate();
			resp.sendRedirect("home.jsp");
		} catch (SQLException e) {e.printStackTrace();}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		String command =  req.getParameter("command");
		if(command==null) 
			command="LOGIN";
		switch(command) {
		case "LOGIN":
			loginUser(req,resp);
			break;
		case "REGISTER":
			registerUser(req,resp);
			break;
		case "CHECKCHANGEPASS":
			checkPass(req,resp);
			break;
		case "UPDATE" :
			update(req,resp);
			break;
		}
	}
	
	//Login user
	private void loginUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		try {
			int level = userDao.checkAccount(username,password);
			if(level==1) {
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				session.setAttribute("admin", "admin");
				RequestDispatcher dispatcher = req.getRequestDispatcher("BookController?pageNumber=1");
				dispatcher.forward(req, resp);
			}else if(level==0) {
				HttpSession session = req.getSession();
				session.setAttribute("username", username);
				RequestDispatcher dispatcher = req.getRequestDispatcher("BookController?pageNumber=1");
				dispatcher.forward(req, resp);
			}else {
				req.setAttribute("error","error");
				RequestDispatcher dispatcher = req.getRequestDispatcher("login.jsp");
				dispatcher.forward(req, resp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//Check pass when change password 
	private void checkPass(HttpServletRequest req, HttpServletResponse resp) throws ServletException,IOException {
		try {
			String password = req.getParameter("password");
			String newpass = req.getParameter("newpass");
			HttpSession session = req.getSession();
			String username =(String) session.getAttribute("username");
			User user = userDao.InfUser(username);
			if(user.getPassword().equals(password)) {
				userDao.updatePass(username,newpass);
				req.setAttribute("notify", "*Password was update success.");
				
			}else {
				req.setAttribute("error", "*Password isn't correct.");
			}
			changePassword(req,resp);
		} catch (SQLException e) {e.printStackTrace();}
	}
	
	//Register User 
	private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		try {
		String name = request.getParameter("u_name");
		String username = request.getParameter("userName");
		String password = request.getParameter("passWord");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String date = request.getParameter("dob");
		Date dob= sdf.parse(date);
		String numberPhone = request.getParameter("numberPhone");
		CustomerDAO customerDao = new CustomerDAO();
		UserDAO userDao = new UserDAO();
		Customer customer = new Customer(customerDao.countCustomer(),name,address,gender,email,dob,numberPhone);
		User user = new User(username,password,customer);
		int row = customerDao.addCustomer(customer);
		if(row!=0){
			int row1 = userDao.addUser(user);
			if(row1!=0){
				response.sendRedirect("home.jsp");
			}
		}} catch (ParseException | SQLException e) {e.printStackTrace();}
	}
	
	//Update user
	private void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("name");
			String username = req.getParameter("username");
			String u_name = req.getParameter("u_name");
			String email = req.getParameter("email");
			String gender = req.getParameter("gender");
			String numberPhone = req.getParameter("numberphone");
			String date = req.getParameter("dob");
			int idUser = Integer.parseInt(req.getParameter("id"));
			Date dob = sdf.parse(date.trim());
			Customer customer = new Customer(idUser,name,gender,email,dob,numberPhone);
			User user = new User(username,customer);
			int row1 = userDao.updateUser(user,u_name);
			if(row1!=0) {
				HttpSession session = req.getSession();
				session.setAttribute("username", user.getUsername());
				showInfomation(req,resp);
			}else {
				req.setAttribute("error", "update failed.");
				updateInformation(req, resp);
			}} catch (ParseException | SQLException e) {	e.printStackTrace();}
	}
	
}
