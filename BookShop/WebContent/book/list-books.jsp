<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="container">
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<form action="BookController" method='get'>
		<input type="hidden" value="1" name="pageNumber">
		<input type="hidden" value="SEARCHBOOK" name="command">
		<input type="text" class="form-control" placeholder="Tìm sách...." name="search" style="display:inline;width:80%;"/>
		<button type="submit" class="btn btn-secondary"> Search</button>
	<table class="table table-bordered">
		<tr>
			<td>Id</td>
			<td>Name</td>
			<td>Category</td>
			<td>PublishHouse</td>
			<td>Price</td>
			<td>SrcImage</td>
			<td>SoldNumber</td>
			<td>Sale</td>
			<td>Update</td>
			<td>Edit</td>
			<td>Ghi chú</td>
		</tr>
		<c:forEach var="b" items="${books}" >
			<tr>
			<td>${b.id}</td>
			<td>${b.name}</td>
			<td>${b.getCategory().name}</td>
			<td>${b.getPublishHouse().name}</td>
			<td>${b.price}</td>
			<td>${b.srcImage}</td>
			<td>${b.soldNumber}</td>
			<td>${b.sale}%</td>
			<td><a href="BookController?command=DELETE&idBook=${b.id}">Delete</a></td>
			<td><a href="BookController?command=EDIT&idBook=${b.id}">Edit</a></td>
			<td></td>
			</tr>
		</c:forEach>
	</table>
	<div>
		<% int pageCount= (Integer) request.getAttribute("countPage");
		   int pageNumber = (Integer) request.getAttribute("pageNumber");
			for(int i = 1 ;i<=pageCount;i++){ %>
				<a href="BookController?command=MANAGERBOOK&pageNumber=<%=i%>" >
					<% if(pageNumber==i){ 
						out.print("<u>" + i + "</u>");
					}else{ 
						out.print(i); }%>
				</a>
			<% } %>
		<a href="BookController?command=ADD" style="position:absolute; right:130px;">Add new books</a>
	</div>
	</form>
</div>