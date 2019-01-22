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
<style type="text/css">
	#quantity{
		display:flex;
	}
	#number {
		line-height:48px;
	}
	#link{
		margin-left:10px;
		width : 26px;
		border-radius:3px;
		background:blue;
	}
	#link button{
		background:blue;
		border:none;
		width:100%;
		border-radius:3px;
	}
	#link i{
		width:100%;
		font-size:10px;
		color:white;
		text-align:center;
	}
	hr{
		width:80%;
		background:white;
		margin:0 auto;
	}
	#link button:hover{
		background:white;
		cursor: pointer;
		border-radius:3px;
	}
	#link button:hover i{
		background:white;
		cursor: pointer;
		color:black;
		border-radius:3px;
	}
	.b,.p{
		background:rgb(0,0,0,0);
		border:none;
		color:white;
	}
	#paycast:hover{
		cursor: pointer;
		background:blue;
	}
</style>
</head>
<body>
	<%@page import="com.dvd.cart.*,java.util.*,com.dvd.bean.*" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="/header/header.jsp"></jsp:include>
	<div class="container" >
		<c:if test="${notify!=null}">
		<table class="table table-dark">
				<tr><td><p>${notify}</p></td></tr>
		</table>	
		</c:if>
		<c:if test="${notify==null}">
			<% Cart cart =(Cart) session.getAttribute("cart"); double sumCast = 0; 	%>
			<table class="table table-border table-dark">
			<tr>
					<th></th>
					<th>Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Pay_cast</th>
			</tr>
			<%! int i = 0; %>
			<% for(Map.Entry<Integer,Item> c:cart.getItems().entrySet()){ %>
			<%	Item item = c.getValue();		
				Book book = c.getValue().getBook();
				double price = book.getPriceAfterSale()*item.getQuantity();
				sumCast+=price;
				%>
				<tr>
					<td><img src="image/books/<%=book.getSrcImage()%>.jpg" style="width:100px;"/></td>
					<td><%=book.getName()%></td>
					<td><%=book.getPriceAfterSale()%></td>
					<td><div id="quantity"><div id="number"><button class="b" value="<%=book.getId()%>"><%=item.getQuantity() %></button></div>
					<div id="link"><button value="<%=book.getId()%>" onclick="checkUp(this)"><i class="fas fa-plus"></i></button>
					<hr><button value="<%=book.getId()%>" onclick="checkDown(this)"><i class="fas fa-minus"></i></button></div></div></td>
					<td><button class="p"  value="<%=book.getId()%>"><%=price%></button></td>
				</tr>
				<% } %>
				<tr>
					<td colspan="4" style="text-align:right;">Money : </td>
					<td id="sumcast"><%=sumCast%></td>
				</tr>
				<tr>
					<td colspan="5" style="text-align:right;"><button class="btn btn-secondary" id="paycast" style="margin-right:100px;">PayCast</button></td>
				</tr>
			</table>
			<input type="hidden" value="<%=i %>" id="count">
		</c:if>
	</div>
	<script type="text/javascript">
		function checkDown(a){
			var bookid = $(a).val();
			$.ajax({
				type :'get',
				data:{bookid:bookid},
				url:"CartController?command=DOWN",
				dataType :'json',
				success:function (data){
					var c = $('.b');
					for(var i=0;i<c.length;i++){
						var check = c[i].value;
						if(bookid==check){
							c[i].innerHTML = data['quantity'];
							if(data['quantity']==0){
								location.reload(true);
							}
						}
					}
					var price = $('.p');
					for(var i=0;i<price.length;i++){
						var check = price[i].value;
						if(bookid==check){
							price[i].innerHTML = data['price'];
						}
					}
					$('#sumcast').html(data['sumcast']);
				}
			});
		}
		function checkUp(e){
			var bookid = $(e).val();
			$.ajax({
				type :'get',
				data:{bookid:bookid},
				dataType:'json',
				url:"CartController?command=UP",
				success:function (data){
					var c = $('.b');
					for(var i=0;i<c.length;i++){
						var check = c[i].value;
						if(bookid==check){
							c[i].innerHTML = data['quantity'];
						}
					}
					var price = $('.p');
					for(var i=0;i<price.length;i++){
						var check = price[i].value;
						if(bookid==check){
							price[i].innerHTML = data['price'];
						}
					}
					$('#sumcast').html(data['sumcast']);
				}
			});
		}
	</script>
</body>
</html>