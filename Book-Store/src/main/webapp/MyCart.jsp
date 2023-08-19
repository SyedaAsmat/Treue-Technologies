<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="UserHeader.jsp" %>
<html>
<head>
<meta charset="UTF-8">
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
label{
	text-decoration: bold;
}
input{
	height: 25px;
	width: auto;
}
input[type=text]:focus{
	border: 3px solid #555;
}
a{
	color: red;
	text-decoration: none;
}
input[type=submit]{
	text-align: center;
	background-color: #4aa1ff;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=submit]:focus{
	background-color: #1e4e82;
	color: white;
}
input[type=reset]{
	text-align: center;
	background-color: #9fc4ed;
	border: none;
	padding: 16px 16px 32px;
	text-decoration: none;
	font-size: 15px;
	margin: 4px 2px;
	cursor: pointer;
}
input[type=reset]:focus{
	background-color: #5e758f;
	color: white;
}
.alert{
text-align:center;
}
    </style>
</head>
<body>
<div class="shell">
    <div class="content-head">
    	<p class="on-head">My Cart</p>
    </div>
    <div class="content-body">
    	<p class="on-head">Yours Book are <b>One Click</b> away</p>
    </div>
    <div class="book-container">
    <%
    String msg = request.getParameter("msg");
    if("notPossible".equals(msg)){
    	%>
    	<h4 class="alert" style="color:red;">One item only. So Click on remove</h4>
    <%}%>
    <%
    if("inc".equals(msg)){
    	%>
    	<h4 class="alert" style="color:green;">Quantity increased successfully</h4>
    <%}%>
    <%
    if("dec".equals(msg)){
    	%>
    	<h4 class="alert" style="color:red;">Quantity decreased successfully</h4>
    <%}%>
    <%
    if("removed".equals(msg)){
    	%>
    	<h4 class="alert" style="color:green;">Book successfully removed</h4>
    <%}%>
    	<form action="AddressForOrder.jsp">
    	<table>
    		<thead>
    		<%
    		int total = 0;
    		int sno = 0;
    		String uemail = (String) session.getAttribute("uemail");
    		try{
    			Connection con = ConnectionProvider.getCon();
    			Statement st = con.createStatement();
    			ResultSet rs = st.executeQuery("select sum(total) from cart where uemail='"+uemail+"'");
    			
    			while(rs.next()){
    				total = rs.getInt(1);
    			}
    		%>
    			<tr>
    			<th>S. No.</th>
    				<th>Book Name</th>
    				<th>Genre</th>
    				<th>Author</th>
    				<th>Price</th>
    				<th>Quantity</th>
    				<th>Sub Total</th>
    				<th></th>
    			</tr>
    		</thead>
    		<tbody>
    		<%
    		ResultSet rs1 = st.executeQuery("select * from books inner join cart on books.id = cart.bid and cart.uemail = '"+uemail+"'");
    		while(rs1.next()){
    		
    		%>
    		
    			<tr>
    			<% sno = sno + 1; %>
    				<td><% out.println(sno); %></td>
    				<td><%= rs1.getString(2) %></td>
    				<td><%= rs1.getString(3) %></td>
    				<td><%= rs1.getString(4) %></td>
    				<td><%= rs1.getString(5) %></td>
    				<td><a href="IncDecQuantity.jsp?id=<%=rs1.getString(1)%>&quantity=inc"><i class="fa fa-plus" style="font-size:12px;color:red;"></i></a>&nbsp&nbsp&nbsp<%= rs1.getString(9) %>&nbsp&nbsp&nbsp
    				<a href="IncDecQuantity.jsp?id=<%=rs1.getString(1)%>&quantity=dec"><i class="fa fa-minus" style="font-size:12px;color:red;"></i></a></td>
    				<td><%= rs1.getString(11) %></td>
    				<td><a href="removeBook.jsp?id=<%= rs1.getString(1) %>">Remove</a></td>
    				<!--<td><a href="#?id=</">Remove</a></td>-->
    			</tr>
    			<%}
    		}catch(Exception e){
    			System.out.println(e);
    		}
    		%>
    		</tbody>
    	</table>
    	
    	<br><br>
    	<table>
    		<tr>
    			<td>Total Amount: Rs. <% out.println(total); %></td>
    			<td>
    			<%if(total > 0) {%>
    			<input type="submit" name="order" id="order" class="submit-btn" value="Check Out"/>
    			<%} %></td>
    		</tr>
    	</table>
    </form>
    </div>
</div>
</body>
</html>