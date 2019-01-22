<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
		String username =(String) request.getAttribute("username");
		String admin =(String) request.getAttribute("admin");
	%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="header">
	<div class="container-fluid">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container">
				<ul class="navbar-nav">
					<li class="nav-item"><a href="home.jsp" class="navbar-brand"><img
							src="image/logo/logo_nav.png"></a></li>
					<li class="nav-item"><a href="home.jsp" class="nav-link">Trang
							chủ</a></li>
					<li class="nav-item"><a href="" class="nav-link">Danh mục</a></li>
					<li class="nav-item"><a href="info.jsp" class="nav-link">Liên
							hệ</a></li>
				</ul>
				<ul class="navbar-nav justity-content-end">
					<li class="nav-item"><a href="CartController?command=CART"
						class="nav-link">Giỏ hàng<i class="fas fa-cart-arrow-down"></i></a></li>
					<c:if test="${username==null}">
						<li class="nav-item"><a href="register.jsp" class="nav-link">Đăng
								ký</a></li>
						<li class="nav-item"><a href="login.jsp" class="nav-link">Đăng
								nhập</a></li>
					</c:if>
					<c:if test="${username!=null}">
						<li class="nav-item  menu-service"><a class="nav-link"><i class="fas fa-user-circle"></i>${username}</a>
							<ul class="navbar-nav">
								<li class="nav-item"><a
									href="UserController?command=INFORUSER" class="nav-link">
										Thông tin tài khoản </a></li>
								<li class="nav-item"><a
									href="UserController?command=UPDATEUSER" class="nav-link">
										Cập nhật tài khoản </a></li>
								<li class="nav-item"><a
									href="UserController?command=HISTORYUSER" class="nav-link">
										Xem lịch sử mua </a></li>
								<li class="nav-item"><a
									href="UserController?command=LOGOUT" class="nav-link"> Đăng
										xuất </a></li>
							</ul></li>
						<c:if test="${admin=='admin'}">
							<li class="nav-item menu-service"><a href="#"
								class="nav-link">Dịch vụ Admin</a>
								<ul class="navbar-nav">
									<li class="nav-item"><a href="BookController?command=MANAGERBOOK&pageNumber=1" class="nav-link">Manager Book</a></li>
									<li class="nav-item"><a href="AuthorController?command=MANAGERAUTHOR&pageNumber=1" class="nav-link">Manager Author</a></li>
									<li class="nav-item"><a href="CategoryController?command=MANAGERCATEGORY&pageNumber=1" class="nav-link">Manager Category</a></li>
								</ul></li>
						</c:if>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>
</div>