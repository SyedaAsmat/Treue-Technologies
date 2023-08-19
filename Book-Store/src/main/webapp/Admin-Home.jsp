<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="AdminHeader.jsp" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Admin Home</title>
<style>
body{
    	margin: 0;
    }
    .admin-container{
    	padding-top: 50px;
    	text-align: center;
    	font-size: 40px;
    }
</style>
</head>
<body>
<div id="navlist">
        <a href="Admin-Home.jsp">Home</a>
        <a href="AddBooks.jsp">Add Books</a>
        <a href="ViewBooks.jsp" onclick="viewbook">View Books</a>
        <a href="signout">Log Out</a>
    </div>
	<div class="admin-container">
		<h1>Welcome Admin</h1>
	</div>
</body>
</html>