<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="UserHeader.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    /* styling navlist */
    body{
    	margin: 0;
    }
    .content-head{
    padding-top: 60px;
    text-align: center;
    }
    .content-head .on-head{
    	font-size: 30px;
    	color: #70797d;
    }
    .content-body .on-head{
    	color: #70797d;
    	font-size: 20px;
    	text-align: center;
    }
    table{
	margin-left: auto;
	margin-right: auto;
	font-size: 18px;
}
th, td{
	padding: 10px;
}
    </style>
</head>
<body>
<div class="shell">
    <div class="content-head">
    	<p class="on-head">My Orders</p>
    </div>
    <div class="content-body">
    	<p class="on-head">Yours Book are on the <b>Way</b></p>
    </div>
    <div class="book-container">
    <%
    String msg = request.getParameter("msg");
    if("notPossible".equals(msg)){
    	%>
    	<h4 class="alert">One item only. So Click on remove</h4>
    <%}%>
    <%
    if("inc".equals(msg)){
    	%>
    	<h4 class="alert">Quantity increased successfully</h4>
    <%}%>
    <%
    if("dec".equals(msg)){
    	%>
    	<h4 class="alert">Quantity decreased successfully</h4>
    <%}%>
    <%
    if("removed".equals(msg)){
    	%>
    	<h4 class="alert">Book successfully removed</h4>
    <%}%>
    	<form action="#">
    	<table>
    		<thead>
    			<tr>
    			<th>S. No.</th>
    				<th>Book Name</th>
    				<th>Genre</th>
    				<th>Price</th>
    				<th>Quantity</th>
    				<th>Sub Total</th>
    				<th>Order Date</th>
    				<th>Expected Delivery Date</th>
    				<th>Payment Method</th>
    				<th>Status</th>
    			</tr>
    		</thead>
    		<tbody>
    		<%
    		int sno = 0;
    		String uemail = session.getAttribute("uemail").toString();
    		try{
    			Connection con = ConnectionProvider.getCon();
    			Statement st = con.createStatement();
    			ResultSet rs = st.executeQuery("select * from cart inner join books where cart.bid = books.id and cart.uemail = '"+uemail+"' and cart.orderDate is not NULL");
    			while(rs.next()){
    				sno = sno + 1;
    		%>
    			<tr>
    				<td><% out.println(sno); %></td>
    				<td><%= rs.getString(15) %></td>
    				<td><%= rs.getString(16) %></td>
    				<td><%= rs.getString(5) %></td>
    				<td><%= rs.getString(4) %></td>
    				<td><%= rs.getString(6) %></td>
    				<td><%= rs.getString(9) %></td>
    				<td><%= rs.getString(10) %></td>
    				<td><%= rs.getString(11) %></td>
    				<td><%= rs.getString(13) %></td>
    			</tr>
    			<%
    			}
    		}catch(Exception e){
    			System.out.println(e);
    		}
    			%>
    		</tbody>
    	</table>
    </form>
    </div>
</div>
</body>
</html>