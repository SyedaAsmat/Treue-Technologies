<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	if(session.getAttribute("username")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<%@page import="parkingSystem.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="AdminHeader.jsp" %>
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
    	<p class="on-head">User Details</p>
    </div>
    <div class="book-container">
    	<form>
    	<table>
    		<thead>
    			<tr>
    			<th>Id</th>
    				<th>Name</th>
    				<th>Email</th>
    				<th>Contact</th>
    				<th>Address</th>
    				<th></th>
    			</tr>
    		</thead>
    		<tbody>
    		<%
    		try{
    			Connection con = ConnectionProvider.getCon();
    			Statement st = con.createStatement();
    			ResultSet rs = st.executeQuery("select * from users");
    			while(rs.next()){
    				//System.out.println("RS - > "+ rs.getString("id"));
    		%>
    			<tr>
    				<td><%= rs.getString("id") %></td>
    				<td><%= rs.getString("uname") %></td>
    				<td><%= rs.getString("uemail") %></td>
    				<td><%= rs.getString("ucontact") %></td>
    				<td><%= rs.getString("uadd") %></td>
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