<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*,com.dvd.bean.*,com.dvd.DAO.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	String command =(String)request.getAttribute("command");
	if(command!=null){
	List<Book> books = (List<Book>) request.getAttribute("books");
	int countPage = (Integer) request.getAttribute("countPage");
	int pageNumber = (Integer) request.getAttribute("pageNumber"); 
	int rows = (Integer) request.getAttribute("rows");
%>
<div class="col-md-10 content-right">
	<% 	int k = 0 ;
		if(rows==0)
			rows++;
		for(int i=0;i<rows;i++){ %>
	<hr style="padding:15px;"></hr>
	<div class="row">
		<%  int counter = 0 ;
			while(k<books.size()){
			if(counter>3)
				break;
			counter++; %>
			<div class="col-md-3">
				<div class="col-md-3-div1">
					<a href="BookController?command=INFOR&bookId=<%=books.get(k).getId()%>"> <img
						src="image/books/<%=books.get(k).getSrcImage()%>.jpg">
					</a>
					<div style="margin: 10px 25px;">
						<a style="color: #4a4848" href="BookController?command=INFOR&bookId=<%=books.get(k).getId()%>"> <%=books.get(k).getName()%>
						</a> 
						<a style="color: #A9a9a9; font-size: 11px" href="BookController?command=INFOR"> 
						<c:forEach var="a" items="${listbooks.getAuthor()}">${a.getName()} </c:forEach>
						</a> 
						<a href="BookController?command=INFOR&bookId=<%=books.get(k).getId()%>" style="font-size:15px">
							<b> <%= books.get(k).getPriceAfterSale() %><sup>đ</sup></b>
							<small style="color: #a9a9a9"><s><%= books.get(k).getPrice()%></s>
							<sup>đ</sup></small> <span style="color: red; padding: 5px;">-20%</span>
						</a>
					<a href="BookController?command=INFOR&bookId=<%=books.get(k).getId()%>" style="display:inline;" class="a-star">
						<%  double start = books.get(k).getStart();
					 		int count = 0; 
							for(int j=1;j<=start;j++){
								out.print("<i class='fas fa-star star' ></i>");
								count++;
								int a = j;
								if((start-j<=0.5)&(start-j!=0)){
									out.print("<i class='fas fa-star-half-alt star'></i>");
								 	count++;
								 }
							}
							if(count<5){
								for(int c=0;c<(5-count);c++){%>
								<i class="fas fa-star star far" ></i>
							<% }} %>
					</a>
					<a href="CartController?command=ADDCART&book_id=<%=books.get(k).getId()%>" style="display:inline;margin-left:15px;"><i class="fas fa-shopping-cart" title="Add to cart"></i>Cart</a>
				</div>
			</div>
		</div>
		<% k++;}%>
	</div>
	<% } %>
	<div class="row page">
		<% for(int i=1;i<=countPage;i++){	 %>
		<a href="BookController?pageNumber=<%=i%>
			<%	String name = (String) request.getAttribute("name");
				String search = (String) request.getAttribute("search");
				String category = (String) request.getAttribute("category");
				String publish_house = (String) request.getAttribute("publish_house");
				String check = (String) request.getAttribute("check");
				if(search!=null)
					out.print("&command=SEARCH&search="+name);
				if(category!=null){
					int id = (Integer) request.getAttribute("id_category");
					out.print("&command=CATEGORY&idCategory="+id);
				}
				if(publish_house!=null){
					int id_author = (Integer) request.getAttribute("id_publishHouse");	
					out.print("&command=PUBLISHHOUSE&idPublishHouse="+id_author);
				}
				if(check!=null){
					out.print("&command=SORT&check="+check);
				}
				%>"> 
		<% if(pageNumber==i){ 
			out.print("<u>" + i + "</u>"); %>
			</a>
		 <% }else{ out.print(i); }} %>
	</div>
</div>
<% }else{ %>
<jsp:forward page="/BookController">
	<jsp:param value="1" name="pageNumber" />
</jsp:forward>
<% } %>

