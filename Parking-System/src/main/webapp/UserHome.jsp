<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	if(session.getAttribute("uemail")==null){
		response.sendRedirect("login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="UserHeader.jsp" %>
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
    <p class="on-head"><b>WELCOME!!</b></p>
    	<p class="on-head">Book the <b>BEST</b> Space<br>
    		to park your car <b>HERE</b></p>
    </div>
    <div class="content-body">
    	<p class="on-head">Great spots with <b>Best Prices</b><br>under <b>one roof</b></p>
    	<p class="on-head"><b>Hurry! </b>Check our latest price on Parking Cost tab <b>NOW!!</b></p>
    </div>
</div>
</body>
</html>