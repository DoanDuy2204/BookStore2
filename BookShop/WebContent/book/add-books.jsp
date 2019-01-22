<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
<form action="BookController">
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<table class="table table-bordered">
		<h1>Add New Book</h1>
		<tr>
			<td>Name</td>
			<td><input type="text"  name="name"  class="form-control"></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><input type="text" name="price" class="form-control" ></td>
		</tr>
		<tr>
			<td>Src_image</td>
			<td><input type="text" name="src-image" class="form-control" ></td>
		</tr>
		<tr>
			<td>Category</td>
			<td>
				<select name="category" class="form-control">
					<c:forEach var="c" items="${categorys}">
						<option value="${c.id}"  >${c.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>Author</td>
			<td>
				<%! int i = 0; %>
					<c:forEach var="a" items="${authors}">
						<input	type="checkbox" name="author" value="${a.id}" >${a.name}
						<% if(i>4){ %>
							<br>
						<% i=0; }i++; %>	
					</c:forEach>
			</td>
		</tr>
		<tr>
			<td>Publish_house</td>
			<td>
				<select name="publish_house" class="form-control">
					<c:forEach var="p" items="${publishHouses}">
						<option value="${p.id}" >${p.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>Sale</td>
			<td><input type="text" name="sale" class="form-control" ></td>
		</tr>
		<tr>
			<td>Sold number</td>
			<td><input type="text" name="sold-number" class="form-control" ></td>
		</tr>
		<tr>
			<td></td>
			<td >
			<button type="submit" class="btn btn-secondary" >Save</button>
			<input type="hidden" value="ADDBOOK" name="command">
		</td></tr>
		<c:if test="${error!=null}">
		<tr>
			<td><label>${error}</label></td>
		</tr>
		</c:if>
	</table>
</form>
</div>