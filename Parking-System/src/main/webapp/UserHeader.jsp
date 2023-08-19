<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Book Store</title>
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
        <a href="UserHome.jsp">Home</a>
        <a href="UserProfile.jsp"><%= session.getAttribute("uemail") %></a>
        <a href="ShowCost.jsp">Parking Cost</a>
        <a href="Booking.jsp">Book Parking</a>
        <a href="UserBookings.jsp">Your Bookings</a>
        <a href="signout">Log Out</a>
    </div>
</body>
</html>