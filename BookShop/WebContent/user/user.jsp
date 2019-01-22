<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>InforUser</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
	integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/home.css">
<script type="text/javascript" src="bootstrap/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<jsp:include page="/header/header.jsp"></jsp:include>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="container-fluid info">
		<div class="row" style="margin-top: 30px;">
			<div class="col-md-1"></div>
			<jsp:include page="/header/menuright.jsp"></jsp:include>
			<c:if test="${command=='info'}">
				<jsp:include page="information-user.jsp"></jsp:include>
			</c:if>
			<c:if test="${command=='update'}">
				<jsp:include page="update-user.jsp"></jsp:include>
			</c:if>
			<c:if test="${command=='transform-pass'}">
				<jsp:include page="transform-pass.jsp"></jsp:include>
			</c:if>
			<c:if test="${command=='history'}">
				<jsp:include page="history.jsp"></jsp:include>
			</c:if>
		</div>
	</div>
</body>
</html>