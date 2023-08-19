<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Admin</title>
<style>
	#navlist {
        background-color: #4aa1ff;
        position: absolute;
        width: 100%;
    }
         
    /* styling navlist anchor element */
    #navlist a {
        float:left;
        display: block;
        color: black;
        text-align: center;
        padding: 12px;
        text-decoration: none;
        font-size: 18px;
    }
     
    .navlist-right{
        float:right;
    }
 
    /* hover effect of navlist anchor element */
    #navlist a:hover {
        background-color: #1e4e82;
        color: white;
    }
</style>
</head>
<body>
<div id="navlist">
        <a href="Admin-Home.jsp">Home</a>
        <a href="AddBooks.jsp">Add Books</a>
        <a href="ViewBooks.jsp">View Books</a>
        <a href="signout">Log Out</a>
    </div>
</body>
</html>