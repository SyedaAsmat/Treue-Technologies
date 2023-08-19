<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	if(session.getAttribute("uemail")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="UserHeader.jsp" %>
<html>
<head>

<meta charset="UTF-8">

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
	color: blue;
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
    	<p class="on-head">Stories New and Old.<br>
    		Find your story <b>HERE</b></p>
    </div>
    <div class="content-body">
    	<p class="on-head">Bestsellers with <b>Best Prices</b><br>under <b>one roof</b></p>
    </div>
    <div class="book-container">
    <%
    String msg = request.getParameter("msg");
    if("added".equals(msg)){
    	%>
    	<h4 class="alert" style="fonts-size:15px; color:green;">Added to cart</h4>
    <%}%>
    <%
    if("exist".equals(msg)){
    	%>
    	<h4 class="alert" style="fonts-size:15px; color:green;">Quantity increased in cart</h4>
    <%}%>
    <%
    if("invalid".equals(msg)){
    	%>
    	<h4 class="alert" style="fonts-size:15px; color:red;">Two copies of this book are already in cart.</h4>
    <%}%>
    	<form>
    	<table>
    		<thead>
    			<tr>
    			<th>Id</th>
    				<th>Book Name</th>
    				<th>Genre</th>
    				<th>Author</th>
    				<th>Price</th>
    				<th></th>
    			</tr>
    		</thead>
    		<tbody>
    		<%
    		try{
    			Connection con = ConnectionProvider.getCon();
    			Statement st = con.createStatement();
    			ResultSet rs = st.executeQuery("select * from books");
    			while(rs.next()){
    				//System.out.println("RS - > "+ rs.getString("id"));
    		%>
    			<tr>
    				<td><%= rs.getString("id") %></td>
    				<td><%= rs.getString("bname") %></td>
    				<td><%= rs.getString("genre") %></td>
    				<td><%= rs.getString("author") %></td>
    				<td>Rs. <%= rs.getString("price") %></td>
    				<td><a href="AddToCart.jsp?id=<%= rs.getString("id") %>">Add to Cart</a></td>
    			</tr>
    			<%}
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