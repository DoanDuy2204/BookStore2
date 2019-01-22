<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
	.dropdown{
		position:relative;
		list-style-type: none;
		background: #ada8a8;
		padding: 5px;
		border: none;
	    border-radius: 4px;
    	color: white;
	}
	.dropdown ul{
		position:absolute;
		list-style-type: none;
		z-index:2;
		width:150px;
		top:34px;
		left:0px;
		display:none;
		
	}
	.dropdown ul li{
		background: #dcdcdc;
	}
	.dropdown a{
		padding: 9px 15px;
		display:block;
	}
	.dropdown a:hover{
		background:blue;
		color:red;
		cursor: pointer;
	}
	.dropdown:hover ul{
		display:block;
	}
</style>
<div class="row">
	<div class="col-md-12" style="padding: 0;">
		<nav class="navbar navbar-expand-sm bg-dark ">
			<ul class="nav">
				<li class="nav-item"><a href="" class="nav-link">Danh mục
						sản phẩm</a></li>
				<form class="form-inline form" action="BookController">
				<input type="hidden" name="command" value="SEARCH">
				<input type="hidden" name="pageNumber" value="1">
					<input class="form-control mr-sm-2" type="text" placeholder="Search" name="search" placeholder="Tìm kiếm sách....">
					<button class="btn btn-success" type="submit" id="search">Search</button>
				</form>
			</ul>
			<ul>
				<li class="dropdown">Sắp xếp theo
					<ul>
						<li style="border-radius:3px 3px 0 0;"><a href="BookController?command=SORT&check=hight">Giá cao-thâp</a></li>
						<li><a href="BookController?command=SORT&check=short">Giá thấp-cao</a></li>
						<li><a href="BookController?command=SORT&check=soldNumber">Bán chạy nhất</a></li>
						<li></li>
						<li style="border-radius:0 0 3px 3px ;"></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>
</div>
