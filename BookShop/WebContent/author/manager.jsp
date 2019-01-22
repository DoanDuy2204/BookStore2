<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*" %>
<div class="container">
	<h1>ManagerAuthor</h1>
	<table class="table table-bordered">
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>SoldNumber</th>
			<th>Profit</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach var="a" items="${authors}">
			<tr>
				<td>${a.id}</td>
				<td>${a.name}</td>
				<td>${a.soldNumber}
					<select>
						<option></option>
						<option></option>
						<option></option>
					</select>
				</td>
				<td>${a.profit}</td>
				<td><a href="AuthorController?command=EDIT&authorId=${a.id}">Edit</a></td>
				<td><a href="AuthorController?command=DELETE&authorId=${a.id}&pageNumber=${pageNumber}">Delete</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4" style="text-align:center;">
				<c:forEach var="p" begin="1" end="${page}">
					<c:if test="${p==pageNumber}">
						<u><a href="AuthorController?pageNumber=${p}">${p}</a></u>
					</c:if>
					<c:if test="${p!=pageNumber}">
						<a href="AuthorController?pageNumber=${p}">${p}</a>
					</c:if>
				</c:forEach>
			</td>
			<td colspan="2"><a href="AuthorController?command=ADD">Add new author</a></td>
		</tr>
	</table>
</div>