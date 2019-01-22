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
	<%  %>
	<jsp:include page="header/header.jsp"></jsp:include>
	<jsp:include page="banner/banner.jsp"></jsp:include>
	<div class="content">
		<div class="container-fluid">
			<jsp:include page="content/content-header.jsp"></jsp:include>
			<div class="row contentbook">
				<jsp:include page="content/content-right.jsp"></jsp:include>
				<jsp:include page="book/list-book.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
</html>