<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>D&Shop</title>
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
<script type="text/javascript" src="bootstrap/js/jquery-3.3.1.min.js">
</script>
</head>
<body>
	<jsp:include page="/header/header.jsp"></jsp:include>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${notify!=null}">
		List Author is empty.
	</c:if>
	<c:if test="${command=='manager'}">
		<jsp:include page="manager.jsp"></jsp:include>
	</c:if>
	<c:if test="${command=='edit'}">
		<jsp:include page="edit.jsp"></jsp:include>
	</c:if>
	<c:if test="${command=='add'}">
		<jsp:include page="add-form.jsp"></jsp:include>
	</c:if>
</body>
</html>