<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
</head>
<body>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/header/header.jsp"></jsp:include>
	<c:if test="${command=='command'}">
		<jsp:include page="list-books.jsp"></jsp:include>
	</c:if>
	<c:if test="${command=='EDIT'}">
		<jsp:include page="edit-book.jsp"></jsp:include>
	</c:if>
	<c:if test="${command=='ADD'}" >
		<jsp:include page="add-books.jsp"></jsp:include>
	</c:if>
	<c:if test="${command='INFOR'}">
		<jsp:include page="infor_book.jsp" ></jsp:include>
	</c:if>
</body>
</html>