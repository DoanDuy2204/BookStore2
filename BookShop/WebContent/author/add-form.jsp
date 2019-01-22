<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<h1>Add author</h1>
	<table class="table table-bordered table-dark">
		<tr>
			<td>Name</td>
			<td><input class="form-control" type="text" name="name_author" ></td>	
		</tr>
		<tr>
			<td>Book</td>
			<td><input type="text" class="form-control" name="book" list="books">
				<datalist class="form-control" id="books">
					<c:forEach var="b" items="${books}">
						<option value="${b.id}">${b.name}</option>
					</c:forEach>
				</datalist>
			</td>
		</tr>
		<tr>
			<td><button class="btn btn-secondary">Save</button></td>
		</tr>
	</table>
</div>