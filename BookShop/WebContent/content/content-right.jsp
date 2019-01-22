
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.dvd.bean.*,com.dvd.DAO.*" %>
<div class="col-md-2" style="padding: 0px;">
	<%	PublishHouseDAO publishDao = new PublishHouseDAO();
		CategoryDAO categoryDao = new CategoryDAO();
		List<PublishHouse> publishhouses = publishDao.listPublishHouse();
	 	List<Category> categorys = categoryDao.listCategory();
	 	request.setAttribute("authors", publishhouses);
	 	request.setAttribute("categorys", categorys); %>
	 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<nav class="navbar bg-dark navbar-dark">
		<ul class="navbar-nav menu-content-right">
			<li class="nav-item nav-item-list">Category</li>
			<c:forEach var="c" items="${categorys}">
				<li class="nav-item"><a href="BookController?command=CATEGORY&pageNumber=1&idCategory=${c.id}" class="nav-link">${c.name}</a></li>
			</c:forEach>
			<li class="nav-item nav-item-list">Publishing house	</li>
			<c:forEach var="a" items="${authors}">
				<li class="nav-item"><a href="BookController?command=PUBLISHHOUSE&pageNumber=1&idPublishHouse=${a.id}" class="nav-link" >${a.name}</a></li>
			</c:forEach>
		</ul>
	</nav>
</div>