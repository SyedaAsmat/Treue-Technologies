<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parking Admin</title>
<style>
	#navlist {
        background-color: #A78295;
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
        background-color: #3F2E3E;
        color: white;
    }
</style>
</head>
<body>
<div id="navlist">
        <a href="AdminHome.jsp">Home</a>
        <a href="ChangeCost.jsp">Change Parking Cost</a>
        <a href="ViewUsers.jsp">User Details</a>
        <a href="AdminViewBookings.jsp">View Bookings</a>
        <a href="signout">Log Out</a>
    </div>
</body>
</html>