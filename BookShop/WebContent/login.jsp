<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
	<jsp:include page="header/header.jsp"></jsp:include>
	<div class="container">
	<form action="UserController" method="post">
		<h1>Login Members</h1>
		<input type="text" name="username" class="form-control"/> 
		<input type="password" name="password" class="form-control" />
		<c:if test="${error!=null}">
			<span style="font-size: 15px; color: red; padding-left: 6px;">*Pass
				or user input wrong.</span>
		</c:if>
		<button type="submit" class="btn btn-secondary" value="LOGIN" name="submit">Login</button>
		<button type="submit" class="btn btn-secondary" value="REGISTER" name="submit">Register</button>
	</form>
	</div>
</body>
</html>