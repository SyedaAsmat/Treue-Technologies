<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Admin</title>
<style>
	#navlist {
        background-color: #bf8040;
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
        background-color: #4d3319;
        color: white;
    }
</style>
</head>
<body>
<div id="navlist">
        <a href="AdminHome.jsp">Home</a>
        <a href="AddMovie.jsp">Add Movies</a>
        <a href="ViewMovie.jsp">Movies</a>
        <a href="ViewUsers.jsp">Users</a>
        <a href="ViewSuggestions.jsp">Suggestions</a>
        <a href="signout">Log Out</a>
    </div>
</body>
</html>