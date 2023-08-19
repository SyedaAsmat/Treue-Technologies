<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Online Book Store</title>
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
         
    /* styling search bar */
    .search input[type=text]{
        width:300px;
        height:25px;
        border-radius:25px;
        border: none;
    }
         
    .search{
        float:right;
        margin:7px;
    }
         
    .search button{
        background-color: #4aa1ff;
        color: white;
        float: right;
        padding: 5px 10px;
        margin-right: 16px;
        font-size: 12px;
        border: none;
        cursor: pointer;
    }
</style>
</head>
<body>
<div id="navlist">
        <a href="UserHome.jsp">Home</a>
        <a href="UserProfile.jsp"><%= session.getAttribute("uemail") %></a>
        <a href="MyOrder.jsp">My Orders</a>
        <a href="MyCart.jsp">My Cart</a>
        <a href="signout">Log Out</a>
 
        <!-- search bar right align -->
        <div class="search">
            <form action="SearchBook.jsp" name="search" autocomplete="off">
                <input type="text"
                       placeholder=" Search Courses"
                       name="search">
                <button>
                    <i class="fa fa-search"
                       style="font-size: 18px;">
                    </i>
                </button>
            </form>
        </div>
    </div>
</body>
</html>