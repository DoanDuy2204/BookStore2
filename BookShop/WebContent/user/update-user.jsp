<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="col-md-6 info-table">
	<form action="UserController" method="post">
		<table class="table table-bordered">
		<tr><td>
			<input type="hidden" value="UPDATE" name="command" >
			<input type="hidden" value="${user.username}" name="u_name">
			<input type="hidden" value="${user.customer.id}" name="id" >
		</td></tr>
			<tr>
				<td>User name :</td>
				<td><input type="text" value="${user.username}" name="username"
					class="form-control"></td>
			</tr>
			<tr>
				<td>Name :</td>
				<td><input type="text" value="${user.getCustomer().name}" name="name"
					class="form-control"></td>
			</tr>
			<tr>
				<td>Email :</td>
				<td><input type="text" value="${user.getCustomer().email}" name="email"
					class="form-control"></td>
			</tr>
			<tr>
				<td>Gender :</td>
				<td><input type="radio" name="gender" value="Male" id="male"
					<c:if test="${user.getCustomer().gender=='Male'}">
						checked
					</c:if>>
					<label for="male">Male</label> <input type="radio" name="gender"
					id="female" value="Female"
					<c:if test="${user.getCustomer().gender=='Female'}">
						checked
					</c:if>>
					<label for="female">Female</label></td>
			</tr>
			<tr>
				<td>Date of birth :</td>
				<td><input type="date" name="dob" class="form-control"
					value='${user.getCustomer().dob}'></td>
			</tr>
			<tr>
				<td>Number phone :</td>
				<td><input type="text" class="form-control" name="numberphone"
					value="${user.getCustomer().numberPhone}" class="form-control"></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: right;"><button type="submit"
						class="btn btn-secondary">Update</button></td>
			</tr>
			<c:if test="${error!=null}">
				<tr>
					<td>${error}</td>
				</tr>
			</c:if>
		</table>
	</form>
</div>
