<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container">
	<form action="AuthorController" method="post">
	<input type="hidden" name="author_id" value="${author.id}">
	<input type="hidden" name="command" value="${author.id}">
	<table class="table table-bordered table-dark">
		<tr>
			<th>ID</th>
			<td><label class="form-control" >${author.getId()}</label> </td>	
		</tr>
		<tr>
			<td>Name</td>
			<td><input class="form-control" type="text" value="${author.name}" ></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="btn btn-secondary">Save</button>
			</td>
		</tr>
	</table>
	</form>	
</div>