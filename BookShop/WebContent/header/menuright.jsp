<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-md-2 menu-right">
	<nav class="navbar-nav bg-dark">
		<ul class="navbar-nav">
			<li class="nav-item"><a href="UserController?command=INFORUSER"
				onclick="info()" class="nav-link"> Thông tin tài khoản </a></li>
			<li class="nav-item"><a href="UserController?command=UPDATEUSER"
				onclick="update()" class="nav-link"> Cập nhật thông tin </a></li>
			<li class="nav-item"><a
				href="UserController?command=CHANGEPASSWORD" class="nav-link">
					Thay đổi mật khẩu </a></li>
			<li class="nav-item"><a href="CartController?command=CART"
				class="nav-link"> Giỏ hàng </a></li>
			<li class="nav-item"><a
				href="UserController?command=HISTORYUSER" onclick="history()"
				class="nav-link"> Xem lịch sử mua </a></li>
			<li class="nav-item"><a
				href="UserController?command=DELETE" onclick="history()"
				class="nav-link"> Xóa tài khoản </a></li>
			<li class="nav-item"><a href="UserController?command=LOGOUT"
				class="nav-link"> Đăng xuất </a></li>
		</ul>
	</nav>
</div>