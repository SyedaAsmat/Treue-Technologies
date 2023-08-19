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
    		int z = 0;
    		try{
    			String search = request.getParameter("search");
    			
    			Connection con = ConnectionProvider.getCon();
    			Statement st = con.createStatement();
    			ResultSet rs = st.executeQuery("select * from books where bname like '%"+search+"%' or genre like '%"+search+"%' or author like '%"+search+"%'");
    			while(rs.next()){
    				z=1;
    		%>
    			<tr>
    				<td><%= rs.getString("id") %></td>
    				<td><%= rs.getString("bname") %></td>
    				<td><%= rs.getString("genre") %></td>
    				<td><%= rs.getString("author") %></td>
    				<td>Rs. <%= rs.getString("price") %></td>
    				<td><a href="AddToCart.jsp?id=<%= rs.getString("id") %></">Add to Cart</a></td>
    			</tr>
    			<%}
    			}catch(Exception e){
    				System.out.println(e);
    			}
    			%>
    		</tbody>
    	</table>
    	<div class="content-head">
    	<%if(z==0){ %>
    	<p class="on-head">Nothing to show</p>
    	<%} %>
    </div>
    </form>
    </div>
</div>
</body>
</html>