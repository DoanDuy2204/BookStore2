<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="container" style="margin-top:30px;">
<form action="BookController">
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<table class="table table-bordered">
		<h1>Edit book</h1>
		<tr>
			<td>Name</td>
			<td><input type="text" value="${book.name}" name="name"  class="form-control"></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><input type="text" value="${book.price}" name="price" class="form-control" ></td>
		</tr>
		<tr>
			<td>Src_image</td>
			<td><input type="text" value="${book.srcImage}" name="src-image" class="form-control" ></td>
		</tr>
		<tr>
			<td>Category</td>
			<td>
				<select name="category" class="form-control">
					<c:forEach var="c" items="${categorys}">
						<option value="${c.id}" <c:if test="${book.category.id==c.id}">selected</c:if> >${c.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>Author</td>
			<td>
				<%! int i = 0; %>
					<c:forEach var="a" items="${authors}">
						<input	type="checkbox" name="author" value="${a.id}" 
						<c:forEach var="aob" items="${authorOfBook}">
							<c:if test="${aob.id==a.id}">checked</c:if>
						</c:forEach>
						>${a.name}
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
						<option value="${p.id}" <c:if test="${book.publishHouse.id==p.id}">selected</c:if> >${p.name}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>Sale</td>
			<td><input type="text" name="sale" value="${book.sale}" class="form-control" ></td>
		</tr>
		<tr>
			<td>Sold number</td>
			<td><input type="text" name="sold-number" value="${book.soldNumber}" class="form-control" ></td>
		</tr>
		<tr>
			<td></td>
			<td >
			<button type="submit" class="btn btn-secondary" >Save</button>
			<input type="hidden" value="SAVE" name="command">
			<input type="hidden" value="${book.id}" name="id" >
		</td></tr>
		<c:if test="${error!=null}">
		<tr>
			<td><label>${error}</label></td>
		</tr>
		</c:if>
	</table>
</form>
</div>