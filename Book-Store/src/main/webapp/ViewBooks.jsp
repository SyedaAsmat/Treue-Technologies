<!DOCTYPE html>
<%@page import="bookstorepackage.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminHeader.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
<style>
body{
    	margin: 0;
    }
    .view-container{
    	padding-top: 50px;
    	text-align: center;
    	font-size: 40px;
    }
.form-title{
	color: black; 
	text-align: center;
	font-size: 40px;
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
</style>
</head>
<body>
    <div class="view-container">
    	<h2 class="form-title" style="">View Books</h2>
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
    		%>
    			<tr>
    				<td><%= rs.getString("id") %></td>
    				<td><%= rs.getString("bname") %></td>
    				<td><%= rs.getString("genre") %></td>
    				<td><%= rs.getString("author") %></td>
    				<td>Rs. <%= rs.getString("price") %></td>
    				<td><a href="EditBook.jsp?id=<%= rs.getString("id") %>">Edit</a></td>
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
</body>
</html>