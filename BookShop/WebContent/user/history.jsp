<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.dvd.bean.*,java.util.*"%>
<div class="col-md-6">
	<% 
		List<Bill> bills = (List<Bill>) request.getAttribute("bills");
 	%>
	<table class="table table-bordered">
		<tr>
			<td>STT</td>
			<td>Bill_id</td>
			<td>Name product</td>
			<td>Quantity</td>
			<td>Pay Cast</td>
			<td>Date of buy</td>
		</tr>
		<% int i=1;
			for(Bill b:bills){
				int j = 0;
				while(j<b.getBooks().size()){
		%>
		<tr>
			<td><%=i %></td>
			<td><%=b.getId() %></td>
			<td><%=b.getBooks().get(j).getName() %></td>
			<td><%=b.getBillBooks().get(j).getQuatity() %></td>
			<td><%=b.getPayCount() %></td>
			<td><%=b.getDob() %></td>
		</tr>
		<% 		j++;
				i++;
				}
			} %>
	</table>
</div>